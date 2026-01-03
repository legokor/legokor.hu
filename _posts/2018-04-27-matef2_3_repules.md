---
title: UPRA Tavaszi Felbocsátások
layout: post
author: goczan-bence
image: /images/posts/matef2-3_cikk/matef2-3_cikk_borito.jpg
excerpt: Az UPRA csapat idén ismét a szokásos, tavaszi felbocsátási ablakban reptetett ballont. A szokásoktól eltérően azonban idén kettő ballon is felszállt...és mindkettőt sikerült begyűjteni a repülés után!
---

Az UPRA csapat idén ismét a szokásos, tavaszi felbocsátási ablakban reptetett ballont. A szokásoktól eltérően azonban idén kettő ballon is felszállt...és mindkettőt sikerült begyűjteni a repülés után!

A MATeF-2 és MATeF-3 küldetéseknek két fő célja volt
* Éles repülésen tesztelni az elmúlt két évben fejlesztett fedélzeti rendszert
* Megvizsgálni, hogy a csapat képes-e rövid határidővel újra felbocsátani

A két repülés között kevesebb mint három hét telt el, ami alatt megvizsgáltuk az első repülésen begyűjtött platform állapotát, visszavezettük a rendszerbe az első felbocsátás során felmerült javításokat és felkészítettük a ballont a második repülésre. A cél az volt, hogy a második repülésen ugyanazt a rendszert tudjuk használni, mint az elsőn, ezzel előkészítve a terepet a ReHAB, újrafelhasználható küldetéseknek.


# UPRA-MATeF Platform
![](/images/posts/matef2-3_cikk/matef_description.jpg)

![](/images/posts/matef2-3_cikk/matef_flightmodel.jpg)


# MATeF-2

2018.03.31-én indítottuk a MATeF-2 ballonunkat, mely a rendszer első éles repülése volt. Az emeléshez Totex 200 grammos (TA200) időjárási ballont használtunk. A repülés tervezése során figyelembe vettük az aktuális széljárást és a szimulációk alapján maximum 18km-es célmagasságot jelöltünk ki. Mivel a rendszer korábban nem repült, ezért tudományos mérőeszközt nem helyeztünk el a fedélzeten, a ballon csak telemetria adatokat gyűjtött.

A felbocsátás a szokásos helyszínen, a BME Q épülete mögötti prakos részen zajlott, a földi állomást a Q épület teraszán állítottuk fel.

![](/images/posts/matef2-3_cikk/matef2-gnd.jpg)


A ballon töltése problémamentesen zajlott és nagyjából fél órát vett igénybe.

![](/images/posts/matef2-3_cikk/matef2_launch.jpg)


A földi állomásunk 9km-es magasságig tudta követni a ballon útját, ekkor rálátási problémák miatt elvesztettük a rádiós kapcsolatot. Egy kisebb technikai probléma miatt a keresőcsapat ekkor még nem tudott elindulni. A csapat átköltöztette a földi állomásth a Schönherz Kollégiumba és közben felkészült a keresőcsapat is, akik már a ballon kidurranása után, az ereszkedő fázisban indultak a ballon begyűjtésére. A fedélzeten elhelyezett kísérleti APRS modul segítségével végig tudtuk követni a ballont, mely a szimulációkhoz képest lassabb ereszkedést produkált.


Sajnos a földi állomásunk nem tudott újra kapcsolatot teremteni a ballonnal, viszont az APRS-nek köszönhetően a keresőcsapat pontosan a jelzett utolsó koordinátán megtalálta a ballont, mely még ekkor is kiválóan üzemelt.

![](/images/posts/matef2-3_cikk/matef2-reco.jpg)


A ballon 14957m-es magasságot ért el, mely a felbocsátást megelőző szimulációnak megfelelő érték.

![](/images/posts/matef2-3_cikk/matef2_alt.jpg)


A repülés után megvizsgáltuk a repülő hardvert, mely kiválóan működött és elkezdtük a fedélzeten gyűjtött adatok vizsgálatát.

