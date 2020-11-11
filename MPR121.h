// modified Adafruit MPR121 library

#ifndef MPR121_H
#define MPR121_H
 
#if (ARDUINO >= 100)
 #include "Arduino.h"
#else
 #include "WProgram.h"
#endif

#include <Wire.h>
#include <Debug.h>

#define MPR121_I2CADDR_DEFAULT 0x5A										// default I2C address

#ifndef _BV
#define _BV(bit) (1 << (bit)) 
#endif

#define MPR121_TOUCHSTATUS_L  0x00
#define MPR121_TOUCHSTATUS_H  0x01
#define MPR121_OORSTATUS_L    0x02
#define MPR121_OORSTATUS_H    0x03
#define MPR121_FILTDATA_0L    0x04
#define MPR121_FILTDATA_0H    0x05
#define MPR121_BASELINE_0     0x1E
#define MPR121_MHDR           0x2B
#define MPR121_NHDR           0x2C
#define MPR121_NCLR           0x2D
#define MPR121_FDLR           0x2E
#define MPR121_MHDF           0x2F
#define MPR121_NHDF           0x30
#define MPR121_NCLF           0x31
#define MPR121_FDLF           0x32
#define MPR121_NHDT           0x33
#define MPR121_NCLT           0x34
#define MPR121_FDLT           0x35

#define MPR121_TOUCHTH_0      0x41
#define MPR121_RELEASETH_0    0x42
#define MPR121_DEBOUNCE       0x5B
#define MPR121_CONFIG1        0x5C
#define MPR121_CONFIG2        0x5D
#define MPR121_CHARGECURR_0   0x5F
#define MPR121_CHARGETIME_1   0x6C
#define MPR121_ECR            0x5E
#define MPR121_AUTOCONFIG0    0x7B
#define MPR121_AUTOCONFIG1    0x7C
#define MPR121_UPLIMIT        0x7D
#define MPR121_LOWLIMIT       0x7E
#define MPR121_TARGETLIMIT    0x7F

#define MPR121_GPIODIR        0x76
#define MPR121_GPIOEN         0x77
#define MPR121_GPIOSET        0x78
#define MPR121_GPIOCLR        0x79
#define MPR121_GPIOTOGGLE     0x7A

#define MPR121_SOFTRESET      0x80

const uint8_t standard_keymap[] = { 1,2,3,6,8,5,7,0,9,4,12,11 };


//template <void (*functionPointer)(uint8_t, uint8_t), const uint8_t * keymap = standard_keymap, uint8_t i2c_addr = MPR121_I2CADDR_DEFAULT >
template <const uint8_t * keymap = standard_keymap, uint8_t i2c_addr = MPR121_I2CADDR_DEFAULT >
class MPR121 {
public:
	MPR121() {}
	~MPR121() {}

	void irq(void) {
		//DPRINT(':');
	}
	void init(uint8_t irq_pin) {
		_irqpin = irq_pin;																								// remember the signal pin
		pinMode(_irqpin, INPUT);																					// set the signal pin to input mode
		Wire.begin();																											// init the i2c library

		// reset MPR121 if not reset correctly
		write_register(MPR121_SOFTRESET, 0x63);														// soft reset 
		write_register(MPR121_ECR, 0x00);																	// stop mode
		delay(1);

		// show register config
		//for (uint8_t i=0; i<0x7F; i++) {
		//	DPRINT("$"); DHEX(i); 
		//	DPRINT(F(": 0x")); DHEXLN(readRegister8(i));
		//}

		uint8_t c = read_register_byte(MPR121_CONFIG2);										// check if there is a mpr121
		if (c != 0x24) {
			DPRINTLN(F("MPR121 not found, check wiring?"));
			_enabled = 0;
			return;
		}

		// mpr121 initial register setup - touch pad baseline filter
		// rising                                    
		write_register(MPR121_MHDR, 0x01);//01																// MAX HALF DELTA Rising
		write_register(MPR121_NHDR, 0x01);//01																// NOISE HALF DELTA Rising
		write_register(MPR121_NCLR, 0x00);//00//0E												// NOISE COUNT LIMIT Rising
		write_register(MPR121_FDLR, 0x00);//00														// DELAY LIMIT Rising
		// falling
		write_register(MPR121_MHDF, 0x01);																// MAX HALF DELTA Falling
		write_register(MPR121_NHDF, 0x01);//05														// NOISE HALF DELTA Falling
		write_register(MPR121_NCLF, 0xFF);//01														// NOISE COUNT LIMIT Falling
		write_register(MPR121_FDLF, 0x02);//00														// DELAY LIMIT Falling
		// touched
		write_register(MPR121_NHDT, 0x00);																// Noise half delta touched
		write_register(MPR121_NCLT, 0x00);																// Noise counts touched
		write_register(MPR121_FDLT, 0x00);																// Filter delay touched

		set_thresholds(10, 6);	//10,6																		// set threshold for touched, untouched

		// some general setup
		write_register(MPR121_DEBOUNCE, 0x22);														// touch -release debounce (2 checks)
		write_register(MPR121_CONFIG2, 0x23);															// response time = SFI(10) X ESI(8ms) = 80ms
		write_register(MPR121_CONFIG1, 0x80);															// FFI=18
		write_register(MPR121_AUTOCONFIG0, 0x8F);													// auto configuration
		write_register(MPR121_AUTOCONFIG1, 0x07);													// raise irq on error
		write_register(MPR121_UPLIMIT, 0xFF);//E4 //FF															// charge to 70% of Vdd , high sensitivity
		write_register(MPR121_LOWLIMIT, 0xCF);//94 //CF
		write_register(MPR121_TARGETLIMIT, 0xD9);//CD	//D9												// target limit close to low limit for more sensitivity
		write_register(MPR121_ECR, 0xCC);																	// 12 electrodes enabled

		_enabled = 1;
		DPRINTLN(F("MPR121 found!"));
	}
	void poll(void) {																										// poll function to maintain handover
		if (!_enabled) return;																						// init not done, or mpr121 not found
		if (digitalRead(_irqpin)) return;																	// nothing to do here while pin is low

		uint16_t reg02 = get_oor_state();																	// irq on error is enabled as well, read the error register 0x02 and 0x03
		if (reg02) {
			DPRINT(F("MPR121 error: 0x")); DHEXLN(reg02);
		}

		uint16_t curr = get_touched();																		// get the currently touched pads
		for (uint8_t i = 0; i < 12; i++) {

			if ((curr & _BV(i)) && !(_last & _BV(i))) {											// if touched and wasn't touched before
				activity(keymap[i], 1);
			}

			if (!(curr & _BV(i)) && (_last & _BV(i))) {											// if was touched and now isn't
				activity(keymap[i], 0);
			}
		}
		_last = curr;																											// save the touched state for next time check
	}

