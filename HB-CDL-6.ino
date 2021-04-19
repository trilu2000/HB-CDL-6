//- -----------------------------------------------------------------------------------------------------------------------
// AskSin++
// 2016-10-31 papa Creative Commons - http://creativecommons.org/licenses/by-nc-sa/3.0/de/
//- -----------------------------------------------------------------------------------------------------------------------

// define this to read the device id, serial and device type from bootloader section
// #define USE_OTA_BOOTLOADER
#include "key.h"
#define USE_AES   //0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0a,0x0b,0x0c,0x0d,0x0e,0x0f,0x10
#define HM_DEF_KEY_INDEX 0

#define EI_NOTEXTERNAL
#include <EnableInterrupt.h>
#include <LowPower.h>
#include <AskSinPP.h>
#include <Register.h>
#include <MultiChannelDevice.h>
#include <Buzzer.h>
#include <FastLED.h>
#include "MPR121.h"


#define BUZZER_PIN 5
#define LED1_PIN 14
#define LED2_PIN 15
#define CONFIG_BUTTON_PIN 8
#define TOUCH_IRQ_PIN 17 

#define BACKLED_PIN 9
#define NUMBER_LEDS 8

// - maps touchkeys against the input lines --------------------------
// input key map:             1 ,2  ,3  ,4  ,5,  6,  7,  8,  9,  0, 11 ,12
const uint8_t keymap[12] = { 11,'7','4','1','8','0','5','2','3','6','9',12 };

// - password master for codelock class ------------------------------
const uint8_t master_pwd[9] = { 0xff,'1','2','3','4','5','6','7','8', };

// number of available peers per channel
#define PEERS_PER_CHANNEL 10

// number of password slots
#define NR_CDL_CHANNELS 6

// all library classes are placed in the namespace 'as'
using namespace as;

// define all device properties
const struct DeviceInfo PROGMEM devinfo = {
	{0x37, 0x6F, 0xF8},     // Device ID
	"HB69303328",           // Device Serial
	{0xF6,0xA9},            // Device Model
  0x01,                   // Firmware Version
  as::DeviceType::PushButton, // Device Type
  {0x00,0x00}             // Info Bytes
};

// - LED class to drive the background LEDs of the touch display -----
class cLED {
	CRGB leds[NUMBER_LEDS];
	uint8_t bright_mode, color_mode;
public:
	enum eBRIGHT { DIMMED = 0, TOUCHED };
	enum eCOLOR { OPERATE = 0, PROGRAM };
	uint8_t color[2], bright[2];

	cLED() { FastLED.addLeds<NEOPIXEL, BACKLED_PIN>(leds, NUMBER_LEDS); }
	~cLED() {}

	void set_bright_mode(eBRIGHT value) {
		bright_mode = value;
		update();
	}
	void set_color_mode(eCOLOR value) {
		color_mode = value;
		update();
	}
	void update() {
		CRGB rgb;
		hsv2rgb_rainbow(CHSV(color[color_mode], 255, bright[bright_mode]), rgb);
		for (uint8_t i = 0; i < NUMBER_LEDS; i++) {
			leds[i] = rgb;
		}
		FastLED.show();
	}
};
cLED backLed;

/**
 * Configure the used hardware
 */
typedef AvrSPI<10, 11, 12, 13> RadioSPI;
typedef Radio<RadioSPI,2> RadioType;
typedef DualStatusLed<LED1_PIN, LED2_PIN> LedType;
typedef Buzzer<BUZZER_PIN> BuzzerType;
typedef AskSin<LedType, NoBattery, RadioType, BuzzerType > HalType;
class Hal : public HalType {
public:
	void init (const HMID& id) {
		HalType::init(id);
  }
  bool runready () {
		return HalType::runready() || sysclock.runready();
	}
};
Hal hal;


// - List0 definition, needed for maintenance device -----------------
#define DREG_ACTIVE_COLOR 0x2E
#define DREG_PROGRAM_COLOR 0x2F
#define DREG_TOUCHED_BRIGHT 0x30
#define DREG_DIMMED_BRIGHT 0x31
#define DREG_RINGER_CHANNEL 0x32
DEFREGISTER(CDLReg0, MASTERID_REGS, DREG_TRANSMITTRYMAX, DREG_BUZZER_ENABLED, DREG_ACTIVE_COLOR, DREG_PROGRAM_COLOR, DREG_TOUCHED_BRIGHT, DREG_DIMMED_BRIGHT, DREG_RINGER_CHANNEL)
class CDLList0 : public RegList0<CDLReg0> {
public:
	CDLList0(uint16_t addr) :
		RegList0<CDLReg0>(addr) {
	}