A hőmérséklet adatokat összevetettük az OMSZ aznapi ballonengedésének adataival, mely a mi repülésünk után két órával zajlott le. Az általunk gyűjtött értékek jellegüket tekintve megegyeztek a hivatalos értékekkel. Az eltérésből két dologra következtettünk:
* A hőmérőnk kalibrálásra szorul
* A hőmérő elhelyezkedéséből fakadóan valószínűleg fűti magát

![](/images/posts/matef2-3_cikk/matef2_temp.jpg)


A szigetelő kapszula belsejében mért hőmérsékleti adatokat összehasonlítottuk a klímakamrás mérés során gyűjtött értékekkel. A hőmérséklet változás jellege és mértéke megegyezett a tesztelés során beállított hőprofillal, ami fontos visszajelzés a jövőbeni tesztelések tervezéséhez.

![](/images/posts/matef2-3_cikk/obc_temp.jpg)


Megvizsgáltuk a vertikális sebbeségadatokat is. Az emelkedési sebesség a tervezettnek megfelelően alakult, a görbe egyenetlensége a széláramlatoknak és a ballonrendszer sajátosságainak tudható be. A süllyedési sebességprofil nagyban eltért a szimulált értékektől. 

![](/images/posts/matef2-3_cikk/matef2_spd.jpg)


Az ejtőernyő vizsgálatából kiderült, hogy az ereszkedési görbe nem számolható pusztán az ernyővel, figyelembe kell venni a széthasadt ballon "vitorla-tulajdonságát" is. Sajnos ez egy nem-determinisztikus érték, mely hatásának csökkentése érdekében elkezdtünk kidolgozni különböző módszereket, hogy a jövőben pontosabb előrejelzéseket tehessünk a landolás helyét illetően.

![](/images/posts/matef2-3_cikk/matef2-sim.jpg)



# MATeF-3 (Konferencia II)

