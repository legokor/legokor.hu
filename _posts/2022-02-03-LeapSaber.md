---
title: Leap Saber - Beat Saber adaptálása kézkövetésre
layout: post
author: szakal-vince-abosa
image: https://github.com/legokor/legokor.hu/blob/master/images/posts/Smarthome_19_10_29/7.SH_Haz_Modell_Profil_Alpha.png?raw=true

excerpt: A virtuális valóságban használt 3D követett kontrollerekről Leap Motion alapú kézkövetésre való adaptációja során sok probléma merült fel, melyek megoldása nagyon tanulságos volt.
---

A Beat Saber az világ egyik legnépszerűbb virtuális valóság (VR) játéka. A projekt célja a játék lemásolása és VR kontrollerek helyett kézkövetéssel való vezérlése. A Leap Motion különleges lehetőségei egyszerre adnak új lehetőségeket és korlátozásokat a játék kezelésére. Ezek kiegyensúlyozása volt a projekt egyik legérdekesebb része.

# A Leap Motion szenzor

A szenzor célja általános kézkövetés, tehát minden ízület és az alkar pozícióját is képes követni real-time, kicsi késleltetéssel. A szenzor működésének alapja egyszerű, két nagy látószögű infravörös kamera alapján követi a kézmogást, melyeket IR LED-ek általi megvilágítás segít.
Az eszköz látómezeje kb. 140x120° és nagyjából a szenzortól 10-60cm-re követ a legjobban. A mostanra Ultraleap-re átnevezett cég nemrég adott ki egy firssített hardvert, mely 170x170°-os látómezővel rendelkezik és főleg VR headset-ekbe és bevásárlóközponti kiosk-ok érintésmentes kezelésére optimalizálták.



![](/images/posts/Smarthome_19_10_29/1.SBC-NODEMCU-ESP32-01.png) 
<p style="text-align: center; font-size: 10px;">A Leap Motion szenzor felépítése</p>

A szoftver oldalon az Ultraleap által folyamatosan fejlesztett szoftver elérhető több programozási nyelven, illetve Unity integráció formájában is, illetve a szenzor nyers adatai használhatóak általános gépi látási feladatokra is UVC webkamera interfészen keresztül.

![](/images/posts/Smarthome_19_10_29/1.SBC-NODEMCU-ESP32-01.png) 
<p style="text-align: center; font-size: 10px;">A Leap Motion legújabb szoftveránek összehasonlítása az előző verzióval</p>

# Beat Saber

![](/images/posts/Smarthome_19_10_29/2.nyak_esp32.png)  

A Beat Saber megjelenése óta töretlen népszerűségnek örvend egyszerű, látványos játékmenetének és az egyre bővülő dal választéknak köszönhetően. A hivatalos pályákon kívül egy nagy közösség alakult ki plusz pályák készítésére, ami széles és folyamatosan frissülő választékot biztosít.
A projekt szempontjából nagyon előnyös volt a relatíve egyszerű felépítése és játékmenete.
Az játékmenet lényege, hogy a játékos felé érkező ritmushoz igazított kockákat a megfelelő irányban vágja el. 

## "Inspiráció"

![](/images/posts/Smarthome_19_10_29/2.nyak_esp32.png)  

A projekt ötlete egy [Twitter posztból](https://twitter.com/pushmatrix/status/1260209543864356865) származik, de mivel ez a Quest 2 VR headset-re készült és nem volt elérhető a forráskódja, az itt bemutatott projekt teljesen tiszta lappal kezdődött.
![](/images/posts/Smarthome_19_10_29/3.nyak_szenzor.png) 


# Leap adaptáció fő problémái

## Nem a kezére néz az ember
A kockák folyamatos érkezése azt eredményezi, hogy sokszor előre nyúlna az ember hogy hamarabb elérje a kockákat, ezzel előidézve több problémát. Könnyű olyan helyre kerülnie a kezeknek, ahol a szenzor már  nem képes jól követni őket. Ezen kívül a kockák nem feltétlen ugyanabban az időben érik el a kardokat. Ez a VR verzióban is így van, de a kezek a kockákhoz képesti nagyságuk miatt sokkal többet tudnak előre-hátra mozogni. 
Ezt a problémát több módon is próbáltam orvosolni: először is kikapcsolatam a mélység követést, valamint a kezek színét a szenzortól való távolsággal változtatom figyelmeztető visszajelzés képpen.

## Követés
A kardok az ujjak végéhez való rögzítése egy kézenfekvő döntésnek tűnik, de valójában több gond is van vele: a szög természetellenes a játék közben és a Leap mutatóujjat elég zajosan tudja csak követni néhány szögben.
Ennek megoldására a szenzorhoz képest a kezek el vannak tolva, a kardok pedig a csuklóhoz lettek kötve és egy kényelmes és játékmenethez megfelelő szögben állnak.

# Pályák betöltése

A Beat Saber pályák betöltésének lehetősége nem volt az eredeti terv része, de egy kis utánajárás után kiderült, a játék egy JSON alapú, dal készítő közösségnek köszönhetően alaposan dokumentált formátumot használ. Egy külön [wiki oldal](https://bsmg.wiki/mapping/map-format.html) van szentelve a formátum részleteinek, melyek könnyen feldolgozhatónak bizonyúltak.
Ugyan nem minden részét használja fel a map formátumnak a Leap-es változat, de a pályák lényegi része így felhasználható. Ennek a megoldásnak a nagy előnye, hogy a játék akármilyen Beat Saber-hez készült map-el használható, melyekból óriási válaszék elérhető például a [BSaber](https://bsaber.com/) oldalon, vagy akár AI segítségével tetszőleges YouTube videóból generálható egy a [BeatSage](https://beatsage.com/) segítségével.
A pályák egy mappából dinamikusan töltőnek be minden indításkor, így akármikor bővíthető a dal választék.
![](/images/posts/Smarthome_19_10_29/4.blockly.png) 

# Menük
A Leap-es kézkövetésben nincs semmilyen beépített kurzor, és ugyan vannak megoldások hogy hogy lehet rámutatni dolgokra, de egyik sem teljesen optimális.
Ennek megoldására a menü a játékmenetnek egy kiterjesztése és így egyféle tutorial-ként is szolgál. A videón is látható módon a kiválasztáshoz a megfelelő kockát kell elvágni.

# Effektek
A kockák dinamikus átvágása fontos része a Beat Saber ikonikus grafikájának. Ezt az [EzySlice](https://github.com/DavidArayan/ezy-slice) bővítménnyel valósítottam meg. Az elvágott darabok azonban felgyűltek a kezek alatt, ami ugyan szórakoztató volt egy ideig, hosszú távon zavaró volt a játékmenet szempontjából.
Ennek javítására egy robbanásszerű impulzust adok minden darabnak, aminek következtében lerepülnek a pályáról.
A bloom is fontos része volt a grafikának, ami a [KinoBloom](https://github.com/keijiro/KinoBloom) bővítmény segítségével valósítottam meg.

![](/images/posts/Smarthome_19_10_29/4.blockly.png) 

# Hova tovább?
A projekt több részét is tervezem még fejleszteni, például egy Leaderboard készítésével, valamint egy komplexebb pontozási rendszerrel. A kényelem sokat javult a fejlesztés során, de úgy gondolom egy kis kiísérletezéssel még jobbá lehetne tenni. Ezen kívül a Leap más szögekben való elhelyezésével is próbálkozni akarok.
Az egyik legérdekesebb továbbfejlesztési irány pedig a HoloLens vagy Quest 2 kézkövetésre való átültetés lenne, melynek megvalósítására már van is elképzelésem.


