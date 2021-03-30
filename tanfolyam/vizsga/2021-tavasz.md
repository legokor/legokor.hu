---
layout: default
title: "LEGO Tanfolyam: Vizsga (2021 tavasz)"
---

# LEGO Tanfolyam: Vizsga (2021 tavasz)

A vizsgán több feladatot kell elvégeznetek. Ezekért jár külön-külön is pont, illetve pluszpont jár, ha a teljes pályát egy menetben teljesítitek. A pontozásnál figyelembe vesszük a pontosságot és a gyorsaságot is, illetve a különösen hatékony és/vagy (a működőképességet nem hátráltatóan) szórakoztató megoldásokért pluszpont is járhat.

## A vizsga menete

A vizsga során vagy az egész pálya _megszakítás nélküli_ teljesítésével, vagy a feladatok közül _az egyik külön_ teljesítésével probálkozhattok. A vizsgaalkalom folyamán a teljes pályát és külön-külön bármelyik feladatot is akárhányszor kipróbálhatjátok, illetve amennyiben szükségesnek ítélitek, végig csiszolhatjátok tovább a robot kódját, viszont:
- mind az egyik konkrét feladaton külön tett, mind a teljes pályán tett legutóbbi beadott próbálkozásotok eredménye **felülírja az előzőt**, akkor is, ha az jobb volt,
- egy beadott teljes pályás próbálkozás minden egyes _sikeresen vett_ feladat korábbi, külön teljesített eredményét is felülírja.

A vizsgaalkalom egy, az alkalom elején közölt időpontban _lezárul_, az után nem lehet új köztes próbálkozást beadni és egy rövid időtök lesz a végleges megoldásotok feltöltésére.

### Próbálkozások beadása

**A vizsga alatt** a próbálkozásokat a következőképp adhatjátok be:
- A Webots videókészítő funkciójával készítsetek egy felvételt a próbálkozásról. (Nem érdemes túl nagy videofelbontást használni, 360p elég szokott lenni, hogy minden látsszon.)
- A videót küldjétek be a körös Discordon a csapatotok szöveg csatornájába, és a videó mellett megadható szövegben _tüntessétek fel, hogy ez egy próbálkozás_ (nem a vizsga közbeni fejlesztgetésetek valami részlete), a következőképp (Az emoji és a félkövér formázás nem muszáj, de könnyebb tőle észrevenni az üzenetet.):
  - Teljes pályás próbálkozás: **🔰 Próbálkozás: Teljes pálya**
  - Külön feladatos próbálkozás: **🔰 Próbálkozás: _\<feladat neve\>_**

A segítők a videóra tett „👀” reakcióval (vagy egyéb módon) jelzik nektek (és egymásnak), hogy nézik a megoldásotokat, és utána egy másik üzenettel/reakcióval (pl. ✅, 🆗), ha értékelték és felvitték a **(nem hivatalos!)** pontozását a vizsgaeredményes táblázatba.

