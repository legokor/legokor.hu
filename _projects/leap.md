---
layout: project
title: Leap Motion
logo: leapmotion.svg
preview: leap\_motion.png
status: active
introduction: A projekt célja minél több területen bevetni a kézfelismeréses vezérlést.
leader: kercza-robert
members:
    - dorogi-dome
    - czegledi-krisztian
    - harsanyi-levente
---

A projekt elsősorban a névadó eszköz (Leap Motion Controller) megismerését, és határainak feltérképezését tűzte ki célul. Azonban a projekt fejlődésével, már nem csak ezzel az egy eszközzel foglalkozik, hanem a tagok - és persze az újoncok is - már az AR/VR birodalmába is betekintést nyerhetnek.

A Leap Motion Controller önmagában mindössze 3 db infra-LED-ből, és az ezek által bevilágított emberi kezeket vagy pálca jellegű “tool”-okat észlelő két infrakamerából épül fel, semmilyen feldolgozást nem végez, kizárólag rögzít.

A kamerák maximum 240 FPS-el látnak, a videófolyamot teljesen a driver dolgozza fel, így az új funkciókhoz hardvercsere nem szükséges. Ez a vezérlési forma sok területen bevethető: egy számítógép egerének vagy billentyűzetének szimulálására, gesztusok felismerésére, robotok irányítására vagy játékok vezérlésére is alkalmas - mi ezek közül minddel foglalkozunk.

A VR világába az utat egy Meta Quest 3 nyitja meg a projekt előtt. Ez egy modern headset, amit kontrollerekkel lehet irányítani, és képes - a Leap Motion-höz hasonló - kézfelismerésre is, amitől még valósabbnak és kézzelfoghatóbbnak érződik a virtuális valóság. Az eszköz rendelkezik beépített processzorral is, ami lehetővé teszi, hogy magában, külső segítség nélkül is lehessen használni, de akár számítógéphez csatlakoztatva is, ezzel növelve a számítási teljesítményt.

Egy másik nagy képessége még a headset-nek, hogy képes úgynevezett „Passthrought”-ra, ami segítségével beépített kamerákon keresztül látszik a válóság, így erre képes rávetíteni a virtuális tartalmat. Ezek lehetnek képernyők, billentyűzet, vagy akár egy egész játék is, ami beágyazódik a valóságba, például a falon keresztül szörnyek törnek be a szobába, amiket le kell lőni.

A Leap Motion és a Quest által érzékelt adatokat elsősorban Unity-ben hasznosítjuk, így a projekt fontos része a játék-motor lehetőségeinek megismerése is, ezért a kontrollerek használata mellett játékfejlesztéssel is foglalkozunk.

Az újoncok először egy kisebb, saját játék vagy alkalmazás elkészítésével ismerhetik meg a Unity és a Leap Motion használatát. Ezen kívül minden félév elején kitalálunk közösen egy nagyobb feladatot, amelyen a projekt a félév során dolgozni fog, így elősegítve a közös fejlődést.
