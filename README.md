# HB-CDL-6 [![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
ein Asksin++ basiertes Touch-Codeschloss 

![alt text](https://github.com/trilu2000/HB-CDL-6/blob/main/Bilder/small/IMG_20201111_105313.jpg)


## Features
* Codeschloss mit 6 Kanälen zur direkten Ansteuerung von 2 bis 3 Aktoren
* Klingeltaster zur direkten Ansteuerung von HM-OU-CFM-Pl oder ähnlichen Geräten
* 12 individuelle Pins können bis zu 6 Kanälen zugeornet werden
* Großflächige kapazitive Touchfläche 
* Buzzer bestätigt Tastendruck 
* RGB Hintergrundbeleuchtung zur individuellen Farb- und Helligkeitsanpassung
*  Integration in ein gängiges Schalterprogramm von Gira für den Außenbereich (Gira TX-44)
* Verwalten der PIN's über die CCU Oberfläche
* Stromversorgung ist an die lokalen Gegebenheiten anpassbar (<20 V AC, <20V DC, 5V DC)

Support thread: https://homematic-forum.de/forum/viewtopic.php?f=76&t=62530

## Nutzung

Zuerst muss das Device natürlich mit der CCU verbunden werden. Per Default ist der Klingelknopf auf Kanal 6 geschaltet und braucht natürlich kein Passwort.
Weiter unten in der Maske kann man die PIN's und zugehörigen Channel setzen.

Per Default hat das Gerät den Master PIN '12345678' in Channel 1 auf Slot 0 für alle Schaltkanäle gesetzt.
Testen kann man das wie folgt: Wir wollen Kanal zwei Schalten, dazu drücken wir eine 2 gefolgt vom Masterpasswort und abgeschlossen mit einer #
Jetzt bleibt die Beleuchtung etwas länger hell und abschließend hört ihr den doppelten Quittierungston.

Mein Setup sieht so aus:

| Kanal | Gerät    | Funktion   |
| ----: | :------- | :-----     |
| 1     | Haustür  | öffnen     |
| 2     | Haustür  | verriegeln |
| 3     | Garage   | öffnen     |
| 4     | Garage   | schliessen |
| 5     |          |            |
| 6     | Klingel  | klingeln   |

Meine Frau, meine beiden Söhne und ich haben einen eigenen PIN. Alle diese Pins sind berechtigt für 1, 2, 3 und 4.
Nachdem ich aber zum Schließen der Garage oder Verriegeln der Tür nicht jeweils den langen PIN eingeben möchte und ich das Schadrisiko für gering halte, habe ich einen weiteren PIN '99' angelegt mit der Berechtigung für 2 und 4.

## Steuerungsplatine

Das Platinendesign der Steuerungsplatine basiert auf dem [HMSensor](https://asksinpp.de/Projekte/psi/HMSensor/) Projekt. 
Dort ist auch das Flashen des Bootloaders und setzen der Fuses beschrieben.

![alt text](https://github.com/trilu2000/HB-CDL-6/blob/main/Bilder/Steuerungsplatine-combined.png "Steuerungsplatine")

Die Spannungsversorgung kann den lokalen Gegebenheiten durch die Bestückung angepasst werden. 
* Bei <20 V AC wird die rechte Wago Klemme bestückt, die zu einem Gleichrichter führt.
* Bei <20 V DC wird die linke Wago Klemme bestückt, die den Gleichrichter umgeht.
* Bei beiden genannten Varianten wird der DC-DC Wandler bestückt.
* Bei 5V DC ist die linke Wago Klemme zu bestücken und der DC-DC Wandler (Lötbrücke Pin1 und Pin3) zu überbrücken.

Ich verwende diesen DC-DC Wandler: https://de.aliexpress.com/item/4000938525410.html

## Touch-Feld

Das Touch-Feld ist relativ einfach gehalten und beinhaltet nur die Touch Flächen der einzelnen Tasten, sowie die Steuerungselektronik auf der Rückseite.

![alt text](https://github.com/trilu2000/HB-CDL-6/blob/main/Bilder/Touch-Flaeche-combined.png "Touch-Fläche")

Die Steuerungselektronik ist eine fertige Platine auf Basis des MPR121. Zum direkten Auflöten muß die Platine links und rechts angeschliffen werden, um die Lötaugen zur Hälfte frei zu legen.

Das Modul gibts z.B. hier: https://de.aliexpress.com/item/32821362153.html

## CCU Integration

Die Integration des Geräts ist als Custom Device ausgelegt. Derzeit habe ich die Device-Files manuell in die CCU kopiert, Ziel ist aber das Gerät durch das Installieren von [JP-HB-Devices-addon](https://github.com/jp112sdl/JP-HB-Devices-addon) Verfügungbar zu machen.
Die Files sind derzeit im Github verfügbar (Ich hoffe ich habe alle erwischt, ist schon eine Weile her das ich Raspberrymatic gepatched habe).

![alt text](https://github.com/trilu2000/HB-CDL-6/blob/main/Bilder/CCU%20integration.png "CCU Integration")

## Aufbau

![alt text](https://github.com/trilu2000/HB-CDL-6/blob/main/Bilder/small/Explosionszeichnung.png "Explosionszeichnung.png")

Die Elektronik besteht aus zwei Platinen - der Steuerungsplatine und das Touch-Feld. 
Die weiteren Gehäuseteile (Zwischenrahmen, Platinenabdeckung, Bauteilabdeckung und Klemmrahmen) werden in PLA gedruckt. 
Die sichtbaren Gehäuseteile bestehen aus zwei Aluwinkeln (15x10x2mm, 67mm lang) und zwei Alu-Flach Stücken (15x2mm, 133mm lang), die als Rahmen dienen.

Platinen bestücken, Bootloader aufspielen und Fuses setzen ([HMSensor](https://asksinpp.de/Projekte/psi/HMSensor/)). Es kann auch schon der Sketch aufgespielt werden und die grundsätzliche Funktionalität getestet werden.  

Dann wird die Einheit Touchplatine, Steuerungsplatine und Zwischenrahmen zusammengebaut. Der Zwischenrahmen hält per Klemmung an den WS2812 RGB LEDS der Steuerplatine, alternativ kann mit ein paar Tropfen Sekundenkleber nachgeholfen werden. 
Die Touchplatine wird dann von der anderen Seite in die entsprechende Aussparung gesetzt, wobei darauf geachtet werden muss, das die Stiftleiste in die Lochreihe der Steuerungsplatine gefädelt wird.
Die Touchplatine sollte bereits über die Klemmung im Zwischenrahmen halten, alternativ kann auch hier mit ein paar Tropfen Sekundenkleber nachgeholfen werden.

Zwischen Touchplatine und Acrylscheibe wird ein Blatt dickeres Papier gelegt - kann Tonpapier oder auch normales Kopierpapier (evtl doppelt) sein.
Bitte darauf achten das die Schlitze zwischen Hintergrundbeleuchtung und Acrylscheibe nicht verdeckt werden.
Die Acrylscheibe wird von der Seite eingeschoben. 

Jetzt macht es Sinn die Funktion der Einheit zu prüfen, dazu die Platine per USB Serial Adapter anschliessen.
Das Touchpad sollte initialisiert werden und die WS2812 LEDs leuchten. Auch sollte das Touchpad auf Berührung reagieren, angezeigt durch helleres Leuchten der Hintergrundbeleuchtung und durch einen kurzen Ton des Buzzers.

![alt text](https://github.com/trilu2000/HB-CDL-6/blob/main/Bilder/small/IMG_20201106_154233.jpg)

Nach dem Funktionstest können die Aluwinkel montiert werden. Zum Verleben habe ich etwas grauen Silikon genutzt, es sollte aber auch jeder andere Kleber funtionieren.
Ich habe eine dünne Schicht Silikon auf beide Seiten (kurze komplett, lange nur bis etwa zur Hälfte) des Winkels aufgetragen, beide Winkel aufgesetzt und mit der Monagehilfe1 zum Aushärten fixiert.

![alt text](https://github.com/trilu2000/HB-CDL-6/blob/main/Bilder/small/IMG_20201109_151845.jpg)

Danach können die beiden Seitenteile verklebt werden. Testen ob die Seitenteile passen, dann etwas Silikon auf die unteren Hälften des Flachmaterials, an der Toucheinheit ansetzen und mit Montagehilfe2 zum Aushärten fixieren.

![alt text](https://github.com/trilu2000/HB-CDL-6/blob/main/Bilder/small/IMG_20201111_104945.jpg)
 
Jetzt kann die Platinenabdeckung auf die Toucheinheit aufgesetzt werden und durch Aufdrücken des Klemmrahmens fixiert werden. 
Der Klemmrahmen sollte relativ stramm sitzen, falls nicht macht es Sinn etwas Kleber zu nutzen.

![alt text](https://github.com/trilu2000/HB-CDL-6/blob/main/Bilder/small/IMG_20201111_105104.jpg)

Danach noch die Bauteilabdeckung aufsetzen und in das Fußteil des Gira TX-44 Rahmens einsetzen. Abdeckung des Gira Rahmens montieren und fertig :-)

![alt text](https://github.com/trilu2000/HB-CDL-6/blob/main/Bilder/small/IMG_20201111_105209.jpg)
![alt text](https://github.com/trilu2000/HB-CDL-6/blob/main/Bilder/small/IMG_20201111_105313.jpg)
![alt text](https://github.com/trilu2000/HB-CDL-6/blob/main/Bilder/small/IMG_20201111_110119.jpg)





