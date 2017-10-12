---
title: "LEGO Tanfolyam: Programozás 1"
layout: default
---

# LEGO Tanfolyam: Programozás 1

## A környezetről

A tanfolyamalkalmak során a Bricx Command Centert használjuk az NXT programozására, ami céltudatosan különböző programozható LEGO termékekhez lett tervezve. A környezetről néhány fontos tudnivaló:

- Alapesetben nem ismeri magyar billentyűzetkiosztással a `;`-t, ami igazán kellemetlen. Ezen viszont egy makró beállításával könnyen lehet segíteni:

  Felső menüpontokból View → Macro manager → Create, majd illeszük be a következő kódrészletet:
  ```c
  macro ;
  begin
    ecString ';'
  end
  ```
  Ezek után ha a makróhoz hozzárendeljük a pontosvesszőhöz tartozó billentyûkombinációt már tudunk is ;-t írni.
- Ahhoz, hogy a kódot le tudjuk fordítani, először egyszer el kell menteni, különben hibát dob a fordító.
- Szükséges szoftverek: [NXT Phantom Driver](https://drive.google.com/file/d/0B6woiJSRfjnbVEVnR3pvUzNudG8/view), [Bricx CC](https://sourceforge.net/projects/bricxcc/files/bricxcc/)

## Bevezetés

A programozáshoz az NXC (Not Exatly C) nyelvet használjuk ami hasonlít a C/C++-hoz:

- Case-sensitive (`"xYz" != "Xyz"`)
- Változók (`bool`, `char`, `unsigned int`, `mutex` stb.)
- Tömb (`array`)
- Operátorok (`!=` , `==` , `+=` stb.)
- Struktúrák
  ```c
  struct car {
    string car_type;
  };

  struct car civic;
  civic.car_type = "honda";
  ```
- Nyelvi elemek (`if`, `while`, `do`, `for`, `switch` stb.)

Mivel a nyelv LEGO NXT termékek programozására lett létrehozva, ezért helyenként szükségszerûen különbözik is a C/C++-tól.
Az első ilyen különbség amivel a tanfolyam során találkozhatunk az már a programunk vázában is látható. Az NXT maga taskokat futtat, emiatt a legegyszerûbb dologhoz is szükségünk van egyre. Alapértelmezésként ez a kiinduló task a "main" ami a kódban a következőképpen néz ki:

```c
task main() {
  // futtatnivaló kód itt
}
```

## Az NXT használatához fontos alapfüggvények

### Szenzorok

Az NXT-nek 4 bemeneti portja van amire szenzorok köthetők, ezeket a programban a beépített `IN_1`, `IN_2`, `IN_3` és `IN_4` előre definiált konstansok segítségével lehet elérni.

Az egyes szenzorok használata előtt be kell állítanunk, hogy hol milyen szenzort szeretnénk használni, amihez a következő függvényeket lehet használni:

- `SetSensorTouch(port);`

  Nyomógomb inicializálása, argumentumban a port(IN_portszám formátumban) amire be van kötve.
- `SetSensorLowspeed(port);`

  Ultrahang szenzor inicializálása.
- `SetSensorColorFull(port);`

  RGB Szenzor inicializálása.

A szenzorok értékét a következő függvényekkel lehet visszakérni:

- `Sensor(port);`

  visszaadja az adott porton lévő szenzor értékét(nem ultrahang szenzorokra)
- `SensorUS(port);`

  visszaadja az adott porton lévő ultrahangszenzor értékét.

### Mozgás

A motorok használatához az NXT 3 kimeneti portját használhatjuk amiket a programban a beépített `OUT_A`, `OUT_B` és `OUT_C` konstansok segítségével lehet kezelni. Sokszor lehetőség van egyszerre több kimeneti port használatára is, erre használható ezeknek a kombinációja. Ha például az `A` és `C` kimeneti portot szeretném használni, az `OUT_AC` segítségével ez megtehető.

A motorok kezelésére a következő függvények használhatók:

- `OnFwd(port, N);`

  A megadott porton/portokon lévő motort/motorokat előremenetbe állítja. N-ben az őket hajtó feszültséget (ezáltal a sebességet) lehet állítani %-ban (megj.: ez negatív is lehet)
- `OnRev(port, N);`

  A megadott porton/portokon lévő motort/motorokat hátramenetbe állítja. N-ben az őket hajtó feszültséget (ezáltal a sebességet) lehet állítani %-ban (megj.: ez negatív is lehet)
- `Off(port);`

  Kikapcsolja a motorokat.
- `OnFwdSync(port, sebesség, fordulás);`

  A megadott motorok szinkronizált mozgatárása használható. Az első két argumentum ugyanaz mint az `OnFwd(...)` esetében, a harmadik argumentumnak viszont megadható a motorok között szinkronizáció -100-tól 100-ig. Ez 0 érték esetén a motorok szinkrónizált egyirányba forgását, míg -100 vagy 100 esetén teljesen ellentétes forgást jelent.
- `OnRevSync(port, sebesség, fordulás);`

  `OnFwdSync(...)`, csak hátrafelé.

## Egyéb függvények

- `Wait(idő);`

  Üresjárat megadott ideig (ms-ban).
- `NumOut(0, LCD_LINE1, X, FALSE);`

  Szám kiírása LCD-re (X változóban lehet a kiírandó szám).
- `TextOut(0, LCD_LINE2, "String", FALSE);`

  Szöveg kiírása LCD-re.
- `ClearScreen();`

  Kijelző törlése.

## Példák

Előremegy fél másodpercig, visszamegy fél másodpercig, és folyamatosan írja ki az ultrahang szenzor értékét (távolság).

```c
task main() {
  // Ultrahang szenzor inicializálása
  SetSensorLowspeed(IN_1);
  // A és B portokon lévő motorokat előremenetbe kapcsolja
  OnFwd(OUT_AB, 60);
  // Fél másodpercet vár
  Wait(500);
  // Motorokat hátramenetbe kapcsolja
  OnRev(OUT_AB, 60);
  // Ismét vár
  Wait(500);
  // Kikapcsolja a motorokat
  Off(OUT_AB);
  // Végtelen ciklus
  while(1) {
    // Kiírja a távolságot
    NumOut(0, LCD_LINE1, SensorUS(IN_1), FALSE);
    // Kirja, hogy "Hello World"
    TextOut(0, LCD_LINE2, "Hello World", FALSE);
    // Vár 100ms-ot
    Wait(100);
    // Törli a kijelzőt
    ClearScreen();
  }
}
```

Megy, amíg meg nem nyomják a gombot, ha kék színt érzékel, akkor megfordul és megy tovább.

```c
task main() {
  // Nyomógomb inicializálása
  SetSensorTouch(IN_3);
  // RGB szenzor inicializálása
  SetSensorColorFull(IN_2);
  // Amíg nincs benyomva a gomb, addig fut
  while(Sensor(IN_3) == 0) {
    // Megy előre
    OnFwd(OUT_AB, 60);
    // Ha kéket érzékel
    if(Sensor(IN_2) == 2) {
      // A porton lévő motor előre
      OnFwd(OUT_A, 50);
      // B hátra
      OnRev(OUT_B, 50);
      // Vár 2,9 másodpercet
      Wait(2900);
    }
  }
}
```
