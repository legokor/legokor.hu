---
layout: default
title: prog2
---

# LEGO Tanfolyam: Programozás 2

## Függvények

A Brixcc-ben is léteznek a C-s függvényekhez hasonló dolgok. Ezek nagyjából azonos
funkciót is látnak el, mint natív C-ben. Az egyetlen különbség, hogy míg C-ben minden egyes
függvény egy adott memóriacímen helyezkedik el, és azon keresztül érhető el, addig NXCben
a függvények mind inline-ok. Ez a gyakorlatban azt jelenti, hogy a függvények teljes
kódját a hívás helyére bemásolja a fordító. A fentiek egyik előnye, hogy ilyen inline
függvényből bármennyink lehet, de cserébe a kód méretét nagyban megnövelik.

Függvényeket két esetben lehet használni. Az egyik, ha egy nagyon rövid, de sokat ismétlődő
kódrészletet szeretnénk kiszervezni. A másik, amikor nekünk mindenképpen szükségünk van
visszatérési értékre. Ez előfordulhat, mivel NXC-ben nincsenek pointerek! Nagyon ritkán
használjuk őket (de nem tilos).

Szintaktika: `inline <visszatérési típus> <függvény név> (<paraméterek>)`

Példa:

```c
inline void Turn(int power, int time) {
  OnFwd(OUT_AC, power);
  Wait(time);
}

task main() {
  // ...
  Turn (75, 500);
  // ...
}
```

## Szubrutinok

A szubrutinok az NXC speciális entitásai. A működésük nagyjából megegyezik egy
natív C-ben megismert függvényével, mivel ezeket nem másolja be a hívás helyére a fordító,
hanem ők külön memória területen léteznek. Hátrányuk azonban, hogy mindössze 255 darab
lehet belőlük, illetve hogy nincs visszatérési értékük.

Ritkán használatosak, általában a hosszabb kód duplikációt kivédendő. Használatuk
azonos egy sima natív C-s void függvényével.

Szintaktika: `sub <szubrutin név> (<paraméterek>)`

Példa:

```c
sub Evade(int pwr) {
  Off (OUT_AC);
  OnRev(OUT_A, pwr); Wait(500);
  OnFwd(OUT_AC, pwr); Wait(500);
  Off (OUT_AC);
  OnRev(OUT_C, pwr); Wait(500);
  Off (OUT_AC);
}

task main() {
  // ...
  Evade(75);
  // ...
}
```

## Taskok

Az NXC-ben a feladatokat alapvetően taskokba szervezzük. Egy program maximum
255 darab különböző nevű taskot tartalmazhat. Ezek között muszáj lennie egy main nevű
tasknak (nagyjából mint natív C-ben), mert a program indulásakor ez a task indul el először,
és ő indítja el a többit. A taskokban az az új az eddig C-ben megszokott függvényekhez
képest, hogy a taskok képesek egymás mellett (valamilyen időosztásban) futni. Bármely task
indíthat másik taskot, ám az elindított task csak akkor indul el, amikor az aktuális task
lefutott.

A taskok elindításának és leállításának több módja is van. Az első, alapvető a
**start/stop** utasítás, amelyek törzsébe egy adott task neve írható. Ezek nem túl praktikusak,
mivel csak egy adott task indítását és leállítását teszik lehetővé. A task indításra sokkal
gyakrabban használt függvény a `Precedes(...)`, aminek a paraméter listáján bárhány,
egymással párhuzamosan futó task nevét fel lehet sorolni. Az összes futó task leállítására
használt függvény a `StopAllTasks()`.

Egy task önmagát kétféle módon állíthatja meg. Az egyik, hogy a függvénytörzsének
végére ér, a másik pedig az `ExitTo(...)` függvényt hívja meg. Az `ExitTo()`-nak kötelezően kell
egy task paramétere legyen, amit a hívó task leállásakor elindít. FIGYELEM! Taskoknak soha
sincsenek paramétereik!

Szintaktika: `task <név> ()`

## Konkurens folyamatok vezérlése

A párhuzamosan futó taskokkal együtt megjelenik egy új probléma a számunkra. Mi
van akkor, ha két task ugyan azt az erőforrást szeretné használni? Értelemszerűen ezt a
helyzetet nekünk valamilyen úton-módon kezelnünk kell. Erre a problémára nézzünk is egy
példát.

