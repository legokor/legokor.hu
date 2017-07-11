---
layout: post
author: komposzt
title: Magaslégköri Ballon Tesztelése – 1. rész
image: http://lego.sch.bme.hu/wp-content/uploads/2017/03/Testing_in_Progress.gif
---
Ebben a cikksorozatban egy keveset emlegetett, ám annál fontosabb folyamatot fogunk bemutatni, a tesztelést. A cikkekben néhány alapfogalom és módszer mellett részletesen bemutatjuk az UPRA Projekt MATeF-2 ballonjának tesztelését.

Magaslégköri Ballon esetében nagyon fontos a tesztelés, hiszen hasonlóan az űreszközökhöz a küldetés során nincs lehetőség közvetlen fizikai interakcióra az eszközzel, ezért bármilyen meghibásodás a küldetés végét jelentheti, ami az eszköz elvesztésével járhat. Ahhoz, hogy ne érjen minket meglepetés a repülés során, a felbocsátást megelőzően körültekintően meg kell vizsgálnunk az eszköz működését és fel kell térképeznük a lehetséges veszélyforrásokat. Az űrtechnológiában bármilyen hibajavítás után a tesztelést gyakorlatilag előről kell kezdeni, hogy kizárhassuk annak a lehetőségét, hogy a módosítás hibát okozzon a korábban jól működő funkciókban.

## Tesztelési alapfogalmak

### White-Box Teszt

Elsősorban szoftver tesztelésére való metódus. A tesztelés során az egyes szoftverfunkciók kódszintű működését vizsgáljuk, a tesztelőnek megfelelő rálátással kell rendelkeznie az egyes függvények működésére és ismernie kell a részletes specifikációt.

### Black-Box Teszt

Hardver és szoftver tesztelésére is használható metódus. A teszt során az egyes bemeneti paraméterekre adott válaszokat vizsgáljuk, melyhez a rendszer specifikációjának ismerete szükséges. Ebben az esetben a tesztelőnek nem kell ismernie a rendszer belső felépítését.

### Bench Teszt

Szó szerinti értelmezésben “tesztelés az asztalon”, vagyis laborkörülmények közötti tesztelés, mely során a működő rendszert különböző vizsgálatoknak vetjük alá, a változó paramétereket valamilyen szimulátorral tudjuk előállítani (pl. GPS jel szimulátor)

### Környezeti Teszt

A működő rendszert olyan környezeti hatásoknak tesszük ki, melyek a valós működés során érhetik. Tipikusan ilyen tesztek a termo-vákum és pára kamrás tesztek

### Test Plan

A tesztelési stratégiát leíró dokumentum, mely meghatározhatja a teljes rendszer tesztelési folyamatát, de az egyes részegységek is rendelkezhetnek önálló Test Plannel. A Test Plan tartalmazza a teszt különböző követelményeit (lefedettség, kimenetek, sikerességi feltétel) valamint az egyese tesztesetek leírását

### Test Case

Az egyes tesztesetek tartalmazzák az adott funkció teszteléséhez szükséges információkat, a tesztelés lépéseit, kimeneti és sikerességi feltételeket.

## Tesztelés Lépései

### Test Plan Elkészítése

A tesztelés megtervezéséhez szükség van a rendszer részletes specifikációjára, melyet a fejlesztés elején meghatároztunk. Ez tartalmazza az eszközzel és működésével szemben elvárt követelményeket, melyek alapján megtervezésre kerülhet a Test Plan.

A MATeF-2 Ballon esetében a legkritikusabb követelmények:

- Folyamatos Autonóm működés
- Folyamatos rádió kapcsolat
- Működés extrém alacsony hőmérsékleten
- Működés alacsony nyomáson
- Cseppállóság
- Rázásállóság
- Landolási behatások elleni védelem

Ezek alapján kidolgoztuk, hogy az egyes modulokat és az integrált rendszert milyen teszteléseknek kell alávetnünk:

- Beágyazott szoftver tesztek:

  White-Box tesztek során az egyes függvények és a kész kódok működését vizsgáltuk. A szoftver tesztelése a fejlesztéssel párhuzamosan zajlott