	uint8_t activeColor() const { return this->readRegister(DREG_ACTIVE_COLOR, 0); }
	bool activeColor(uint8_t value) const { return writeRegister(DREG_ACTIVE_COLOR, value); }

	uint8_t programColor() const { return this->readRegister(DREG_PROGRAM_COLOR, 0); }
	bool programColor(uint8_t value) const { return writeRegister(DREG_PROGRAM_COLOR, value); }

	uint8_t touchedBright() const { return this->readRegister(DREG_TOUCHED_BRIGHT, 0); }
	bool touchedBright(uint8_t value) const { return writeRegister(DREG_TOUCHED_BRIGHT, value); }

	uint8_t dimmedBright() const { return this->readRegister(DREG_DIMMED_BRIGHT, 0); }
	bool dimmedBright(uint8_t value) const { return writeRegister(DREG_DIMMED_BRIGHT, value); }

	uint8_t ringerChannel() const { return this->readRegister(DREG_RINGER_CHANNEL, 0x07, 0, 0); }
	bool ringerChannel(uint8_t value) const { return writeRegister(DREG_RINGER_CHANNEL, 0x07, 0, value); }

	void defaults() {
		clear();
		buzzerEnabled(true);
		transmitDevTryMax(2);
		activeColor(100);
		programColor(0);
		touchedBright(150);
		dimmedBright(30); 
		ringerChannel(6);
	}
};

// - List1 definition, needed for all cdl channels -------------------
DEFREGISTER(CDLReg1, CREG_AES_ACTIVE, 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, )
class CDLList1 : public RegList1<CDLReg1> {
public:
	CDLList1(uint16_t addr) : RegList1<CDLReg1>(addr) {}

	void byte_array(uint8_t slot, uint8_t* value) const {
		DPRINT(F("write: ")); DHEXLN(value, 9);
		uint8_t offset = 0x36 + (slot * 9);
		for (uint8_t i = 0; i < 9; i++) {
			this->writeRegister(offset + i, value[i] & 0xff);
		}
	}

	uint8_t* byte_array(uint8_t slot) const {
		static uint8_t temp_byte_array[9];
		uint8_t offset = 0x36 + (slot * 9);
		for (uint8_t i = 0; i < 9; i++) {
			temp_byte_array[i] = this->readRegister(offset + i);
		}
		//DPRINT("read:"); DHEXLN(temp_byte_array, 9);
		return temp_byte_array;
	}

	void defaults() {
		clear();
	}
};

// - channel definition, manage state() and first init ---------------
template<class HALTYPE, int PEERCOUNT, class List0Type, class List1Type>
class CDLChannel : public Channel<HALTYPE, List1Type, EmptyList, DefList4, PEERCOUNT, List0Type> {
	uint8_t repeatcnt;

public:
	typedef Channel<HALTYPE, List1Type, EmptyList, DefList4, PEERCOUNT, List0Type> BaseChannel;

	CDLChannel() : BaseChannel(), repeatcnt(0) {}
	virtual ~CDLChannel() {}

	uint8_t status() const { return 0; }
	uint8_t flags() const {	return 0; }
	bool configChanged() { return true; }

	// virtual void state(uint8_t s) {
	void state(uint8_t s) {
		DHEX(BaseChannel::number()); DPRINTLN(F(" released"));
		RemoteEventMsg& msg = (RemoteEventMsg&)this->device().message();
		msg.init(this->device().nextcount(), this->number(), repeatcnt, 0, 0);
		this->device().sendPeerEvent(msg, *this);
		repeatcnt++;
	}

	void firstinit() {
		uint8_t temp_byte_array[9];
		memset(temp_byte_array, 0x00, 9);
		for (uint8_t i = 0; i < 2; i++) {
			//DPRINT("finit "); DPRINT(number()); DPRINT(", "); DPRINTLN(i);
			uint8_t *temp = temp_byte_array;
			if ((this->number() == 1) && (i == 0)) temp = master_pwd;
			this->getList1().byte_array(i, temp);
		}
	}
};

