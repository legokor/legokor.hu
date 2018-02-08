---
title: UPRA féléves beszámoló - 2017 ősz
layout: post
author: goczan-bence
image: http://lego.sch.bme.hu/wp-content/uploads/2015/02/upra_logo.png
---

Az UPRA csapat az őszi félév során elsősorban a MATeF-2 ballon fedélzeti elektronikájának tesztelésével foglalkozott. Fő feladatunk a nyáron felderített hibák kijavítása és a fedélzeti rendszer hűtőkamrás tesztelésre való felkészítése volt. A tesztelés mellett mikroprojektek és további alrendszerek fejlesztése sem állt meg.

# Mérnöki deszkamodell

A nyár folyamán elvégzett modul tesztek után összeállítottuk a mérnöki deszkamodellt, melynek részegységei megegyeznek a repülő modell felépítésével. A modulokat „kiterítve” szalagkábellel kötöttük össze és kiegészítettük mérőpontokkal és busz-analizátorral.

![](https://scontent-vie1-1.xx.fbcdn.net/v/t1.0-9/20106253_1443418542393404_3218318629798230627_n.jpg?oh=8d45bb5f6f20bd777164376fdc305c6a&oe=5AB30218)

Minden további tesztet és javítást ezen a mérnöki deszkamodellen végzünk, melyeket a tesztelés végeztével átvezetünk a végleges, repülő verzió terveibe.

# Integrált rendszerteszt

A félév során integrált rendszerteszteket hajtottunk végre, melyek során a komplett fedélzeti rendszer működését vizsgáltuk. A tesztek során azt vizsgáltuk, hogy a korábban önállóan tesztelt modulok képesek-e rendszer szinten együttműködni. Ehhez részfeladatokra bontott és komplett repülést szimuláló teszteket készítettünk.

A működés mellett a rendszer különböző paramétereit is vizsgáltuk: modulok áramfelvétele, rendszer szintű áramfelvétel, feszültség esések a tápvonalakon. Ezen mérések segítségével sikerült fényt derítenünk több korábban feltárt hiba okára és javítási tervet készítenünk.

Az integrált rendszerteszteket szobahőmérsékleten végeztük.

## Tesztelés során feltárt hibák

  * COM modul adásvételi problémák - szoftverfrissítéssel javítva
  * OBC újraindulás rádiós adás alatt - szoftverfrissítéssel javítva
  * OBC SD kártya kezelés hibák - szoftverfrissítéssel javítva
  * APRS - COM rádiós csatolás - antenna hangolás és adóteljesítmény beállítása folyamatban

# Hűtőkamrás tesztelés

A repülés során a ballon akár -60°C-os hőmérsékletnek is ki lehet téve, ami az elektronikus alkatrészek működését negatívan befolyásolja. Korábbi tapasztalatok alapján a szigetelőkapszula beljesében -16°C körüli hőmérséklet állhat elő, ezért a fedélzeti elektronikát szigetelés nélkül ebben a tartományban teszteltük. A teszteléshez egy átalakított, fagyasztó funkcióval rendelkező hűtőszekrényt használtunk, melyet elláttunk extra szigeteléssel és bevezettük a teszteléshez szükséges kábelezést.

A mérés során a mérnöki deszkamodellt használtuk, mely a teszt alatt saját áramforrásról üzemelt. A vizsgálathoz GPS jel szimulátort használunk, mely valós GPS jeleket sugároz a hűtőkamrába. A teszt alatt figyeltük a kamra hőmérsékletét, az alrendszerek közti busz kommunikációt és a sugárzott rádiós üzeneteket.

![](https://community.balloonchallenge.org/uploads/default/original/2X/1/1794160dd9ca7b8e41ca2f90636d64c69c97ad9b.jpg)

## UPRA-BUS analizátor

A hűtőkamrás teszteléshez elkészítettük az UPRA-BUS analizátor első verzióját, mely az UART alapú másodlagos kommunikációs vonal (SICL) és az elsődleges GPS modul üzeneteit figyeli.

A busz analizátor egy RS232 konverter áramkörből és egy dekódoló mikrokontrollerből áll, mely szétválasztja az egyes alrendszerek üzeneteit és PC felé továbbítja. Az RS232 konverzió lehetőséget biztosít, hogy az UART üzeneteket nagy távolságra is biztonságosan továbbíthassuk.

## Tesztelés során feltárt hibák

A hűtőkamrás tesztelés során egyetlen, az elsődleges GPS modullal kapcsolatos hibát tártunk fel: -6°C alatt a modul rendszeresen újraindult. A hibát a GPS modul tápellátására vezettük vissza, mely nem jelentkezett szobahőmérsékleten történő tesztelés során. A lehetséges javítást már implementáltuk a mérnöki deszkamodellen, melynek tesztelése jelenleg is zajlik.

# Elem-karakterisztika mérés

Az energiaellátó alrendszer (EPS) továbbfejlesztésének első lépéseként elkezdtük vizsgálni a repülés során használható lehetséges áramforrásokat. Ehhez összeállítottunk egy akkumulátor kisütő áramkört, mely konstans terheléssel méri az elemek kisülési karakterisztikáját.

A mérést a jelenleg is használt szárazelemekkel kezdtük, de a jövőben különböző akku-pakkok vizsgálatát is tervezzük különböző hőmérsékleti tartományokon.

![](https://github.com/legokor/UPRA-EPS/blob/master/Battery_Tester/battery_discharge/4xAA_varta.png?raw=true)

# Földi vezérlőszoftver

A félév során folytatódott a földi vezérlőközpont szoftverének fejlesztése, melyet a QuadCopter csapattal közösen végeztünk, mivel a két projektnek hasonlóak az igényei.

A félév során folyamatosan fejlődött a webes kezelőfelület az élő térképes követéshez és a repülési adatok megjelenítéséhez, valamint elkészült egy okos-telefonon használható próbaverzió is.

![Földi vezérlőszoftver webes kezelőfelülete (QuadCopter kezelőfunkciókkal)](http://lego.sch.bme.hu/wp-content/uploads/2018/01/dash-overview.png)

# További célkitűzések

A rövid távú terveink a MATeF-2 rendszer tesztelésére koncentrálódnak. Szeretnénk további hűtőkamrás teszteket végrehajtani és az eredmények kiértékelése után véglegesíteni a repülő modell terveit.

Tavasszal, ahogy az időjárás engedi szeretnénk elkezdeni egy több repülésből álló felbocsátás-sorozatot.

Szeretnénk szorosabbra fűzni a kapcsolatunkat a [BME Kozmosz Körrel](http://kozmosz.space/) lehetséges hallgatói ballonos küldetések, workshopok és előadások megszervezével.)

Az áprilisban megrendezésre kerülő [2ND SYMPOSIUM ON SPACE EDUCATIONAL ACTIVITIES](http://ssasymposium.org/) konferencián az UPRA tesztcsapata egy poszter prezentációval fog bemutatkozni, melyen a MATeF-2 tesztelése során szerzett tapasztalatokat szeretnénk megosztani a nemzetközi közönséggel.

A részletes féléves beszámolónkat [letölthetitek PDF formátumban.](https://github.com/legokor/UPRA-doksik/blob/master/beszamolok/upra_besz_2017osz.pdf)

Az UPRA Projektről részletesen a [projekt honlapján](http://upra.sch.bme.hu/) és a [facebook oldalán](https://www.facebook.com/UPRA.team/) tájékozódhattok.

A tesztelésről részletesen pedig a cikksorozatunkból olvashattok.
