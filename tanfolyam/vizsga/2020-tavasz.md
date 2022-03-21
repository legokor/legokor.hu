---
layout: default
title: "LEGO Tanfolyam: Vizsga (2022 tavasz)"
---

# LEGO Tanfolyam: Vizsga (2022 tavasz)

A vizsgán több feladatot kell elvégeznetek. Ezekért jár külön-külön is pont, illetve pluszpont jár, ha a teljes pályát egy menetben teljesítitek. A pontozásnál figyelembe vesszük a pontosságot és a gyorsaságot is, illetve ha valami különleges kiegészítőt raktok a robotra, arra is járhat pluszpont.

## A vizsga menete

A vizsga során vagy az egész pálya _megszakítás nélküli_ teljesítésével, vagy a feladatok közül _az egyik külön_ teljesítésével probálkozhattok, a próbálkozás előtt közöljétek egy segítővel, hogy melyiket szeretnétek. A vizsgaalkalom folyamán a teljes pályát és külön-külön bármelyik feladatot is akárhányszor kipróbálhatjátok, illetve amennyiben szükségesnek ítélitek, végig csiszolhatjátok tovább a robot kódját, viszont:

<!--
- a pályát **maximum 3 próbálkozásotok** van _egyhuzamban, megszakítás nélkül_ teljesíteni, ezek után az ezért adható pluszpont elveszik,
-->
- mind az egyik konkrét feladaton külön tett, mind a teljes pályán tett legutóbbi próbálkozásotok eredménye **felülírja az előzőt**, akkor is, ha az jobb volt,
- egy teljes pályás próbálkozás minden egyes _sikeresen vett_ feladat korábbi, külön teljesített eredményét is felülírja.

A csapatok FIFO elvben, egymást követve próbálkozhatnak a pályán. (Kivéve ha több csapat több külön, nem egymást követő feladaton akar külön próbálkozni, ilyenkor ők próbálkozhatnak egyszerre.)

Ha a próbálkozást pontozó segítő úgy ítéli, hogy a robot egy feladaton _beragadt_, akkor a próbálkozás véget ér. A segítő akkor dönthet így, ha a robotnak már legalább egy perce nem sikerül teljesítenie a jelenlegi feladatot. A próbálkozás akkor is véget ér, ha nyilvánvalóan látszik, hogy a robotnak esélye sincs teljesíteni a feladat/pálya hátralévő részét (pl. letér a vonalról / nem találja meg a vonalat és „világgá megy”).

A vizsgaalkalom egy, az alkalom elején közölt időpontban _lezárul_, az után nem lehet próbálkozni.

## A vizsga feladatai

A vizsga vonalkövetési feladattal kezdődik, illetve az egyes feladatrészek között is vonalkövetéssel kell továbbhaladni. A vizsgapályán az alap vonalszínen (az illusztrációkon <span style="color: #000; text-shadow: 0px 0px 2px #fff;">**fekete**</span>) felül:
- Külön szín jelöli egy speciális (nem vonalkövetési) feladat _végét_ és egyben vonalkövetési rész kezdetét, ez az illusztrációkon <span style="color: #0066FF;">**kék**</span>. Ezt a színt csak ezzel a jelentéssel használjuk a pályán.
- Külön szín jelöli egy speciális feladat _kezdetét_, ez az illusztrációkon <span style="color: #FFCC00;">**sárga**</span>. Ezt a színt csak ezzel a jelentéssel használjuk a pályán.
- Plusz, fentebbiektől eltérő szín(ek) jelölhet(nek) egyéb dolgokat a feladatokon belül (az illusztrációkon <span style="color: #37C837;">**zöld**</span> és <span style="color: #C83737;">**piros**</span>). Ezen színek jelentése feladatonként változik.

**Fontos:** A feladatok képei _illusztrációk_, a tényleges feladattól _a feladatleírásban expliciten nem specifikált_ részletekben eltérhetnek, például:
- nem pont ugyanolyan és ugyanannyi kanyar, ív, labirintus-zsákutca, stb. lesz egy szakaszon,
- ami az illusztrációkon piros, az lehet mondjuk kék is,
- ami a képen a vonal bal oldalán van, lehet jobb oldalt is.

Ugyanakkor:
- a jelölt hosszmértékektől nem fogunk eltérni,
- ami külön színű vonal az illusztrációkon, az a tényleges feladatban is külön színű lesz,
- ami egyező színű vonal az illusztrációkon (feladatokon átívelően is!), az a tényleges feladatban is egyező színű lesz.

**A vizsgafeladatok az itt lévő sorrendjükkel megegyező sorrendben fognak szerepelni a pályán.** A 2022 tavaszi vizsga feladatai a következők:

### Vonalkövetés
![Vonalkövetés](/images/tanfolyam/feladatok/vonal_szimpla.svg)
A járművet a földre helyezés után indíthatjuk el. Az útvonalon előfordulhat **éles kanyar**, viszont _nincs_ rajta kereszteződés. A kezdő vonalkövetés szekció végeztével a kijelzőre ki kell írni a megtett út **becsült hosszát** cm-ben.

### Labirintus
![Labirintus](/images/tanfolyam/feladatok/labirintus.svg)
A feladat kezdetét jelző vonalat átlépve a robot egy labirintusban találja magát. A labirintus falai más színnel vannak jelölve, mint a követett vonal. Miután bejutottatok a labirintusba, meg kell keresni annak a **kijáratát,** ez a feladat végét reprezentáló színnel van jelölve. A labirintusból kijutva ismét az eredeti vonalkövetést kell folytatni. **A labirintus falait bejutás után nem szabad átlépni (a szenzor nem lóghat ki)!**

### Akadály
![Akadály](/images/tanfolyam/feladatok/akadaly.svg)
A feladatkezdő jelzés után a robotnak egyenesen kell továbbhaladnia, amíg nem észlel akadályt maga előtt. Amint észreveszi az akadályt, azt **jobbra** fordulva kerülje el, majd a feladat végét jelző vonalat megtalálva vonalkövetéssel haladjon tovább.

### Dobozkövetés
![Dobozkövetés](/images/tanfolyam/feladatok/dobozkovetes.svg)
A feladat kezdetét jelző vonal után egy egyenes vonalon kell haladni a járművel olyan sebességgel, hogy az előtte húzott dobozig mért távolságot fixen tartsa. A földön a doboz útvonalát vonal is jelzi, hogy segítse az iránytartást. A feladat vége jelzés átlépésekor a doboz _automágikusan_ (egy segítőnk keze által) eltűnik az útból, a robot vonalkövetéssel haladjon tovább.

### Megállás vonalnál
![Megállás](/images/tanfolyam/feladatok/megallas.svg)
A feladat végén a robotnak a két színes vonal közötti részen kell megállnia.
