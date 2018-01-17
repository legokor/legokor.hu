---
title: STM32 elso lepesek
layout: default
projects:
- Quadrocopter
- valami más projekt
---

Copter-ünkön fedélzeti mikroprocesszorként egy STM gyártmányú ARM mikrokontrollert használunk. Ennek programozásához az OpenSTM32 Eclipse alapú fejlesztőkörnyezetre van szükségünk. A következőkben ennek a rendszernek a telepítését mutatjuk be. Az ARM alapú mikrokontrollerek egyre inkább szorítják ki a 8 bit-es kontrollereket a piacról, így a későbbiekben is hasznos tudást szerezhettek ezáltal.

Telepítő letöltési linkje (regisztráció után elérhető [itt](http://www.openstm32.org/Downloading+the+System+Workbench+for+STM32+installer?structure=Documentation)): [32-bit](http://www.ac6-tools.com/downloads/SW4STM32/install_sw4stm32_win_32bits-latest.exe) / [64-bit](http://www.ac6-tools.com/downloads/SW4STM32/install_sw4stm32_win_64bits-latest.exe)

1. Telepítő elindítása (telepítés helyének elérési útjában nem szerepelhet szóköz)
2. Telepítendő komponenseknél ha még nincs kiválasztva válasszuk ki az ST-Link-et is
3. Majd indítsuk el a telepítést, miután végzett indítsuk el a programot. Válasszuk ki a workspace mappát, ide fogja rakni a projekteket. Első indításnál automatikusan telepíti az ARM toolchain-t, ami feltétlenül szükséges a fordításhoz.

## STM32CubeMX

Ez egy Eclipse-be épülő plug-in, melynek segítségével könnyedén, egy grafikus felületen keresztül inicializálhatjuk a mikrokontroller perifériáit és állíthatjuk be a lábhozzárendelést.

Letöltési link a [lap alján](http://www.st.com/en/development-tools/stsw-stm32095.html) található.

A korábban telepített Eclipse-ben (System Workbench) Help > Install new software ablakban az Add... gombra kattintva az új ablakban az Archive gomb megnyomása után kiválasztjuk a letöltött fájlt. Ezután a listában be kell pipálni a megjelenő elemet, majd telepítjük (Next). Ha végzett a jobb felső sarokban az Open Perspective ablakban választhatjuk ki ezt az új nézetet.

![Nézetek](http://i.imgur.com/C9DwWRO.png)

Ezután megjelenik a konfiguráló program, innen indulva egy grafikus felületen állíthatjuk be a perifériákat és a lábkiosztást. New project feliratra kattintva az alábbi ablakban állítsuk be a board-unknak megfelelő (STM32F407GTx) paramétereket (a Board Selector tab-ot válasszuk):

![Board Selector](http://i.imgur.com/uty6w9u.png)

A bal oldali listából az USART2-t lenyitjuk és Aszinkron módba állítjuk, ezzel engedélyeztük ezt a perifériát. A felső tab-ok közül ezután a Configuration-t választva az oldalt lévő FREERTOS-t bepipáljuk. Ezzel a projektet felkonfiguráltuk, a Project > Generate Code menüpontban legeneráljuk az új projektet. Az új ablakban figyeljünk, hogy a megfelelő Toolchain-t válasszuk ki (SW4STM32), és a Project Location-nek a workspace mappát válasszuk:

![Project Settings](http://i.imgur.com/2CFKaud.png)

Ok gomb megnyomásával legenerálódik a projekt. A felugró ablakban fogadjuk el, hogy letölthesse a Firmware-t (ez hosszabb időt is igénybe vehet). A warning-ot ok-zzuk le, majd az open project-et válasszuk ki. Ezután már a kész projekt megjelenik, ha visszamegyünk C/C++ perspektívára. Most már kipróbálhatjuk a fejlesztőkörnyezetünket. Csatlakoztassuk a Discovery Board-unkat, majd menjünk a Run gombra(felül, zöld alapon fehér play-gomb) . A felugró ablakban válasszuk az STM32 Application lehetőséget:

![Futtatás](http://i.imgur.com/qJ6Wji2.png)

Ezzel a programunk lefordul, és rátölti a board-ra.
