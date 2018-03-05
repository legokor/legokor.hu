---
title: A Git verziókezelő rendszer
layout: default
projects:
---
# A Git verziókezelő rendszer

## Problémafelvetés

Biztos találkoztál már olyannal, vagy te is kerültél olyan helyzetbe, hogy egy fájlról vagy projektról szerettél volna egyszerre több verziót is tárolni. Ilyenkor kerülnek elő az olyan megoldások, mint a különböző állapotok dátumokkal jelölt mappákba másolása, vagy a `beszamolo_vegleges_final_eztkulddbe.docx` fájlnevek megadása.

Ezt a problémát még többszörösen bonyolítja az, ha az adott munkát csoportban végezzük, ekkor nem csak saját magunknál kell megoldani a verziók követését, hanem ezt még másokkal is szinkronizálnunk kell, ennek az általános megoldása az e-mailben zipek küldése, vagy Dropboxon megosztás.

A Git ezt a (két) problémát hivatott megoldani, illetve még sok mást, amiről eddig nem is tudtad, hogy zavar.

## Git - első lépések

A Gitben az egyes követett projekteket `repositorynak` hívjuk. Első megközelítésben minden fájl, ami ebben a mappában van, követve lesz. Egy ilyen repositoryt a következő parancssal hozhatunk létre:

```bash
$ git init .
Initialized empty Git repository in /home/user/sandbox/.git/
```

Ez a jelenlegi mappát fogja repositoryként kezelni (amelyben éppen állunk). Ezek után már ki is próbálhatunk pár egyszerű git parancsot, ami a repositorynk (röviden repó) állapotáról tud információt szolgáltatni.

```bash
$ git status
On branch master

Initial commit

nothing to commit (create/copy files and use "git add" to track)
```

A kimenet itt rögtön több olyan fogalmat is használ, amikről egyelőre semmit nem tudunk, de látszólag fontosak lesznek (`branch`? `commit`?). Próbáljunk ki egy másik parancsot is.

```bash
$ git log
fatal: your current branch 'master' does not have any commits yet
```

Tehát tudjuk azt, hogy jelenleg a `master` nevű branchen állunk, és nincsen commitunk. Na jó, inkább essünk neki a projektünknek. Hozzunk létre egy új fájlt a mappában, tartalomként írjunk bele például egy "Helló, világ!"-ot.

```bash
$ echo Hello, vilag! > file.txt
$ ls
file.txt
```

Próbáljunk most újra egy `git status`-t futtatni! A kimenetben közli velünk a git, hogy van egy `untracked` fájlunk, illetve, hogy a `git add` paranccsal tudjuk azt hozzáadni a commitunkhoz. Na jó, de mi is az a commit?

## Commitok

A commit a gitben a változtatások egysége. Egyfajta csomagnak tekinthetjük, egy commit tartalmazza (jó esetben) az egybetartozó változtatásokat a projekt fájljaiban.

Ha például volt egy függvényed egy modulban, amit a főprogram használ, és ennek a függvénynek megváltoztatod a visszatérési típusát `int`-ről `double`-re, akkor ez a pár sor változtatás egy egészt alkot, egy commitba illik. (Ha e-mailben tartanád a kapcsolatot a társaiddal, akkor miután elvégezted ezt a változtatást, ezt a két fájlt, vagy a projekt zipjét elküldenéd nekik, hogy ők már ezen dolgozzanak tovább).

A commitokhoz az adott változtatásokon kívül tartozik a szerkesztő e-mail címe, neve, a commit időpontja és egy hash érték, amivel a commit egyértelműen azonosítható. Meg kell adni továbbá egy rövid címet, ami leírja, miket változtattunk a commitban.

Nézzük akkor először a változtatásokat. Az imént létrehoztunk egy új fájlt, de a `git status` szerint ezt még nem adtuk hozzá a commitunkhoz. Tehát a változtatásaink *nem adódnak hozzá automatikusan az aktuális commithoz*.

```bash
$ git add file.txt
```

Történt valami? Nézzük meg a `git status` segítségével. Úgy tűnik, hogy sikerült hozzáadni, most már `Changes to be committed` felirat alatt jelenik meg! Na, akkor már csak a commitot kell létrehozni. Először is, ha még nem tettük volna meg, meg kell mondanunk a gitnek, hogy kik vagyunk (milyen aláírással lássa el a commitunkat).

```bash
$ git config --global user.email "email@example.com"
$ git config --global user.name "Gipsz Jakab"
```

A jövőre tekintve, itt olyan e-mail címet érdemes megadni, ami a GitHub felhasználónkhoz is be van regisztrálva, ugyanis az oldal ez alapján linkeli a commitokat felhasználókhoz. Ha ezzel megvagyunk, már tényleg csak a commit létrehozása van hátra.

```bash
$ git commit -m "My first commit"
```

Itt a `-m` kapcsolóval adtuk meg a commit címét. Ha csak egyszerűen `git commit`-ot írunk, akkor megnyílik az alapértelmezett szövegszerkesztő (vigyázat, vi[m]!), és ebben adhatjuk ezt meg.

Ha ezzel megvagyunk, nézzünk megint egy statust. Itt újra azzal találkozunk, hogy nincs mit commitolni. Ilyenkor az ember szeretné megnézni, hogy sikerült-e létrehoznunk a commitot.

```bash
$ git log
```

Ezzel a paranccsal listázhatjuk a commitokat, és ha minden jól meg, itt meg is jelenik a mienk.
