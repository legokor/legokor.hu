---
title: Magaslégköri Ballon Tesztelése – 2. rész
layout: post
author: moricz-tamas
image: http://lego.sch.bme.hu/wp-content/uploads/2017/04/toolbox.png
---

Cikksorozatunk második részében a teszteléshez használt eszközöket mutatjuk be. Az UPRA Projekt egyik nagy kihívása, hogy a végtermék mellett a tesztkörnyezet jelentős részét is házon belül kell elkészítenünk, mely a hardver- és szoftvereszközöket is magábafoglalja.

Mivel a fejlesztés során olyan hatásokra és eseményekre is fel kell készülnünk, amik laboratóriumi körülmények között nehezen tesztelhetők, ezért speciális eszközökre van szükségünk. Egyes eszközök külső laboratóriumokban elérhetők, de ezek rendelkezésre állási ideje limitált és bérlésük költséges lehet. Ilyenek például a környezeti tesztelésnél használt termo kamra valamint a GPS jelszimulátor, melyeknek kifejlesztését már megkezdtük és limitált funkcionalitással használhatók is. Az általunk fejlesztett teszt eszközök és szimulátorok a későbbiekben elérhetőek lesznek a LEGO Laborban, és más projektek is használhatják saját 'termékeik' teszteléséhez.

Az űrtechnológiában, így nálunk is előfordulnak küldetés specifikus teszteszközök, melyek a legtöbb esetben csupán egyszerhasználatosak illetve kifejezetten az adott eszköz teszteléséhez használhatók. Ezeknek a hardvereknek és szoftvereknek az elkészítése is az UPRA csapat feladatai közé tartozik.

Az alábbiakban bemutatjuk a MATeF-2 ballon tesztelése során használt tesztkörnyezetet.

# Teszt menedzsment

A tesztfolyamatok, Test Plan-ek és tesztesetek megtervezésére szükség van egy megfelelő, átlátható környezetre. Előnyös, ha ez a környezet alkalmas a tesztesetek kimeneteleinek vezetésére és a feladatok tesztmérnökök közti szétosztására is. Ezek a feladatok számontarthatók akár egy egyszerű Excel táblázatban is, viszont összetettebb tesztelés esetén ennek menedzselése átláthatatlanná válhat.