2018.04.18-án a XV. Simonyi Konferencián újrareptettük a rendszert a MATeF-3 (Konferencia II) küldetés keretében. A repülés szinte napra pontosan az első repülésünk negyedik évfordulóján történt. A repülés során a MATeF-2 felbocsátás során használt rendszert kiegészítettük egy payload gondolával, melyben egy kamera és a saját fejlesztésű GPS-GSM trackerünk foglalt helyet. Ezekkel a kiegészítésekkel a MATeF-3 repülésünkkel nevezhettünk az idei [Global Space Balloon Challenge](https://balloonchallenge.org/)re, melynek felbocsátási ablaka 2018.04.13. és 04.30 között volt.

A felbocsátás ismét a BME Q épület mögött zajlott. A földi állomásunkat az ELTE Asztrofizika Tanszék csillagvizsgálójának(pontosítást igényel) platformján állíthattuk fel, mely tökéletes rálátást biztosított a repülés útvonalára.

![](/images/posts/matef2-3_cikk/matef3-gnd.jpg)


A felbocsátás kisebb technikai problémától eltekintve a tervezettnek megfelelően zajlott. A repüléshez Totex 1200 grammos (TA1200) ballont használtunk és a maximális repülési magasságot 34km-ben határoztuk meg. A ballon töltése ismét közel fél órát vett igénybe, a MATeF-2 repüléssel megegyező gázmennyiséget használtunk fel.

![](/images/posts/matef2-3_cikk/matef3-launch.JPG)

<div class="video16-9">
	<iframe src="https://www.youtube.com/embed/TjesxaWhb9E" frameborder="0" allowfullscreen></iframe>
</div>


A kersőcsapat a felbocsátás után azonnal elindult és a repülés során közel valós időben követte a ballon útját. A földi állomásunk sajnos 3000 méteres magasság környékén elvesztette a ballon jeleit és a repülés során nem is sikerült újra kapcsolatot teremteni az eszközzel. A probléma okát jelenleg is vizsgáljuk, a legvalószínűbb, hogy antenna problémáink adódtak és elindult az antenna felülvizsgálata.

A repülés követése ismét az APRS modul segítségével zaljott, mely ismét a pontosan mutatta a landolás helyét. A kersőcsapat útközben többször is sikeresen kapcsolatot létesített a ballonnal és landolás után fél órán belül a helyszínen volt. A visszatérő egység ismét tökéletes állapotban volt és megfelelően üzemelt landolás után is, amit a fedélzeten gyűjtött adatok is megerősítenek.

![](/images/posts/matef2-3_cikk/matef3-reco.jpg)


A payload gondolában elhelyezett saját fejlesztésű GSM-GPS tracker a landolás helyén nem válaszolt a visszaúton viszont többször is sikerült kapcsolatot teremteni az eszközzel, ennek az oka az lehetett, hogy a landolás helyszínén az egységnek nem volt térereje. A továbbfejlesztés során megvizsgáljuk az antennát valamint beépítünk térerő mérésére alkalmas szoftvermodult is.

Sajnos a másodlagos payload, a kamera nem készített képeket a repülés során. Az előzetes vizsgálatok alapján a gondolában elhelyezett GSM modul által generált EMC zavar lekapcsolta fényképezőt. A jövőben ezért szeparálva fogjuk elhelyezni a kamerát és a tartalék GSM-GPS modult és komolyabb EMC összeméréseket végzünk repülés előtt.

A repülés után ismét megvizsgáltuk a hardvert és elkezdtük a fedélzeten gyűjtött adatok vizsgálatát.

A legmagasabb regisztrált magasságunk 31839m volt, ami a szimulációknak megfelelt.
![](/images/posts/matef2-3_cikk/matef3_alt.jpg)

Ismét összevetettük az adatokat az OMSZ aznapi ballonengedésével, mely a repülésünk után egy órával zajlott le. Mivel a hőmérőnkön nem változtattunk az összehasonlítás eredménye megegyezett a MATeF-2 repülés analízisével.

![](/images/posts/matef2-3_cikk/matef3_temp.jpg)


Ismét vizsgáltuk a vertikális sebesség alakulását. Az emelkedés az előző repüléshez hasonlóan megfelelt a szimulációknak és szintén mutatja a széláramlatok okozta szórást. Az emelkedés 10km fölött, a tropopauzába való belépés után egyenletessé vált, ami várható volt. Az ereszkedés ismét tovább tartott, mint a tisztán ejtőernyővel szimulált profil, viszont a ballon maradványának hatása sokkal kisebb mértékben befolyásolta az ereszkedést. Ennél a repülésnél rövidebb zsinórt alkalmaztunk a ballon és az ejtőernyő között. Az ereszkedési adatok kiértékelése még jelenleg is zajlik, de már látható, hogy első közelítésben a rövidebb zsinór javít az ereszkedési tulajdonságokon és nem befolyásolja az emelkedést.

![](/images/posts/matef2-3_cikk/matef3_spd.jpg)


A MATeF-3 repüléshez készített szimuláció, mely kb.30%-kal nagyobb ejtőernyőt feltételezett, nagy pontossággal határozta meg a lehetséges landolási helyszínt.

![](/images/posts/matef2-3_cikk/matef3-sim.jpg)


# Összefoglaló

Az UPRA csapat az idei szezont két kiváló repüléssel kezdte, mely során validáltuk az elmúlt két év során fejlesztett ballon platformunkat és bebizonyítottuk, hogy három héten belül le tudunk bonyolítani két felbocsátást. A fedélzeti rendszer és a kísérleti APRS modul kiválóan szerepelt a repüléseken, utóbbi hamarosan integrálásra kerül a kommunikációs alrendszerbe.

Ismét fontos adatokat gyűjtöttünk a saját földi állomás kiépítéséhez és megkezdtük az esetleges hibás földi alrendszerek vizsgálatát és cseréjét.

A repülési adatok kiértékelése még jelenleg is zajlik, de az előzetes adatok alapján már látjuk, hogy a jövőbeni repülések tervezésénél és a repülés alatti előrejelzések elkészítésénél mire kell majd figyelnünk. Elkezdődött a saját repülés szimulátorunk fejlesztése, mely alkalmas lesz élő előrejelzések készítésére repülés közben az aktuális repülési és meteorológiai adatok alapján.

Összességében elmondhatjuk, hogy a jelenlegi rendszer alkalmas kisebb, egyszerűbb kísérletek sztratoszférába juttatására, így hamarosan megkezdhetjük  a valódi tudományos munkát és az együttműködést kutatócsapatokkal.

# Ezúton is szeretnénk megköszönni mindenkinek, aki részt vett és segített a fejlesztésben és a felbocsátások lebonyolításában!
