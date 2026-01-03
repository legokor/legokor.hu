---
title: UPRA MATeF-4 Felbocsátás
layout: post
author: goczan-bence
image: /images/posts/matef-4_cikk/matef4_small.jpg
excerpt: Az UPRA csapat az őszi félév során végrehajtotta a MATeF sorozat utolsó repülését, melynek egyik célja a távérzékelési repülések előkészítése volt.
---

Az UPRA csapat az őszi félév során végrehajtotta a MATeF sorozat utolsó repülését, melynek egyik célja a távérzékelési repülések előkészítése volt.

Novemberben a régóta húzódó MATeF Program negyedik és egyben utolsó repülésére is sor került. A küldetéssorozat célja az új UPRA-ReHAB fedélzeti rendszer kifejlesztése és tesztelése volt. A MATeF Program során a csapatunk megépített és validált
* egy új, alacsony fogyasztású fedélzeti számítógépet (OBC)
* egy melegtartalékolt rádiós rendszert
* egy tartalék GPS követőt
* és egy olcsó, gyorsan összeállítható kísérleti kapszulát

A MATeF Programban négy repülést terveztünk, melyek során minden egyes repülésen újabb részegységek kerültek beépítésre.
![](/images/posts/matef-4_cikk/matef_flights.jpg)

# MATeF-4 Repülés

2018.11.03-án indítottuk a MATeF-4 ballonunkat, mely a rendszer első éles repülése volt. Az emeléshez Totex 200 grammos (TA200) időjárási ballont használtunk. A repülés tervezése során figyelembe vettük az aktuális széljárást és a szimulációk alapján maximum 15km-es célmagasságot jelöltünk ki. A telemetria rendszer mellett helyet kapott a saját fejlesztésű tartalék GPS követőnk és egy repülésre átalakított kamera is. Ez volt az első alkalom, hogy három kisebb kapszula repült egyszerre.

![](/images/posts/matef-4_cikk/matef4_configuration.jpg)

A felbocsátás a szokásos helyszínen, a BME Q épülete mögötti prakos részen zajlott, a földi állomást a Q épület teraszán állítottuk fel.

![](/images/posts/matef-4_cikk/inditas.jpg)

A kereső csapat a felbocsátást követően elindult a szimulációk alapján meghatározott landolási helyszín felé. A repülés során megszakadt a kapcsolat a tartalék rádiós rendszerrel, ennek ellenére a keresőcsapat a tartalék GPS modul segítségével meghatározta a landolás helyét és egy kis gyalogtúrát követően begyűjtötte a visszatérő egységet, mely még ekkor is üzemelt.

![](/images/posts/matef-4_cikk/megtalalas.jpg)

A repülést követő elemzés kiderítette, hogy a tartalék rádiós modullal hardver hiba miatt szakadt meg a kapcsolat. A másodlagos, VHF antenna kábele elaszakadt, ezért a rádió modul által küldött jelek túl gyengék voltak, hogy az APRS hálózat földi állomásai venni tudják.
A videófelvételek elemzéséből kiderült, hogy a kapszulák folyamatosan pörögtek a felfüggesztő zsinór tengelyén, melynek hatására az antenna kábele elnyíródott. Ez a pörgés már a felbocsátás során is látható volt.

![](/images/posts/matef-4_cikk/porges.gif)

Hasonlót korábban is tapasztaltunk, viszont akkor a pörgés csillapodott a felbocsátást követően, korábbi repülések során viszont maximum kettő kapszula került rögzítésre. Az adatok elemzése alapján a pörgés három kapszula esetén is csillapodott nagyon kis mértékben, viszont egy ponton ismét felerősödött. 

![](/images/posts/matef-4_cikk/rotation_graph.jpg)

A pörgésből adódó későbbi problémák elkerülése végett a csapat új felfüggesztési konfigurációt dolgozott ki, hogy a jövőben még nagyobb biztonsággal lehessen több kapszulából álló rendszereket reptetni. A korábbi egy szálon történő felfüggesztés helyett a jövőben egy párhuzamos hevederes megoldás kerül alkalmazásra, hasonlóan a nagy méretű tudományos küldetésekhez.