typedef CDLChannel<Hal, PEERS_PER_CHANNEL, CDLList0, CDLList1> CdlChannel;

// - device definition, registers all single channels ----------------
template <class HalType, class ChannelType, int ChannelCount, class List0Type>
class CDLChannelDevice : public ChannelDevice<HalType, ChannelType, ChannelCount, List0Type> {
	ChannelType cdata[ChannelCount];

public:
	typedef CDLChannelDevice<HalType, ChannelType, ChannelCount, List0Type> DeviceType;
	uint8_t ringer_channel;

	CDLChannelDevice(const DeviceInfo& i, uint16_t addr) : ChannelDevice<HalType, ChannelType, ChannelCount, List0Type>(i, addr) {
		for (uint8_t i = 0; i < ChannelCount; ++i) {
			this->registerChannel(cdata[i], i + 1);
		}
	}
	virtual ~CDLChannelDevice() {}

	void configChanged() {
		buzzer().enabled(getList0().buzzerEnabled());
		ringer_channel = this->getList0().ringerChannel();
		backLed.color[cLED::eCOLOR::OPERATE] = hmByteToByte(this->getList0().activeColor());
		backLed.color[cLED::eCOLOR::PROGRAM] = hmByteToByte(this->getList0().programColor());
		backLed.bright[cLED::eBRIGHT::TOUCHED] = hmByteToByte(this->getList0().touchedBright());
		backLed.bright[cLED::eBRIGHT::DIMMED] = hmByteToByte(this->getList0().dimmedBright());
		backLed.update();
	}
	uint8_t hmByteToByte(uint8_t value) {
		uint16_t ret = value * 255;
		return ret /= 200;
	}
};

typedef CDLChannelDevice<Hal, CdlChannel, NR_CDL_CHANNELS, CDLList0> CodelockDevice;

// - creation of the homebrew device ---------------------------------
CodelockDevice  sdev(devinfo, 0x20);
ConfigButton<CodelockDevice> cfgBtn(sdev);
// - -----------------------------------------------------------------


// - codelock class to manage all activity ---------------------------
template<const uint8_t * keymap = standard_keymap, uint8_t i2c_addr = MPR121_I2CADDR_DEFAULT >
class CodeLock : public Alarm, public MPR121<keymap>  {

	class Buffer {
		uint8_t store[11];																								// store to handle password input
		uint8_t cnt;																											// position counter for buffer
	public:
		Buffer() {}
		~Buffer() {}

		void add(uint8_t raw) {																						// adds half bytes to the buffer array
			if (cnt >= 11) cnt = 10;																				// we overwrite last byte if the buffer is full
			store[cnt] = raw;
			if (cnt < 3) store[cnt] &= 0x0f;																// first 3 digits as integer, password as ascii number string
			//DPRINT("add: "); DHEX(raw);	DPRINT(", cnt: "); DPRINT(cnt); DPRINT(", store: "); DHEXLN(store, sizeof(store));
			cnt++;
		}
		void clear() {																										// clears the buffer array
			//DPRINTLN(F("clr"));
			pos(0);																													// reset the counter
		}
		uint8_t pos() {
			return cnt;
		}
		void pos(uint8_t value) {
			cnt = value;
		}
		uint8_t channel() {
			//DPRINT(F("cnl:")); DHEXLN(store[2]);
			return store[2];
		}
		uint8_t prg_slot() {
			//DPRINT(F("prg_slot:")); DHEXLN(((store[0] << 4) + store[1]));
			return ((store[0] * 10) + store[1]);
		}
		uint8_t* passwd() {
			return &store[3];
		}
		void fill() {
			uint8_t cnt_max = sizeof(store);
			while (cnt < cnt_max) add(0);
		}
	};

	Buffer buffer;
	uint8_t prg_mode;