Csapatunk a [TestLink](http://testlink.org/) nevű ingyenes, böngésző alapú környezetet használja. A TestLink elsősorban szoftvertesztelésre lett kifejlesztve, de korábbi tapasztalataink alapján megfelelően alkalmazható hardveres környezetben is. A szoftver lehetőséget biztosít a tesztesetek átlátható rendezésére, tesztelők közti szétosztására valamint a tesztelés eredményeinek rögzítésére. A TestLink lehetőséget biztosít előformázott Test Report-ok készítésére és Issue Tracking eszközök integrálására is.

![](http://lego.sch.bme.hu/wp-content/uploads/2017/04/testlink01.png)

## Project

TestLink-ben a legmagasabb szerveződési szint a 'Project', esetünkben ez a 'MATeF', mivel a MATeF balloncsalád egyik tagját teszteljük. A 'Project' az adott termék teszteléséhez szükséges elemeket tartalmazza. Minden 'Project' saját Test Plan gyűjteménnyel rendelkezik. Ezek futtatásához létre kell hozni 'Build'-eket, amik az adott termék verzióit jelölik, így számontartható, hogy éppen melyik hardver/szoftver verziót teszteltük. Esetünkben a 'MATeF-2' verziót teszteljük, így egyelőre ez került a 'Build'-ek közé.

![](http://lego.sch.bme.hu/wp-content/uploads/2017/04/testlink02.jpg)

![](http://lego.sch.bme.hu/wp-content/uploads/2017/04/testlink03.jpg)

## Test Plan

Az cikksorozat első részében tárgyaltak alapján négy 'Test Plan'-t hoztunk létre:

  * Modul tesztek
  * Integrált Bench tesztek
  * Integrált környezeti tesztek
  * Integrált környezeti tesztek külső laborban
  
![](http://lego.sch.bme.hu/wp-content/uploads/2017/04/testlink04.jpg)

Minden 'Test Plan' a meghatározott területnek megfelelő teszteseteket tartalmazza. A tesztelés végén 'Test Plan'-ekről külön, egyesével generálható előformázott Test Report.

## TestCase

A TestLink-ben átlátható módon létrehozhatók a tesztesetek, melyek tartalmazzák a 'TestCase' összefoglaló leírását, a szükséges előkészületeket valamint a tesztelési lépéseket. Lehetőség van a komplett 'TestCase' sikerességének beállítása mellett az adott tesztelési lépések értékelésére is.

![](http://lego.sch.bme.hu/wp-content/uploads/2017/04/testlink05.jpg)

A tesztesetek átlátható rendezése érdekében lehetőség van az összetartozó 'TestCase'-ek 'TestSuit'-okba való rendezésére. Ennek kezeléséhez egy fájlkezelőkben megszokott fa-struktúra nézet van segítségünkre.

![](http://lego.sch.bme.hu/wp-content/uploads/2017/04/testlink06.jpg)

Az elkészült tesztesetek futtatásához a megfelelő 'Test Plan'-hez kell rendelni őket. Ez történhet komplett 'TestSuit'-ok vagy individuális 'TestCase'-ek hozzárendelésével is.

## Execution

A tesztelés megkezdése előtt a vezető tesztmérnök szétosztja a tesztelési feladatokat a 'TestCase'-ek tesztelőhöz rendelésével. Az 'Execution' ablakban a tesztelő kiválaszthatja a végrehajtani kívánt 'Test Plan'-t és 'Build'-et, valamint rászűrhet a felhasználói profiljához hozzárendelt 'TestCase'-ekre. Ezek után már csak a rá kiszabott feladatokat látja az 'Execution' ablakban.

![](http://lego.sch.bme.hu/wp-content/uploads/2017/04/testlink07.jpg)

A tesztelő a kiválasztott teszteset leírása és tesztelési lépések alapján végrehajtja a tesztet, majd beállítja a 'TestCase' kimenetét:

  * PASSED - sikeres teszt
  * FAILED - sikertelen teszt
  * BLOCKED - nem lehetett futtatni
  * NOT RUN - nincs lefuttatva

'FAILED' és 'BLOCKED' kimenet esetén lehetőség van támogatott Issue Tracker eszközben felvett ticket hozzárendelésére, valamint kimenettől függetlenül a tesztelő rövid kommentet csatolhat a 'TestCase'-hez.

A korábbi futtatások eredményét 'Build'-ekre bontva lehet olvasni a 'TestCase' fejlécében, mely a kimeneti eredmény mellett tartalmazza, hogy melyik felhasználó hajtotta végre a korábbi tesztet valamint a hiba ticketet linkjét, ha van.

A fent tárgyalt pontokon kívül további opciók meghatározására is lehetőséget biztosít a TestLink, melyeket jelen cikkben nem ismertetünk.

# GPS Szimuláció 

Az egyik legkritikusabb feladat a ballonos repüléseknél az eszköz helyének meghatározása, melyhez GPS navigációt használunk. GPS modul nem csak pozíció és magasságadatokat szolgáltat, hanem a rendszeridő szinkronizálását is a mindenkori GPS idő segítségével végezzük. A GPS rendszer tesztelése két rétegen zajlik: először magát a GPS vevőmodult teszteljük, majd ellenőrizzük, hogy az általa szolgáltatott NMEA üzeneteket megfelelően dolgozza-e fel a fedélzeti rendszer.

## GPS Modul Tesztelése

Magaslégköri ballonos repülések során az eszköz elérheti a 35-40km-es magasságot is. A legtöbb piacon fellelhető GPS vevőbe magasság korlátot építettek be, mely 10 vagy 18km-es magasság felett letiltja a modult. Ez a limit repülések során gondot okozhat, hiszen nagy magasságban nem tudjuk meghatározni a ballon pozícióját, így kiúszhat az antenna látószögéből és elveszítjük a kapcsolatot az eszközzel.

Bizonyos gyártók engedélyezik a GPS használatát 50km-es magasságig megfelelő konfiguráció után, ezt előnyös repülés előtt tesztelni, melyhez valós GPS jelekre van szükség. Laboratóriumi körülmények között a tesztelés GPS jelszimulátorral hajtható végre, mely a GPS műholdak által sugárzott rádiójeleket képes generálni. A csapatunk a [National Insturments által gyártott USRP 2920](http://www.ni.com/hu-hu/support/model.usrp-2920.html) jelgenerátor/jelfeldolgozó modul segítségével valósított meg egy GPS jelszimulátort, mely jelenleg statikus pozíció adatok sugárzására képes. A szimulátor szoftverben beállítható az idő, koordináták és a magasság is.

![](http://lego.sch.bme.hu/wp-content/uploads/2017/04/usrp.jpg)

A GPS modul tesztelése során a GPS vevőt és a szimulátor adóantennáját egy szigetelt helyiségbe helyezzük, mely kizárja a valódi GPS műholdak jeleit. A vizsgálat során a szimulátorral különböző magasságú koordinátákat sugárzunk és figyeljük a GPS modul által szolgáltatott NMEA üzenetek helyességét. A legkritikusabb rész a 18km-es magasság fölötti jelek vizsgálata. Amennyiben a GPS modul kimenetén hiteles NMEA üzenetek jelennek meg ebben a tartományban is, a modul alkalmas magaslégköri ballonos repülésekhez. Jelenleg a UBLOX által gyártott Neo-6M modult használjuk, mely 'Airborne' módban alkalmas GPS jelek vételére 50km-es magasságig. A GPS Szimulátorunkat egy későbbi cikkben részletesen is bemutatjuk.

## NMEA jelfeldolgozás tesztelése

A GPS modul által szolgáltatott NMEA jelek feldolgozása kritikus a ballon pozíciójának meghatározásához. Ennek teszteléséhez nincs szükség valódi GPS modul csatlakoztatására, a vizsgálathoz az 'NMEAFeeder' nevű PC-s szimulátor programot használjuk, mely szintén saját fejlesztésű.

Mivel a GPS modul az NMEA szabványban meghatározottak szerint UART porton kapcsolódik a fedélzeti számítógéphez, ezért a PC szimulátor soros(COM) porton keresztül összeköthető a ballon fedélzeti rendszerével. A szoftver szimulációs fájlok lejátszására alkalmas, melyek alapján a megfelelő NMEA üzeneteket küldi soros porton keresztül. A lejátszás szüneteltethető, újraindítható valamint kapcsolható, hogy az üzenetek kikerüljenek soros portra vagy ne. Utóbbi funkcióval a GPS jel elvesztését lehet szimulálni, és vizsgálni tudjuk a a fedélzeti rendszerbe épített hibakezelés/javítás funkciókat.

![](http://lego.sch.bme.hu/wp-content/uploads/2017/04/nmeafeeder.jpg)

PC szimulátoros tesztelés során általában komplett repülési útvonalakat játszunk vissza. A megfelelő NMEA szimulációs fájlok elkészítéséhez először a Shouthampton Egyetemen fejlesztett 'Astra Planner' Szimulátorral generálunk repülési adatokat. Ez egy online applikáció, mely segítségével ballonos repülési terveket lehet készíteni és az eredményeket .kml vagy .csv formátumba lehet exportálni. Az így generált .csv állományokból a csapatunk által fejlesztett 'AstraCSVconverter'-rel generálunk NMEA adatfolyamot, melyhez a 'GPSBabel' nevű applikációt is felhasználja. Az 'AstraCSVconverter' kimeneti állományai közvetlenül felhasználhatók az 'NMEAFeeder' számára.

![](http://lego.sch.bme.hu/wp-content/uploads/2017/04/astraconverter.jpg)

A szimuláció elindítása után a fedélzeti rendszer belső kommunikációs buszán futó üzenetek, rádiós telemetria csomagok valamint a fedélzeti számítógép által generált rendszernapló vizsgálatával tudjuk ellenőrizni a jelfeldolgozás helyességét. A tesztelés során gyűjtött adatokból generált .kml és az 'Astra Planner' szimulációjából exportált .kml fájl 'GoogleEarth'-ben történő összehasonlításával pontos képet kapunk az NMEA jelfeldolgozás helyességéről.

# Modulok Közti Kommunikáció

A fedélzeti rendszer moduljai az 'UPRA BUS'-on keresztül kapcsolódnak egymáshoz, mely tartalmaz egy elsődleges kommunikációs vonalat, mely CAN Busz alapú valamint egy másodlagos kommunikációs vonalat, mely UART alapú. A MATeF rendszer moduljai jelenleg csak a másodlagos vonalat(SICL) használják, melynek vizsgálata egyszerű USB-UART átalakítóval megoldható.

A modulok közti kommunikáció teszteléséhez az 'UPRA Simulator' nevű saját fejlesztésű szoftvert használjuk, mely soros porton kapcsolódik a vizsgálni kívánt modulhoz és szoftveresen szimulálja a többi modul működését. Az alkalmazásban kiválasztható, hogy mely modul működését vizsgáljuk és mely modulokat kívánjuk szoftveresen szimulálni a tesztelés során. A szimuláció futtatása közben a különböző paraméterek (GPS koordináták, magasság, külső-belső hőmérsékletek, buszfeszültség, stb.) kézzel állíthatók és hamarosan szimulációs fájlok lejátszására is lesz lehetőség. A szoftver részletes logot készít a buszon küldött és fogadott üzenetekről valamint valós időben kijelzi a buszon folyó kommunikációt. Lehetőség van a szimulált modulok tesztelés közbeni leállítására, mellyel a különböző time-out-okat és beragadásokat tudjuk vizsgálni.

![](http://lego.sch.bme.hu/wp-content/uploads/2017/04/upra_simulator.jpg)

Az összeállított fedélzeti rendszer vizsgálata során a kommunikációs buszvonalakat közvetlenül a PC-re kötjük és terminál programmal vizsgáljuk a buszon folytatott üzenetváltások helyességét.

# Rádiós Kommunikáció

A rádiós kommunikációt több szempont alapján vizsgáljuk: a rádiós csomagok helyessége, a rádiós kapcsolat minősége és nagytávolságú kapcsolat stabilitása.

## Rádiós csomagok helyessége

A kommunikációs(COM) modul által küldött és fogadott csomagok helyességét a földi vevőállomásunkkal(GND) teszteljük. A COM modul működtetéséhez a korábban bemutatott 'UPRA Simulator' vagy az összeállított fedélzeti rendszer is használható. A tesztelés során vizsgáljuk, hogy a GND által fogadott telemetria és adatcsomagok megfelelő formátumban érkeznek és helyes adatokat tartalmaznak-e, valamint ellenőrizzük, hogy a GND által küldött parancs csomagok megfelelően feldolgozásra kerülnek-e a COM modul által. A tesztelés lebonyolításához a repülés során is használt EZ-GND saját fejlesztésű földi állomás vezérlőszoftvert használjuk.

## Rádiós kapcsolat minődége

A rádiós kapcsolat minőségét spektrumanalizátorral vizsgáljuk, mellyel kimérhetjük a frekvenciát, frekvencia löketet, sávszélességet és az adóteljesítményt is. A mért adatokat összehasonlítjuk a specifikációban megadott értékekkel és ellenőrizhetjük a COM modul felkonfigurálásának helyességét.

![](http://lego.sch.bme.hu/wp-content/uploads/2017/04/spektrum.jpg)

Gyors, kevésbé részletes teszteléshez egyszerű USB-s DVB-T vevőt használunk, melyet az 'SDRSharp' nevű programmal üzemeltetünk.

![](http://lego.sch.bme.hu/wp-content/uploads/2017/04/dvbt.jpg)

A programban vízesés diagram és jel-spektrum segítségével kevésbé pontos méréseket tudunk végezni. Az 'SDRSharp'-ot elsősorban monitorozásra használjuk a legtöbb rádiós tesztelés során.

![](http://lego.sch.bme.hu/wp-content/uploads/2017/04/sdrsharp.jpg)

## Nagytávolságú rádiós tesztek

A rádiós kommunikáció stabilitását nagytávolságú, kitelepült mérésekkel vizsgáljuk. A teszelés során az összeállított fedélzeti rendszert külső helyszínen üzemeltetjük és a Földi Állomásunkkal vesszük a jeleit. A tesztelés során jelerősséget mérünk különböző antenna beállítások mellett valamint ellenőrizzük a rádiós csomagok helyességét. A tesztelés eredményei alapján elméleti maximális hatótávlolságot tudunk számolni.

![](http://lego.sch.bme.hu/wp-content/uploads/2017/04/nagytavolsag.jpg)

# Környezeti Körülmények

Jelnleg a legkritikusabb környezeti körülmény, az extrém alacsony hőmérséklet szimulálására van lehetőségünk. Ehhez egy saját készítésű hűtőkamrát használunk, melyet egy hagyományos fagyasztóból alakítottunk át. A hűtőkamra fejlesztése jelenleg is folyik, a tervek szerint -20°C alatti hőmérsékletet tudunk majd elérni vele. A hűtőkamrába beszerelésre kerül egy csatlakozósziget, mely segítségével a tesztelni kívánt modul diagnosztikai jelei kivezethetők a kamrán kívülre, a tesztelt modulra hőmérő szenzorok rögzíthetők valamint szimulációs jelek is biztosíthatók az eszköz felé. Az egyenletes hőeloszlást ventillátorral segítjük majd, valamint a kamra különböző pontjain mért hőmérsékletek alapján monitorozhatjuk a belső környezetet. A hűtőkamra teljes vezérlését National Instruments CompactRio eszközzel tervezzük megvalósítani, mely a környezeti beállítások mellett a mérések elvégzésére is alkalmas.

Az általunk fejlesztett hűtőkamrában a ballon moduljait szigetelés nélkül teszteljük, ezzel szimulálva a szigetelésen belüli hőmérsékletet, melyek a tapasztalatok alapján nem süllyed -20°C alá. A hűtőkamra jelenlegi állapotában is használható egyszerűbb mérések elvégzésre -15°C körüli hőmérsékleten.

A komplett, szigetelésbe épített rendszer teszteléséhez külső labor segítségét kell igénybe vennünk, mely rendelkezik -50°C hőmérséklet generálására képes termo-kamrával. Ezeknek a teszteknek jelenleg folyik az egyeztetése a BME Űrkutató Csoporttal.
