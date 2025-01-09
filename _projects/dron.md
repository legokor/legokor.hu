---
layout: project
title: Drón
logo: qc.svg
preview: quadrocopter.jpg
status: active
introduction: A tagok villamosmérnöki és informatikai tudásának elmélyítése egy négyrotoros drón fejlesztésén keresztül.
leader: fiak-adam
members:
    - kiovics-daniel
    - bacskai-kristof
    - molnar-attila-bendeguz
---

A projekt célja elsősorban a Lego-kör profiljába illeszkedve a tagok villamosmérnöki és informatikai tudásának elmélyítése egy quadcopter fejlesztésén keresztül. Ez magában foglal alacsony és magas szintű szabályzási feladatokat, beágyazott rendszerek tervezését és programozását, vezetéknélküli kommunikáció implementálását, valamint PC oldali programozást. Célunk ezen tudás felhasználásával egy saját fejlesztésű copter elkészítése, ami képes önállóan feladatokat megoldani legyen szó waypoint navigációról, vagy egy felhasználó követéséről aktív ütközéselkerüléssel.

A projekt keretein belül kezdetben egy kereskedelmi forgalomban kapható quadcopter-en keresztül ismerkedtünk a témával. Kiismerve a vezérlőrendszer felépítését képesek voltunk a repülési adatokat (GPS pozíció, akkumulátorfeszültség, áramfelvétel) visszaküldeni a földiállomásra. Ezen kívül a LeapMotion projekttel együttműködve a gyári távirányítóját tovább fejlesztve a LeapMotin érzékelőinek segítségével kezünk mozgásával irányítottuk a copter-ünket. Ekkor éreztük elérkezettnek egy saját rendszer fejlesztését. Célunk volt minél elemibb egységek felhasználásával egy működő drón elkészítése. Ezt úgy specifikáltuk, hogy képes legyen nagyobb terhek mozgatására is, így később komolyabb DSLR kamera vagy kézbesítendő csomag is szállítható az eszközzel. A rendszer vezérlőelektronikájának központja egy STM32 mikrokontroller, mely a szükséges perifériák felhasználásával végzi a szabályzást. A mikrokontroller FreeRTOS operációsrendszert futtatva párhuzamosítja a feladatait. A vezérlő wifi-n vagy rádiófrekvenciás adó-vevővel tart kapcsolatot a földi irányítóeszközzel.

Ezen kívül a projekt keretein belül foglalkozunk BLDC motorok vezérlésével, PC-s nyomkövető és irányítószoftver fejlesztésével, illetve LiPo akkumulátortöltő elektronika készítésével. Hosszútávú terveink között van saját quadcopterünk önálló feladatvégzésre való felkészítése további szenzorok felhasználásával, Androidos irányítószoftver fejlesztése, valamint a gyári quadcopterünk továbbfejlesztése.

Szívesen várunk minden érdeklődőt projektünkbe, gyűléseink nyíltak bárki számára, akár nem körtagoknak is.

### Feladatok, melyekre akár Te is jelentkezhetsz:

-   Kéttengelyes gimbal fejlesztése (HW + beágyazott SW)
-   Nagytávolságú kommunikációs modul fejlesztése (HW + beágyazott SW)
-   Motorvezérlő (ESC) továbbfejlesztése (HW + beágyazott SW)
-   Ütközéselkerülő/távolságérzékelő szenzor fejlesztése (HW)
-   Telefonos alkalmazás fejlesztés drón irányítására (Android/IOS SW)
-   Vezeték nélküli akkumulátor töltő egység fejlesztése (HW)
-   Repülésirányító/felügyelő szoftver fejlesztése (PC SW)
-   Szabályzási algoritmus továbbfejlesztése (beágyazott SW)
-   Repülésvezérlő szoftver fejlesztése (Linux SW)
-   Egyéb a témakörbe illő, számodra érdekes feladat.