Tegyük fel, hogy van egy taskunk, amely folyamatosan egy négyzet mentén mozgatja
a mi róverünket, de szeretnénk, ha a róverünk képes lenne a touch szenzor jelére az előtte lévő
akadályt kikerülni. Ezen utóbbi probléma megoldására érdemes külön taskot létrehozni,
egyrészt mivel a két folyamat logikailag különböző, másrészt mivel nehéz lenne ezeket egy
taskon belül implementálni. Beláthatjuk, hogy ebben az esetben előfordulhat, hogy a két
konkurens task a motoroknak, vagyis a közös erőforrásnak ellentétes utasítást ad, ami végül
biztosan nem a helyes, elvárt működésre vezet.

Vegyük először is a két taskot:

```c
task move_square() {
  while (true) {
    OnFwd(OUT_AC, 75); Wait(1000);
    OnRev(OUT_C, 75); Wait(500);
  }
}

task check_sensors() {
  while (true) {
    if (SENSOR_1 == 1) {
      OnRev(OUT_AC, 75); Wait(500);
      OnFwd(OUT_A, 75); Wait(500);
    }
  }
}

task main() {
  Precedes(move_square, check_sensors);
  SetSensorTouch(IN_1);
}
```

Láthatjuk, hogy előfordulhat olyan eset, amikor a check_sensors a neki előírt mozgást
végzi, és éppen a wait függvénye fut. Eközben a move_square éppen felébred saját wait
függvényéből, és belekontárkodik a kikerülésbe azáltal, hogy a motoroknak más parancsot ad
ki, és fordítva.

Felmerül bennünk tehát az igény, hogy a taskok egymás között valahogyan jelezni
tudják, hogy ők éppen beléptek a működésük egy olyan szakaszába, ahol ők olyan erőforrást
(jelen esetben a motort) használnak, amit szeretnénk kizárólagosan használni. Ezt a szakaszt
hívjuk kritikus szakasznak. A jelzésre több lehetőségünk is van, én mindössze egyfélének a
két megvalósítási lehetőségét szeretném bemutatni.

Az ilyen problémák megoldására a legelterjedtebb megoldás egy szemafor használata.
A szemafor működési elve a következő: Képzeljünk el egy vasúti átjárót, mint erőforrást. Ezt
praktikusan (mondjuk nem Békéscsaba – Gyula vonalon) egyszerre kétféle jármű (task)
szeretné használni: a vonat és az autó. Érezzük, hogy ha ezek egyszerre használják a vasúti
átjárót, akkor annak súlyos negatív következményei vannak, tehát szeretnénk ezt elkerülni. A
vasúti kereszteződésbe telepítsünk egy lámpát. Ez mutasson pirosat az autósnak, ha éppen
vonat, és mutasson pirosat a vonatnak, ha éppen autó halad át az átjárón. Tegyük fel, hogy
egy ideális világban a vonatnak nincs prioritása az autó felett. Ebben az esetben, ha az
átjáróhoz először vonat érkezik, akkor a később érkező autósnak meg kell várnia azt, hogy a
vonat elhaladjon, majd ő zöldet kapjon, és vica versa.

Esetünkben először legyen a szemafor egy sima bool érték (semaphor). Abban az
esetben, ha az egyik task használja a motort, állítsa false-ra, majd mikor végzett, szabadítsa
fel a szemafort, azt true értékűre átállítva. FIGYELEM! Soha ne felejtsük el a szemafort
felszabadítani! Ennek megfelelően minden tasknak a kritikus szakaszba lépés előtt esetenként
várnia kell arra, hogy a szemafor felszabaduljon. Ezt vagy egy `while(!semaphor);`-ral, vagy az
NXC beépített `until(semaphor);` függvényével tehetjük meg. Az így kiegészített kód alább
látható:

```c
bool semaphor = false;

task move_square() {
  while (true) {
    until(semaphor);
    semaphor = true;
    OnFwd(OUT_AC, 75); Wait(1000);
    OnRev(OUT_C, 75); Wait(500);
    semaphor = false;
  }
}

task check_sensors() {
  while (true) {
    if (SENSOR_1 == 1) {
      until(semaphor);
      semaphor = true;
      OnRev(OUT_AC, 75); Wait(500);
      OnFwd(OUT_A, 75); Wait(500);
      semaphor = false;
    }
  }
}
```