	uint8_t comp_8byte_array(uint8_t* in1, uint8_t* in2) {							// compares two password strings
			uint8_t ret = 1;
			for (uint8_t i = 0; i < 8; i++) {
				ret &= in1[i] == in2[i];
			}
			return ret;
		}
	uint8_t* get_slot(uint8_t slotnr) {																	// loads a slotstr based on the slotnummer
		uint8_t cnl = (slotnr / 2) + 1;																		// channel starts with 1
		uint8_t* ret = sdev.channel(cnl).getList1().byte_array(slotnr & 0x01);
		//DPRINT(F("get_slot: ")); DPRINT(slotnr); DPRINT(F(", cnl: ")); DPRINT(cnl); DPRINT(F(", ret: ")); DHEXLN(ret, 9);
		return ret;
	}
	uint8_t check_password(uint8_t slotnr, uint8_t* passwd) {						// validates a given password aganst the slotstring password
		uint8_t* slotstr = get_slot(slotnr) + 1;													// password starts after the channel byte
		uint8_t ret = comp_8byte_array(slotstr, passwd);
		DPRINT(F("chk pw: ")); DPRINT(slotnr); DPRINT(F(",slotpw: ")); DHEX(slotstr, 8);; DPRINT(F(",pw: ")); DHEX(passwd, 8); DPRINT(F(",ret: ")); DPRINTLN(ret);
		return ret;
	}
	uint8_t get_password_slot(uint8_t* passwd) {												// returns the slot nummer of the given password, 0xff if not found
		uint8_t ret = 0xff;
		uint8_t slots = NR_CDL_CHANNELS * 2;
		//DPRINT(F("getslot in:")); DHEXLN(passwd, 8);
		for (uint8_t i = 0; i < slots; i++) {
			if (!check_password(i, passwd)) continue;
			ret = i;
			break;
		}
		//DPRINT(F("getslot slot:")); DHEXLN(slot);
		return ret;
	}
	uint8_t validate_access(uint8_t slotnr, uint8_t cnl) {
		uint8_t* slotstr = get_slot(slotnr);
		//DPRINT(F("val acc: ")); DPRINT(slotnr); DPRINT(F(" ,acc: ")); DHEX(slotstr[0]); DPRINT(F(" ,cnl: ")); DPRINT(cnl); DPRINT(F(" ,ret: ")); DPRINTLN(slotstr[0] & cnl);
		return (slotstr[0] & 1<<(cnl-1));																			// check if the channel bit is set
	}
	
public:
	CodeLock () : Alarm(0) { start_timeout(); }
	~CodeLock() {}

	void start_timeout(uint16_t value = 100) {
		sysclock.cancel(*this);
		set(millis2ticks(value));
		sysclock.add(*this);
	}
	void trigger(AlarmClock& clock) {
		buffer.clear();
		prg_mode = 0;
		backLed.set_bright_mode(cLED::eBRIGHT::DIMMED);
		backLed.set_color_mode(cLED::eCOLOR::OPERATE);
	}