**A vizsga végén** [ezen a formon](https://docs.google.com/forms/d/e/1FAIpQLSet20wSE6fyOqtqmR7q4gW16yE9rFiP7qomcXrSJYy6y4CLhA/viewform?usp=sf_link) tudjátok beadni a megoldásotok kódját. A beadáshoz a teljes kontroller mappát (a `tanfolyam_mozgo_akadaly_2` kontrollerrel egy szinten lévő mappát) csomagoljátok egy ZIP-be és azt töltsétek fel. A vizsga után a segítők a kiadott vizsgapályán futtatják a kontrollert és megadják a megoldásotokra a hivatalos értékelést. (Ha a robot működése extrém módon eltérne a mi gépünkön a tietekhez képest, azt eseti alapon fogjuk kezelni.)

### Próbálkozások értékelése

**Sikeres** (hibátlanul teljesített) egy próbálkozás, ha a feladatkiírással szembeni bármilyen eltérés nélkül, pontosan megoldja a feladatot.

**Elfogadható** (kis hibával teljesített) egy próbálkozás, ha a robot ugyan eljut a pálya/feladat elejétől a végéig, _viszont_:
- bár látszik, hogy törekszik a szabályos megoldásra, kis hibát vét (pl. letér a vonalról, de utána megtalálja), _vagy_
- a megoldás módja nyilvánvalóan a konkrét pályára van szabva, azt a pálya vonatkozó részének (a feladatkiírás korlátai közt maradó) valamilyen módosítása biztosan eltörné.

**Sikertelen** (nem teljesített) lehet egy próbálkozás, ha a próbálkozást pontozó segítő úgy ítéli, hogy a robot egy feladaton _beragadt_. A segítő akkor dönthet így, ha a robot legalább fél perce nem mutat arra utaló jelet, hogy közeledne a feladat teljesítéséhez. A próbálkozás akkor is sikertelen, ha nyilvánvalóan látszik, hogy a robotnak esélye sincs teljesíteni a feladat/pálya hátralévő részét (pl. letér a vonalról / nem találja meg a vonalat és „világgá megy”).

## A vizsga feladatai

A vizsga vonalkövetési feladattal kezdődik, illetve az egyes feladatrészek között is vonalkövetéssel kell továbbhaladni. A vizsgapályán az alap vonalszínen (a gyakorlópályán <span style="color: #000; text-shadow: 0px 0px 2px #fff;">**fekete**</span>) felül:
- Külön szín jelöli egy speciális (nem vonalkövetési) feladat _végét_ és egyben vonalkövetési rész kezdetét, ez a gyakorlópályán <span style="color: #0066FF;">**kék**</span>. Ezt a színt csak ezzel a jelentéssel használjuk a pályán.
- Külön szín jelöli egy speciális feladat _kezdetét_, ez a gyakorlópályán <span style="color: #C83737;">**piros**</span>. Ezt a színt csak ezzel a jelentéssel használjuk a pályán.
- Plusz, fentebbiektől eltérő szín(ek) jelölhet(nek) egyéb dolgokat a feladatokon belül (a gyakorlópályán <span style="color: #37C837;">**zöld**</span> szín szerepel ilyen minőségben, de lehetne több is). Ezen színek jelentése feladatonként változik.

**Fontos:** A kiadott gyakorlópálya _nem a vizsgapálya_. Ez azt jelenti, hogy a tényleges vizsgapálya _a feladatleírásban expliciten nem specifikált_ részletekben eltérhet mind az illusztrációktól, mint a gyakorlópályától, például:
- nem pont ugyanolyan és ugyanannyi kanyar, ív, labirintus-zsákutca, stb. lesz egy szakaszon,
- ami a gyakorlópályán piros, az lehet mondjuk kék is,
- ami a képen a vonal bal oldalán van, lehet jobb oldalt is.

Ugyanakkor:
- ami külön színű vonal a gyakorlópályán, az a tényleges vizsgapályán is külön színű lesz,
- ami egyező színű vonal a gyakorlópályán (feladatokon átívelően is!), az a tényleges vizsgapályán is egyező színű lesz.

**A vizsgafeladatok az itt lévő sorrendjükkel megegyező sorrendben fognak szerepelni a vizsgapályán is.** A 2021 tavaszi vizsga feladatai a következők:

### Vonalkövetés
A robotnak a vonalat követve, a vonalon maradva kell előrehaladnia. Az útvonalon előfordulhat **éles kanyar** és **kereszteződés**. A kezdő vonalkövetés szekció végeztével a konzolra ki kell írni a megtett út **becsült hosszát** centiméterben. 

### Labirintus
A feladat kezdetét jelző vonalat átlépve a robot egy labirintusban találja magát, meg kell keresnie annak a **kijáratát,** ez a feladat végét reprezentáló színnel van jelölve. A labirintusból kijutva ismét az eredeti vonalkövetést kell folytatni.

### Akadálykövetés
A robotnak a feladat kezdetét jelző vonal után a vonalat továbbra is követve olyan sebességgel kell haladnia, hogy az előtte haladó akadályig mért távolságot fixen tartsa. A feladat vége jelzés átlépésekor a doboz _automágikusan_ félreáll az útból, a robot vonalkövetéssel haladjon tovább.

### Párhuzamos parkolás
A robot a feladat kezdetét jelző vonalat észlelve a vonal mellett található parkolóhelyre párhuzamos parkolással álljon meg úgy, hogy közben nem ütközik neki a parkolóhely falainak. Pluszpontot ér, ha a robot nem előre tudja, hanem helyben képes felderíteni, hogy melyik oldalt található a parkolóhely.