A fenti kódrészlet szinte teljesen tökéletesnek tűnhet elsőre, ám kicsit gondoljuk
tovább a dolgokat. Mivel a taskok egymással párhuzamosan, időosztásosan futnak, ezért
vannak olyan időpillanatok, amikor az adott taskunk nem fut, helyette valaki más birtokolja a
CPU időt. Mi van akkor, ha éppen a semaphor = false; parancs közben történik task váltás, és
valamelyik következő tasknak sikerül előttünk lefoglalnia a kérdéses erőforrást? Ez bizony
sajnos ugyanahhoz a problémához vezet, amit fentebb vázoltam. Ennek kivédésére a szemafor
lefoglalását egy olyan műveletté kell tenni, ami alatt nem következhet be task váltás. Az ilyen
műveleteket elemi műveleteknek nevezzük. Természetesen az NXC létezik erre létrehozott
változó típussal és függvényekkel. Az ehhez használt speciális típust a mutex (MUTual
EXclusion = kölcsönös kizárás) kulcsszóval lehet elérni. Az ilyen típusú változókat pedig
„megszerezni” (Acquire()) és „elengedni” (Release()) lehet. Nézzük, hogy néz ki az így
átalakított kód:

```c
mutex semaphor;

task move_square() {
  while (true) {
    Acquire(semaphor);
    OnFwd(OUT_AC, 75); Wait(1000);
    OnRev(OUT_C, 75); Wait(500);
    Release(semaphor);
  }
}

task check_sensors() {
  while (true) {
    if (SENSOR_1 == 1) {
      Acquire(semaphor);
      OnRev(OUT_AC, 75); Wait(500);
      OnFwd(OUT_A, 75); Wait(500);
      Release(semaphor);
    }
  }
}
```

Láthattunk tehát egy egyszerű példát a konkurens folyamatok egyik hibalehetőségének
a kivédésére. Az első és a második megoldást a gyakorlatban egyaránt lehet használni, mivel
igen kicsi az esélye annak, hogy a szemafor lefoglalása közben következzen be task váltás.

## Hasznos függvények

A következőkben pár új vagy nagyon hasznos függvényt szeretnék röviden és tömören
bemutatni:

- Szinkronizált motor mozgatás

  Ahogy a cím is mutatja, ez a függvény képes két motort egymáshoz képest szinkronban vagy valamilyen eltolással forgatni.

  Szintaktika: `OnFwdSync(PORT, sebesség, szinkronizáció)`.

  A szinkronizációs változó -100 – 100 között változhat, ahol a 0 értéknél forog ugyanazzal a sebességgel ugyanarra, míg a két végértéknél egyenlő sebességgel, de ellentétes irányba forog a motor.

  Természetesen létezik az `OnRevSync(...)` is, illetve a motorokat ugyanúgy az `Off(...)` paranccsal lehet lekapcsolni.
- ENCODER

  Minden egyes motor rendelkezik encoder-rel. Ez egy olyan fém tárcsa, amelyen különböző fekete osztások vannak. Ezt az egyik irányból megvilágítva, majd a visszaverődést vagy épp annak hiányát érzékelve meghatározható, hogy a motor nagyjából hány fokot fordult el.

  Függvények:

  + `ResetTachoCount (PORT)` – az adott porton lévő encoder-t állítja 0-ra.
  + `MotorTachoCount (PORT)` – Az adott porton lévő encoder állapotát kéri le.
  + `RotateMotor (PORT, sebesség, fok)` – Az adott porton lévő motort forgatja foknyi encoder jelig a megadott sebességgel. Nem túlságosan pontos a róver tehetetlensége miatt!
- Task

  + deklaráció: `task név (){...}`
  + egy indítása: `start név;`
  + egy megállítása: `stop név;`
  + párhuzamos indítás: `Precedes (task1, task2, task3, ...);`
  + minden futó task megállítása: `StopAllTasks ();`
  + kilépés aktuális taskból másikba: `ExitTo (új_task);`
- Szubrutin

  + deklarálás: `sub név (paraméterek){...}`
  + hívás: `név (paraméterek);`
- Szemafor

  + bool-ra várakozás: `until (szemafor);` a szemafor false értékéig vár.
  + mutex:
    - deklarálás: `mutex változó_név;`
    - lefoglalás: `Acquire (szemafor);`
    - elengedés: `Release (szemafor);`
