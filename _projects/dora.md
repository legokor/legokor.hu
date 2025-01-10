---
layout: project
title: DORA
status: active
logo: dora.svg
preview: dora.jpg
introduction: A LEGO Kör robotautó fejlesztésével foglalkozó projektje.
leader: kiovics-daniel
members:
    - mandzsu-bendeguz
    - serban-andrada
    - bacskai-kristof
    - magyar-marton-tamas
---

A Dinamikus Orientációs Robot Autó (röviden DORA) projekt egy autonóm robot elkészítését foglalja magába. DORA feltérékpezi a környezetét, és ott megadott pontokra navigál. A robotot három darab, háromszög formában elhelyezett, omnidirekciós kerékkel felszerelt motor hajtja.

A környezet feltérképezését és a pálya tervezését egy Jetson Nano fogja kezelni. A motorok vezérléséért, enkóderek, illetve az IMU kiolvasásáért egy STM32 Nucleo lesz a felelős, egy saját tervezésű NYÁK-kal ellátva. További szenzorok között szerepel egy LIDAR illetve egy sztereo kamera.

Mindezen szenzorok összehangolásáért a Jetson-on futó Robot Operating System (ROS) lesz felelős. Az adatok távoli megjelenítéséről egy saját fejlesztésű szoftver gonsodkodik.
