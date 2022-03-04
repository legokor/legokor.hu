---
title: Leap Saber - Beat Saber adaptálása kézkövetésre
layout: post
author: szakal-vince-abosa
image:https://warp.sch.bme.hu/img/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBa1lCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--540bd49f77245068dc74be36d0098d6a760edaf5/thumbnail.jpg

excerpt: A virtuális valóságban használt 3D követett kontrollerekről Leap Motion alapú kézkövetésre való adaptációja során sok probléma merült fel, melyek megoldása nagyon tanulságos volt.
---

A Beat Saber az világ egyik legnépszerűbb virtuális valóság (VR) játéka. Ezen projekt célja a játék lemásolása és VR kontrollerkről kézkövetéssel való vezérlésre adaptálása volt. A Leap Motion különleges lehetőségei egyszerre adnak új lehetőségeket és korlátozásokat a játék kezelésére. Ezek kiegyensúlyozása volt a projekt egyik legérdekesebb része.

# A Leap Motion szenzor

Az eszköz célja általános kézkövetés, tehát minden ízület és az alkar pozícióját is képes követni valós időben, kicsi késleltetéssel. A szenzor működésének alapja egyszerű: két nagy látószögű infravörös kamera alapján követi a kézmozgást, melyeket IR LED-ek általi megvilágítás segít.
Az eszköz látómezeje kb. 140x120° és nagyjából a szenzortól 10-60cm-re követ a legjobban. A mostanra Ultraleap-re átnevezett cég nemrég adott ki egy frissített hardvert, mely 170x170°-os látómezővel rendelkezik és főleg VR headset-ekbe és bevásárlóközponti kiosk-ok érintésmentes kezelésére optimalizálták.