- Modul tesztek:

  Az egyes alrendszereket önállóan vizsgáltuk. Ezek Black-Box tesztek voltak és megfelelő szimulátorokat használtunk hozzá
- Integrált Bench tesztek:

  Az integrált rendszer működését vizsgáltuk labor körülmények között
- Integrált környezeti tesztek:

  Az integrált rendszer működését vizsgáltuk hűtőkamrá(k)ban, szigeteléssel és anélkül, valamint különböző terepi teszteket hajtottunk végre a rádiós rendszerek teszteléséhez.

A fenti felosztás alapján négy különálló Test Plan-t határoztunk meg, melyekhez eklkészítettük a szükséges teszteseteket. Mivel biztonságkritikus, űrközeli eszközről van szó, ezért a sikeres tesztkampányhoz minden tesztesetet sikeresen teljesítenie kell. Előfordulhat olyan tesztkampány, mely során nem kell 100%-os sikeresség ahhoz, hogy a tesztelt eszköz megkapja az üzembehelyezési engedélyt. Ehhez a vezető tesztmérnöknek és a vezető fejlesztőmérnök(ök)nek kell meghatározni a sikerességi kritériumot a specifikáció alapján.

### Modul tesztek

A Modul tesztek során a ballon egyes alrendszereit önállóan teszteltük. A vizsgálat során egy PC-s szimulátor programot használtunk, mely képes minden egyes alrendszer működését szimulálni. A vizsgált modul a rendszerbuszon keresztül kapcsolódik a szimulátorhoz és a különböző rendszereseményekre adott válaszát vizsgáljuk.

A MATeF-2 ballon tesztelése során az alábbi alrendszereket vizsgáltuk:

- OBC – Fedélzeti Számítógép modul
- Main GPS – Elsődleges GPS modul
- COM – UHF rádiós kommunikáció modul
- EPS – Elektromos Energiaellátó Egység
- Backup GPS – Tartalék GPS modul

### Integrált Bench tesztek

Integrált tesztek során az alrendszereket a repülési konfigurációnak megfelelően összekötöttük és így a komplett repülő rendszeren végeztük el a tesztelést. Bench tesztek során az egység saját áramforrásról üzemelt, a szenzorok és beavatkozók is csatlakoztatva voltak valamint a működést a megfelelő diagnosztikai vonalak és a rendszer busz figyelésével ellenőriztük.

A tesztelés során egyes kiragadott szituációk mellett komplett repülés szcenáriókat is teszteltünk, melyhez különböző szimulátorokat használtunk.

### Integrált környezeti tesztek

A környezeti tesztelést két lépcsőben végeztük el. A MATeF-2 esetében a legkritikusabb környezeti tényező az extrém alacsony hőmérséklet. A működés vizsgálatához hűtőkamrát használtunk. Az UPRA csapat saját fejlesztésű hűtőkamrája -15 és -20°C közötti hőmérséklet előállítására képes. Ebben a kamrában szigetelés nélkül, a bench tesztekhez hasonló részletességű vizsgálatnak vetettük alá a rendszert.

A repülés során akár -50°C alatti hőmérséklet is felléphet. Ennek teszteléséhez komolyabb hűtőkamrára van szükség. A cikk megjelenésekor még egyeztetés alatt van a HVT Űrkutató Csoport termo-vákum kamrájának kibérlése, melyben szigetelésben, -50°C-os hőmérsékleten egy komplett repülést szeretnénk szimulálni.

### Kiértékelés és dokumentálás

A tesztek végrehajtása után a tesztmérnökök kiértékelik a lefuttatot teszteket és teszt report-ot készítenek, melyben részletesen tárgyalva vannak a végrehajtott tesztek, körülmények és a felmerült problémák. Amennyiben a repülés során bármilyen meghibásodás következik be, a vizsgálat során a tesztelési dokumentációt is meg kell vizsgálni és bármilyen hiányosság esetén a vizsgálat alapján ki lehet egészíteni a Teszt Plant, hogy a következő felbocsátás előtt az újonnan felmerült eseteket is lehessen viszgálni.

---

A cikksorozat következő részeiben a teszteléshez használt eszközöket, szoftvereket és szimulátorokat fogjuk bemutatni, majd részletesen bemutatjuk az egyes Test Planek futtatása során végrehajtott lépéseket.