	virtual void activity(uint8_t key, uint8_t touched) {
		DPRINT(F("key: 0x")); DHEX(key); DPRINT(F(", ")); DPRINTLN(touched);// some debug message
	}

	void debug_print(void) {																						// debug print function
		//DPRINT("\t\t\t\t\t\t\t\t\t\t\t\t\t 0x"); DHEX(cap.touched());
		DPRINT(F("Filt:\t"));
		for (uint8_t i = 0; i < 12; i++) {
			DPRINT(get_filtered_data(i)); DPRINT('\t');
		}
		DPRINT('\n');

		DPRINT(F("Base:\t"));
		for (uint8_t i = 0; i < 12; i++) {
			DPRINT(get_baseline_data(i)); DPRINT('\t');
		}
		DPRINT('\n');
		delay(100);																													// put a delay so it isn't overwhelming
	}
	uint16_t get_filtered_data(uint8_t channel) {												// returns filtered data per channel
		if (channel > 12) return 0;																				// checks the max amount of channels
		return read_register_word(MPR121_FILTDATA_0L + channel * 2);			// reads the register
	}
	uint16_t get_baseline_data(uint8_t channel) {												// returns baseline data per channel
		if (channel > 12) return 0;																				// checks that we are in range with the channel
		uint16_t bl = read_register_byte(MPR121_BASELINE_0 + channel);		// reads the register
		return (bl << 2);																									// some bitshift to cleanup the value
	}
	uint16_t get_touched(void) {																				// returns the touched status of a channels
		uint16_t temp = read_register_word(MPR121_TOUCHSTATUS_L);					// reads the register
		return temp & 0x0FFF;																							// and cleans up the value
	}
	uint16_t get_oor_state(void) {																			// returns both out of range status bytes in a word
		uint16_t temp = read_register_word(MPR121_OORSTATUS_L);						// reads the register
		return temp;																											// and returns the value
	}
	void set_thresholds(uint8_t touched, uint8_t released) {						// set threshold to all channels
		for (uint8_t i = 0; i < 12; i++) {																// step through channel registers
			write_register(MPR121_TOUCHTH_0 + 2 * i, touched);							// write touch threshold
			write_register(MPR121_RELEASETH_0 + 2 * i, released);						// write release threshold
		}
	}

private:
	uint8_t  _enabled;
	uint8_t  _irqpin;	
	uint16_t _last;

	uint8_t read_register_byte(uint8_t address) {												// read register byte
		Wire.beginTransmission(i2c_addr);
		Wire.write(address);
		Wire.endTransmission(false);
		Wire.requestFrom(i2c_addr, (uint8_t)1);
		if (Wire.available() < 1)
			return 0;
		return (Wire.read());
	}
	uint16_t read_register_word(uint8_t address) {											// read register word
		Wire.beginTransmission(i2c_addr);
		Wire.write(address);
		Wire.endTransmission(false);
		Wire.requestFrom(i2c_addr, (uint8_t)2);
		if (Wire.available() < 2)
			return 0;
		uint16_t v = Wire.read();
		v |= ((uint16_t)Wire.read()) << 8;
		return v;
	}
	void write_register(uint8_t address, uint8_t value) {								// writes a byte to a register
		Wire.beginTransmission(i2c_addr);
		Wire.write((uint8_t)address);
		Wire.write((uint8_t)(value));
		Wire.endTransmission();
	}
};


// mapper macro for pin interrupt assignment
#define mpr121ISR(itf,pin) class itf##ISRHandler { \
  public: \
  static void isr () { itf.irq(); } \
}; \
itf.init(pin); \
if( digitalPinToInterrupt(pin) == NOT_AN_INTERRUPT ) \
  enableInterrupt(pin,itf##ISRHandler::isr,CHANGE); \
else \
  attachInterrupt(digitalPinToInterrupt(pin),itf##ISRHandler::isr,CHANGE);



#endif 