![](https://warp.sch.bme.hu/img/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBa0FCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--e5cf51f230b034d09cfa1dc21e0226020fdfb1c7/image8.png) 
<p style="text-align: center; font-size: 10px;">A Leap Motion szenzor felépítése</p>

Az adatok feldolgozására az Ultraleap által folyamatosan fejlesztett illesztőprogram elérhető több programozási nyelven, illetve Unity integráció formájában is, illetve a szenzor nyers adatai használhatóak általános gépi látási feladatokra is UVC webkamera interfészen keresztül.

![](https://warp.sch.bme.hu/img/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBa0VCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--d317434e34d45a9c37e17f0c1bae3a6ede372d3a/image10.gif) 
<p style="text-align: center; font-size: 10px;">A Leap Motion legújabb szoftverének összehasonlítása az előző verzióval</p>

# Beat Saber

![](https://warp.sch.bme.hu/img/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBajhCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--178f50cd81307a693f25618d70d91353282d127a/image11.gif)  

A Beat Saber megjelenése óta töretlen népszerűségnek örvend egyszerű, látványos játékmenetének és az egyre bővülő dal választékának köszönhetően. A hivatalos pályákon kívül egy nagy közösség is kialakult plusz pályák készítésére, ami széles és folyamatosan frissülő választékot biztosít a még több dalra vágyó játékosoknak.
Az játékmenet lényege, hogy a játékos felé érkező ritmushoz igazított kockákat a megfelelő irányban vágja el. A projekt szempontjából nagyon előnyös volt hogy egyszerű a felépítése és játékmenete, mivel sokkal könnyebb volt a fejlesztés és hamarabb lehetett az adaptációra fókuszálni.

## "Inspiráció"

![](https://warp.sch.bme.hu/img/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBa01CIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--df8cad8faf0ba9adc359b2f017e3dcbc4c0aed5c/inspiration.gif)  

A projekt ötlete eredetileg egy [Twitter posztból](https://twitter.com/pushmatrix/status/1260209543864356865) származik, de mivel ez a Quest 2 VR headset-re készült és nem volt elérhető a forráskódja, az itt bemutatott projekt teljesen tiszta lappal kezdődött.

# A Leap adaptáció fő problémái

## Kéz elhelyezkedés
A kockák folyamatos érkezése azt eredményezi, hogy sokszor előre nyúlna az ember hogy hamarabb elérje a kockákat, ezzel előidézve több problémát. Először is könnyű olyan helyre kerülnie a kezeknek, ahol a szenzor már  nem képes jól követni őket. Ezen kívül a kockák nem feltétlen ugyanabban az időben érik el a kardokat. Ez a VR verzióban is így van, de a kezek a kockákhoz képesti nagyságuk miatt sokkal többet tudnak előre-hátra mozogni. 
Ezt a problémát több módon is próbáltam orvosolni: kikapcsoltam a mélység követést, valamint a kezek színét a szenzortól való távolsággal változtatom figyelmeztető visszajelzésképpen.

## Követési minőség
A kardok az ujjak végéhez való rögzítése egy kézenfekvő döntésnek tűnt, de valójában több gond is volt vele: a szög természetellenes a játék közben és a Leap mutatóujjat elég zajosan tudja csak követni néhány szögben.
Ennek megoldására a szenzorhoz képest a kezek el vannak tolva, a kardok pedig a csuklókhoz lettek rögzítve és egy kényelmes és játékmenethez megfelelő szögben állnak.

# Pályák betöltése

A Beat Saber pályák betöltésének lehetősége nem volt az eredeti terv része, de egy kis utánajárás után kiderült, a játék egy JSON alapú, a dal készítő közösségnek köszönhetően alaposan dokumentált formátumot használ. Egy külön [wiki oldal](https://bsmg.wiki/mapping/map-format.html) van szentelve a formátum részleteinek, melyek könnyen feldolgozhatónak bizonyultak.
Ugyan nem minden részét használja fel a map formátumnak a Leap-es változat, de a pályák lényegi része így megjelenítésre kerül. Ennek a megoldásnak a nagy előnye, hogy a játék akármilyen Beat Saber-hez készült map-el használható, melyekből óriási válaszék elérhető például a [BSaber](https://bsaber.com/) oldalon, vagy akár AI segítségével tetszőleges YouTube videóból generálhatóak a [BeatSage](https://beatsage.com/) segítségével. A pályák egy mappából dinamikusan töltőnek be minden indításkor, így akármikor bővíthető a dal választék.

# Menük
A Leap-es kézkövetésben nincs semmilyen beépített kurzor, és ugyan vannak megoldások arra, hogy hogyan lehet rámutatni dolgokra, de egyik sem teljesen optimális.
Ennek megoldására a menüt átdolgoztam hogy a játékmenet egyféle kiterjesztése legyen és így egy egyszerű tutorial-ként is szolgál. A videón is látható módon a kiválasztáshoz a megfelelő kockát kell elvágni.

![](https://warp.sch.bme.hu/img/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBa1VCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--7635dc60baefd2bb52c45d59e994de82d586c5c5/menu.gif) 


# Effektek

![](https://warp.sch.bme.hu/img/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBa1FCIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--9397f1f96437b3cf3657c97219629dfcd0fc1149/dynamicSlicing.gif) 

A kockák dinamikus átvágása fontos része a Beat Saber ikonikus grafikájának. Ezt az [EzySlice](https://github.com/DavidArayan/ezy-slice) bővítménnyel valósítottam meg. Az elvágott darabok azonban felgyűltek a kezek alatt, ami ugyan szórakoztató volt egy ideig, de hosszú távon zavaró volt a játékmenet szempontjából.
Ennek javítására egy robbanásszerű impulzust adok minden darabnak, aminek következtében lerepülnek a pályáról.
A bloom is fontos része volt a grafikának, amit a [KinoBloom](https://github.com/keijiro/KinoBloom) bővítmény segítségével valósítottam meg.

# Az elkészült játék
<iframe width="894" height="503" src="https://www.youtube.com/embed/14ZVVkqxJ4c" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

# Hova tovább?
A projekt több részét is tervezem még fejleszteni, például egy Leaderboard készítésével, valamint egy komplexebb pontozási rendszerrel. A kényelem sokat javult a fejlesztés során, de úgy gondolom egy kis kísérletezéssel még jobbá lehetne tenni. Ezen kívül a Leap más szögekben való elhelyezésével is próbálkozni akarok.
Az egyik legérdekesebb továbbfejlesztési irány pedig a HoloLens vagy Quest 2 kézkövetésére való átültetés lenne, melynek megvalósítására már van is elképzelésem.