	void activity(uint8_t key, uint8_t touched) {
		//DPRINT(F("key: 0x")); DHEX(key); DPRINT(F(", ")); DPRINTLN(touched);// some debug message
		if (touched) {																										// different activity for touched or released
			backLed.set_bright_mode(cLED::eBRIGHT::TOUCHED);								// flash light while key press
			sdev.buzzer().on(millis2ticks(20));
		}	else {
			backLed.set_bright_mode(cLED::eBRIGHT::DIMMED);									// dim the background light
			return;																													// leave while not touched
		}

		if (key == 0x0c) {					// finished the input, check for activity
			check_buffer();

		}	else if (key == 0x0b) {		// ringer touch pressed
			if (sdev.ringer_channel) {																			// check if the ringer is aligned on a channel
				sdev.channel(sdev.ringer_channel).state(1);										// let the channel work
			}

		}	else {										// any other key																													
			if (!prg_mode && !buffer.pos()) {																// skip the first two digits if we are not in program mode
				buffer.fill(); buffer.pos(2);																	// and fill them with 0
			}
			buffer.add(key);																								// add the key to the buffer
			start_timeout(10000);																						// empty the buffer after 10 seconds
		}
	}
	void check_buffer() {
		uint8_t minpos = (prg_mode)?0:4;
		if (buffer.pos() < minpos) goto clear;														// we need at least 3 digit input if not in prog mode

		uint8_t cnl = buffer.channel();																		// get the buffer channel byte
		uint8_t prg_slot = buffer.prg_slot();															// get the slot number, only if in prg mode
		uint8_t pwd_slot = get_password_slot(buffer.passwd());						// check if we find the password, 0xff if not

		//DPRINT(F("check- pwd: ")); DHEX(buffer.passwd(),8); DPRINT(F(", cnl: ")); DHEX(cnl); DPRINT(F(", prg_slot: ")); DHEX(prg_slot); DPRINT(F(", pwd_slot: ")); DHEXLN(pwd_slot);  // some debug message

		// normal operation: enter channel number and password followed by #
		// enter program mode: input 0 followed by the slot 1 password (masterpassword) and confirm with #
		//   you should hear a double beep and see a changed background light color, now you have 30 secs for the next step
		// change password within the program mode: input a double digit password slot (1 to 12) followed by channel byte and the new password, confirmed with #
		//   you should hear a double beep
		// send the pairing string within program mode: input 99 followed by #
		//   this leaves the program mode, you hear a double beep and the background light color changes


		if ((!prg_mode) && (cnl == 0) && (pwd_slot == 0)) {
			// check if the program mode channel is addressed and the master password was entered 
			DPRINTLN(F("prog mode"));
			prg_mode = 1;
			start_timeout(30000);
			backLed.set_color_mode(cLED::eCOLOR::PROGRAM);
			goto confirmclear;
		}

		if ((prg_mode) && (cnl) && (cnl <= NR_CDL_CHANNELS)) {
			// if we are in program mode and someone entered a new password 
			DPRINT(F("slot:")); DPRINT(prg_slot); DPRINT(F(", cnl:")); DPRINT(cnl); DPRINT(F(", pwd:")); DHEXLN(buffer.passwd(), 8);
			start_timeout(30000);
			// write into register - 
			start_timeout();
			goto confirmclear;
		}

		if ((prg_mode) && (cnl == 0) && (prg_slot == 99)) {
			// check if we are asked to send a pairing string 
			DPRINTLN(F("send pairing"));
			sdev.startPairing();
			start_timeout();
			goto confirmclear;
		}

		if((prg_mode) && (!cnl) && (!prg_slot)) {
			// check if we are asked to end the prog mode 
			DPRINTLN(F("end prog mode"));
			start_timeout();
			goto confirmclear;
		}

		if ((!prg_mode) && (cnl) && (cnl <= NR_CDL_CHANNELS) && (pwd_slot != 0xff)) {
			// check if we are asked to send a channel state */
			uint8_t access = validate_access(pwd_slot, cnl);							// check if this password has access to the given channel
			if (!access) goto clear;																			// no access, leave
			sdev.channel(cnl).state(1);																		// send the channel message
			goto confirmclear;
		}

		goto clear;

	confirmclear:
		sdev.buzzer().on(millis2ticks(30), millis2ticks(50), 2);
	clear:
		buffer.clear();
	}
};

CodeLock<keymap> codelock;
// - -----------------------------------------------------------------


void setup() {
  DINIT(57600,ASKSIN_PLUS_PLUS_IDENTIFIER);
	//storage().setByte(0, 0);
	sdev.init(hal);

  buttonISR(cfgBtn,CONFIG_BUTTON_PIN);
	mpr121ISR(codelock, TOUCH_IRQ_PIN);
	sdev.initDone();

	sdev.buzzer().on(millis2ticks(100), millis2ticks(50), 2);
	//sdev.dumpSize();

	//uint8_t x[9] = { 0xff,'1','2','3','4','8','7','7','8', };
	//sdev.channel(2).getList1().byte_array(0, x);
	//sdev.sendInfoParamResponsePairs();

	/* scan i2c bus for devices
	DPRINTLN(F("I2C scan..."));
	for (uint8_t i = 1; i < 127; i++) {
		Wire.beginTransmission(i);
		uint8_t error = Wire.endTransmission();

		if (error == 0) {
			DPRINT(F("device at 0x")); DHEXLN(i);
		}
		else if (error == 4) {
			DPRINT(F("error at 0x")); DHEXLN(i);
		}
	}
	DPRINTLN(F("done"));*/

}

void loop() {
	codelock.poll();
	bool worked = hal.runready();
  bool poll = sdev.pollRadio();
  if( worked == false && poll == false ) {
    //hal.activity.savePower<Sleep<>>(hal);
  }
}



