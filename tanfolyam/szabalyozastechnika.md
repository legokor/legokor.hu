---
layout: default
title: "Lego Tanfolyam: Szabályozástechnika"
---

# Lego Tanfolyam: Szabályozástechnika

Szabályzási algoritmusokra a legkülönfélébb rendszerek tervezésénél lehet szükségünk: folyamatirányítás, robotika, erőművek, tápegységek. Ezen az alkalmon igyekszünk bemutatni, hogy érdemes egy alapszintű szabályzás implementálásának nekilátni úgy, hogy a témában teljesen kezdők is sikeresen tudják alkalmazni az átadott tudást a vizsgafeladat során.

## Szabályzás hatásvázlata

Szabályzásra akkor van szükségünk egy rendszer irányításakor, ha nem tudjuk közvetlenül befolyásolni a szakasz (rendszer) irányítani kívánt paraméterét, viszont közvetett módon tudunk rá hatni. Gondoljunk csak például a modern autók sebességtartó funkciójára (tempomat): A vezető a kívánt sebességet állítja be, a rendszer pedig a motortól kért teljesítmény értéket változtatja. Nyilvánvaló, hogy ez összefüggésben van az autó sebességével, azonban mégse tudjuk azt mondani a motornak, hogy most adjon ki adott sebességhez szükséges teljesítményt. Még ha egy konstans sebesség tartását írjuk is elő, akkor is könnyen belátható, hogy egy emelkedő, vagy széllökés hatására csökkenni/növekedni fog az autó sebessége azonos leadott teljesítmény mellett. Itt jön a képbe a visszacsatolt szabályzási kör használata:

![zárt kör](https://www.tutorialspoint.com/control_systems/images/closed_loop.jpg)

Az előírt paraméter az input ágon található, a szabályzott paraméter pedig az output. Mindkettő azonos dimenziójú, kettő különbsége a hibajel. A szabályzó a hibajelet kapja meg, ezen lefuttatja az algoritmust, majd kiadja a kiszámított beavatkozójelet a szakasznak (plant).

## PID algoritmus

Rengeteg féle szabályzóalgoritmust fejlesztettek ki, és a mai napig születnek újak, mi most az alapvetőnek mondható PID algoritmussal fogunk megismerkedni.

Az algoritmus egyenlete nagyon egyszerű, mégis rengeteg esetben bőven elég a feladat megoldásához. Három részre bontható a felépítése: arányos (Proportional), integráló (Integral) és deriváló (Derivate) tagokra, a kimenet ezen tagok összege. Az arányos tag egyszerűen a hibajel felszorzott értéke, az integráló tag a hibajel integráljának, a deriváló tag pedig deriváltjának egy konstanssal szorzott értéke. Az algoritmus tervezésekor a mintavételi időt és a három konstans tényező értékét kell jól megválasztani. A konstansok hatása a rendszer viselkedésére:

- **Proportional:** A hibajel direktbe szorozva lesz ezzel az értékkel, így kisebb hibára is nagyobb beavatkozójellel reagál a szabályzó, így gyorsítja a hiba korrigálását, azonban könnyen instabillá válhat a rendszer nagy értékek esetén, és oszcillációba kezdhet a szakasz.
- **Integral:** Lassítja a rendszer reagálási idejét, negatív hatással van a stabilitásra, de megszünteti az állandó hibát.
- **Derivative:** Értékének növelésével agresszívebben reagál a rendszer a szabályzott változó megváltozására, így gyorsítja a beállás sebességét, azonban túl érzékennyé teheti a rendszert a zajokra.

![](https://upload.wikimedia.org/wikipedia/commons/3/33/PID_Compensation_Animated.gif)

Mint láthatjuk, a paraméterek megválasztása során kompromisszumot kell hoznunk. A teljes rendszerünk nem lehet instabil a legtöbb alkalmazás esetén, viszont szeretnénk minél gyorsabb beállást. A paraméterek megválasztására az előadáson láthatunk példákat.

## Szabályzó implementálása

Bár az algoritmus ismertetése után bárki könnyen implementálhatja az algoritmust, az alkalom felgyorsítása érdekében előre megírtuk az algoritmus vázát:

```c
#define dT 0.02
#define Ultrahang IN_3

#define P 1.0
#define I 0.0
#define D 0.0

task main() {
  float integral = 0;
  float lastError = 0;
  // 30cm-es távolság tartása
  float setpoint = 30;

  // Ultrahangszenzor inicializálása
  SetSensorLowspeed(Ultrahang);

  while(1) {
    float input = SensorUS(Ultrahang);
    float error = 0;
    float deriv = 0;
    float output = 0;

    // Ezen a tartományon még megbízhatóan működik
    if (input > 200) {
      input = 200;
    }

    // Hiba számítása
    error = setpoint - input;

    // Integrál számítása
    integral = integral + (error * dT);

    // Integráló tag limitálása
    if (integral > 5) {
      integral = 5;
    } else if(integral < -5) {
      integral = -5;
    }

    // Derivált számítása
    deriv = (error - lastError) / dT;
    lastError = error;

    // Beavatkozójel számítása
    output = P * error + I * integral + D * deriv;

    // Beavatkozójel korlátozása
    if (output > 100) {
      output = 100;
    } else if (output < -100) {
      output = -100;
    }

    // Beavatkozójel érvényre juttatása (az irány a motorok állásától függhet rover-enként)
    OnFwdSync(OUT_AB, (-1 * output), 0);

    // Távolság (szabályzott jellemző) megjelenítés
    NumOut(0, LCD_LINE1, input, TRUE);

    // dT miliszekundumokban
    Wait(20);
  }

  Off(OUT_AB);
}
```

További leírások:
[NI White paper](http://www.ni.com/white-paper/3782/en/)