![](/images/posts/matef-4_cikk/upgraded_configuration.jpg)

A repülési adatok elemzéséből kiderült, hogy a külső hőmérő új, javított konfigurációja pontosabb adatokat biztosít és a kapszula belső hőmérséklete kevésbé hamisítja meg a mérési eredményeket.

![](/images/posts/matef-4_cikk/ext_temperature.jpg)

A telemetria kapszula belsejében a hőmérséklet ismét a vártnak megfelelően alakult, az OBC működése során a stabil, biztonságos hőmérséklet tartományban üzemelt.

![](/images/posts/matef-4_cikk/OBC_temperature.jpg)


# MATeF-4 Payload

A ballonon helyet kapott egy videókamera, mely folyamatosan rögzítette a repülést. A kamera egy átalakított kínai SJCAM másolat volt, melynek vezérlőgombjai kivezetésre kerültek a kapszulán kívülre és kapott egy külső nagyobb kapacitású akku-pakkot. 

![](/images/posts/matef-4_cikk/kamera.jpg)

A kamera-payload a repülést megelőzően komoly tesztelésen esett át, mely során a csapatunk vizsgálta a külső akku-pakk és a háttértár élettartamát. A MATeF-4 repülés nem csak a MATeF Program lezárása volt, hanem előkészítő küldetés is a hamarosan induló távérzékelési programhoz. A repülés során meg tudtuk vizsgálni a kamera modul elhelyezésének és rögzítésének tulajdonságait és információkat gyűjthettünk arról, hogy "mit is lát" a ballonunk.

A korábban említett folyamatos pörgés miatt a kamerafelvételek nyers állapotukban sajnos kevéssé használhatók és a repülés napján kialakult fátyolfelhők és UV szűrő hiánya miatt a felvételek nem lettek színhelyesek. A videófelvételek megfelelő konvertálásával a gyűjtött adatok panoráma képek és rövid videó-elemzések készítésére alkalmassá váltak. A képek feldolgozása még folyamatban van, melyhez különböző ezközöket is kipróbálunk a legjobb eredmény érdekében. Az eddigi feldolgozott képek már elérhetők a facebook oldalunkon összeállított galériában.

Több felvételből sikerült összeállítani az alábbi videót, melyen a 4-es villamos kikanyarodik a Karinthy Frigyes útról:

![](/images/posts/matef-4_cikk/tram6_moving_anim.gif)

Néhány látványos panoráma felvétel Budapestről

![](/images/posts/matef-4_cikk/panorama06_10.jpg)
![](/images/posts/matef-4_cikk/panorama07_11.jpg)
![](/images/posts/matef-4_cikk/panorama10_13.jpg)
![](/images/posts/matef-4_cikk/panorama11_06.jpg)
![](/images/posts/matef-4_cikk/panorama12_06.jpg)

És sikerült megörökíteni a landolási helyszínt is, mielőtt lemerült volna a kamera

![](/images/posts/matef-4_cikk/panorama03.jpg)
![](/images/posts/matef-4_cikk/landing_zone_anim_small.gif)


# Fly With Us

A MATeF Program lezárásával a rendszerünk készen áll tudományos payload-ok szállítására. Csapatunk még dolgozik a pontos részleteken, de már várjuk azoknak a jelentkezését, akik szeretnének mérőeszközt vagy kísérletet reptetni a sztratoszférába. 

![](/images/posts/matef-4_cikk/fly_with_us.jpg)

Következő repülésünkre várhatóan áprilisban kerül sor. A pontos felbocsátási naptárunkat hamarosan publikáljuk. A projekttel kapcsolatos kérdéseket várjuk az [upra@simonyi.bme.hu](mailto:upra@simonyi.bme.hu) e-mail címre. 
