---
layout: project
title: UPRA – Magaslégköri Ballon
logo: upra.svg
preview: upra_logo.png
status: archived
introduction: Könnyen konfigurálható általános magaslégköri ballonplatform fejlesztése kis méretű tudományos küldetésekhez.
leader: goczan-bence
members:
    - bodo-zsofia
    - erdelyi-janka-anna
    - kiss-tamas
    - mona-daniel
    - papp-benedek
    - toth-adam-raymond
    - toth-gabor
    - fiak-adam
    - gaspari-balazs
---

&nbsp;

<div class="video16-9" align="center">
<iframe width="640" height="360" src="https://www.youtube.com/embed/HbtcOerCxTE?rel=0" frameborder="0" allowfullscreen></iframe></div>
A projekt során egy megbízható, könnyen konfigurálható, kis karbantartást igénylő magaslégköri ballonplatformot fejlesztünk egyetemi kutatócsapatok kísérleteinek a sztratoszférába juttatásához.<!--more--> A célunk, hogy 3 kg hasznos terhet legalább 30 km-es magasságba tudjunk küldeni, majd onnan biztonságosan visszatérni a földre és begyűjteni az eszköz(öke)t.
A tervünk, hogy a ballonplatform mellett saját földi állomást és vezérlőközpontot is kiépítünk, így teljes körű ballonos szolgáltatást tudunk majd nyújtani kutató és mérnökcsapatoknak az eszközük közeli-űrbe juttatásához.
<br><br>
&nbsp;

&nbsp;

&nbsp;

<h1 style="text-align: center;">ReHAB Ballonplatform</h1>
&nbsp;

&nbsp;

&nbsp;

A platformot ReHAB vagyis 'Re-usable High Altitdue Balloon' névre hallgat és egy komplex magaslégköri kutatórendszert takar.

<table style="width: 100%;">
<tbody>
<tr>
<td style="width: 60%;" rowspan="5"><img class="aligncenter" src="/images/misc/missing.svg" alt="" width="400"  /></td>
<td valign="top">Az emeléshez hagyományos latex időjárási ballont használunk, melyek normál felhasználás során a pálya legmagasabb pontján széthasadnak. A latex ballonok használata segít a költségek alacsonyan tartásában is.</td>
</tr>
<tr>
<td valign="center">A visszatéréshez ejtőernyőt használunk, mely nemcsak az érzékeny műszereket védi a becsapódástól, hanem biztosítja, hogy a landolási zónában se tegyünk kárt semmiben. Az ejtőernyő az egész repülés során nyitott állapotban van, ezzel is növelve a sikeres, biztonságos visszatérés esélyét.</td>
</tr>
<tr>
<td valign="bottom">A ReHAB modul biztosítja a kétirányú rádiókommunikációt, élő követést valamint a hasznos teher és a repülés felügyeletét</td>
</tr>
<tr>
<td valign="center">A hasznos teher, vagyis a tudományos mérőműszerek és kísérletek külön gondolában helyezkednek el. A műszerek összeköttetésben állnak a ReHAB modullal, mely biztosítja a teljes körű felügyeletet a hasznos teher felett.</td>
</tr>
<tr>
<td valign="bottom">Arra az esetre, ha minden kapcsolat megszakadna a ballonnal, egy tartalék GPS modult is rögzítünk a rendszerhez. Ez az eszköz a fedélzeti rendszertől független és segítségével nagyobb biztonsággal tudjuk megtalálni a visszatérő ballont.</td>
</tr>
</tbody>
</table>
Jelenleg a ReHAB v.1.x rendszerrel dolgozunk, melyet folyamatosan fejlesztünk és tesztelünk, hogy minél hamarabb alkalmas legyen tudományos mérőeszközök támogatására.
<br>
&nbsp;

&nbsp;

&nbsp;

<h1 style="text-align: center;">UPRA Fedélzeti rendszer</h1>
&nbsp;

&nbsp;

&nbsp;

A platform lelke az UPRA fedélzeti rendszer, mely szintén saját fejlesztés. A célunk egy olyan moduláris fedélzeti mikroszámítógép kifejlesztése, mely az egyes alrendszerek cseréjével vagy új alrendszerek hozzáadásával a legkülönfélébb küldetések végrehajtására alkalmas.

<table style="width: 100%;">
<tbody>
<tr>
<td style="width: 70%;" rowspan="3"> <img class="aligncenter wp-image-784 size-full" src="/images/misc/missing.svg" alt="upra_system" width="100%" /></td>
<td valign="center">Pilóta nélküli légi járművekhez</td>
</tr>
<tr>
<td valign="center">Mobil kutató-roverekhez</td>
</tr>
<tr>
<td valign="center">Ballonos vagy kis-műholdas küldetésekhez</td>
</tr>
<tr>
<td style="text-align: center; font-style: italic; padding: 15px;" colspan="2">Universal Platform for Robotics and Aerospace</td>
</tr>
</tbody>
</table>
Az egyes alrendszerek egy CAN BUS alapú rendszersínre csatlakoznak. Négy alapmodul szükséges az alap működéshez, ezek az űriparban használt alrendszer kiosztás alapján kerültek meghatározásra.
<table style="width: 100%; border-spacing: -2px;">
<tbody>
<tr>
<td style="width: 50%;"><img class="aligncenter" src="http://upra.sch.bme.hu/wp-content/uploads/2015/12/OBC.png" alt="" width="100%" /></td>
<td valign="top">
<p style="margin-left: 30px; font-weight: bold;">Fedélzeti számítógép (OBC)</p>
<p style="margin-left: 30px;">A fedélzeti számítógép feladata a részegységek összehangolása és a repülési terv végrehajtásának felügyelete. Üzemszerű működés során feldolgozza és naplózza a telemetria és house-keeping adatokat, kezeli a GPS modult, a belső buszrendszeren kommunikál az egyes alrendszerekkel, felügyeli a payload-ok állapotát és kezeli a képrögzítő eszközöket. Az OBC rendelkezik egy integrált kamera egységgel, melynek felvételeit előfeldolgozza és tárolja. A rendszernapló és képek tárolására megfelelő méretű nem felejtő memóriával kell rendelkeznie.</p>
</td>
</tr>
<tr>
<td style="width: 50%;"><img class="aligncenter" src="http://upra.sch.bme.hu/wp-content/uploads/2015/12/com.png" alt="" width="100%" /></td>
<td valign="top">
<p style="margin-left: 30px; font-weight: bold;">Kommunikációs alrendszer (COM)</p>
<p style="margin-left: 30px;">A kommunikációs alrendszer feladata a repülés során a kétirányű kommunikáció biztosítása a ballon és a földi vezérlés között. A folyamatos rádiókommunikáció segítségével a ballon repülése élőben követhető és az életjelei folyamatosan monitorozhatók. A rádiós link lehetőséget biztosít mérési adatok és képek valós idejű lesugárzására is.
</p>
</td>
</tr>
<tr>
<td style="width: 50%;"><img class="aligncenter" src="http://upra.sch.bme.hu/wp-content/uploads/2015/12/snw.png" alt="" width="100%" /></td>
<td valign="top">
<p style="margin-left: 30px; font-weight: bold;">Mérés-adatgyűjtő kártya (SNW)</p>
<p style="margin-left: 30px;">A szenzor modul feladata a környezeti szenzorok kezelése. Az SNW kezeli a külső hőmérséklet szenzort, nyomás szenzort, páratartalom mérőt valamint rendelkezik inerciális szenzorokkal, melyek a ballon orientációjának mérésére szolgálnak. A szenzor modul alkalmas a tudományos payload house-keeping szenzorainak kezelésére is.<br>
Az SNW interfész modulként is szolgálhat olyan műszerek esetében, melyek nem kapcsolódnak közvetlenül a rendszerbuszra.</p>
</td>
</tr>
<tr>
<td style="width: 50%;"><img class="aligncenter" src="http://upra.sch.bme.hu/wp-content/uploads/2015/12/eps.png" alt="" width="100%" /></td>
<td valign="top">
<p style="margin-left: 30px; font-weight: bold;">Elektromos energiaellátó alrendszer (EPS)</p>
<p style="margin-left: 30px;">Az EPS feladata biztosítani a megfelelő tápfeszültséget az egyes modulok számára. Az energia ellátó alrendszer alkalmas az egyes alrendszerek teljesítményfelvételének monitorozására, ha valamelyik modul meghibásodik (túláram, rövidzár) az EPS képes újraindítani illetve teljesen lekapcsolni a hibás modult.<br>
Az energia ellátó rendszer figyeli a teleptöltöttséget és az akku hőmérsékletet is. Amennyiben az akkumulátor hőmérséklete veszélyesen alacsonyra csökken az EPS bekapcsolja az akku fűtést.</p>
</td>
</tr>
</tbody>
</table>
Az egyes modulok külön kártyákon helyezkednek el, melyeket szerettünk volna a lehető legkisebb méreten tartani, hogy a későbbiekben akár kis-műholdas küldetések során is bevethető legyen a rendszer. A fejlesztés elején meghatároztuk az "UPRA Standard" formatényezőt, mely 70x75mm-es kártyáival belefér egy 1U CubeSat vázba.

<img class="wp-image-807 size-full" src="/images/misc/missing.svg" alt="UPRA Standard" width="100%" />
<p style="text-align: center; font-style: italic;">UPRA Standard</p>
&nbsp;

&nbsp;

&nbsp;

&nbsp;

<h1 style="text-align: center;">ReHAB Service Module</h1>
&nbsp;

&nbsp;

&nbsp;

A ReHAb Service Module gyakorlatilag a bedobozolt UPRA fedélzeti rendszer kiegészítve néhány, a ballonozás szempontjából fontos egységgel.

A ReHAB - 150 kapszula egy 150x150x150 mm-es, aluminium vázzal megerősített szigetelődoboz. A korábbi repüléseink során ezt a konfigurációt használtuk. A megfelelő hőszigetelést 2 cm vastag polisztirol lapok és egy többrétegű szigetelőkabát biztosítja. Az aluminium vázhoz kerül rögzítésre a rádiós modul és a GPS vevő antennája valamint az információs tábla, melyen az elérhetőségeink is megtalálhatók.
<br>
&nbsp;

<img class="aligncenter" src="http://upra.sch.bme.hu/wp-content/uploads/2015/05/IMG_9736.jpg" width="100%" />
<p style="text-align: center; font-style: italic;">Repülésre kész ReHAB-150 kapszula</p>
&nbsp;

Az új ReHAB - 1uQ kapszula tervezése a méret és a tömeg csökkentésének jegyében zajlott. Mindenképp szerettünk volna a hatékonyság mellett egy oktatási szempontból is hasznos eszközt készíteni, ezért egy könnyen összeállítható, 3D nyomtatott 1U CubeSat méretszabványú 10x10x10 cm-es vázat készítettünk. Amellett, hogy az új váz jelentősen könnyebb az elődjénél, a hallgatóknak lehetőségük van megismerkedni a kis-műholdas küldetések során felmerülő tervezési problémák megoldására.
<br>
&nbsp;

<img class="aligncenter size-full wp-image-820" src="/images/misc/missing.svg" alt="IMG_9782" width="100%" />

<p style="text-align: center; font-style: italic;">ReHAB-1uQ prototípus/teszt verzió</p>
&nbsp;

&nbsp;

&nbsp;

<h1 style="text-align: center;">Földi irányítóközpont</h1>
&nbsp;

&nbsp;

&nbsp;

A repülés biztonságos lebonyolítása érdekében szeretnénk kiépíteni egy saját földi irányítóközpontot, mely segítségével a felbocsátás után tudjuk követni és vezérelni a ballont. A tervezett földi állomás két fő részből áll:

<table width="100%">
<tbody>
<tr valign="center">
<td width="52.5%">
<p style="text-align: center; font-weight: bold;">Autómata Rádió Állomás (ARS)</p>
</td>
<td style="border: 1.5px dashed black;"></td>
<td width="47.5%">
<p style="text-align: center; font-weight: bold;">Vezérlő Állomás (MC)</p>
</td>
</tr>
</tbody>
</table>
<img class="aligncenter size-full wp-image-822" src="/images/misc/missing.svg" alt="GND" width="100%" />
<table width="100%">
<tbody>
<tr valign="top">
<td width="52.5%">
<p style="margin-right: 5%;">Az ARS biztosítja a tényleges rádiókapcsolatot a ballonnal. Alapja egy Raspberry PI mikroszámítógép, melyre közvetlenül kapcsolódik a rádió adóvevő áramkör és egy megfelelő antenna. A rendszer úgy lett megtervezve, hogy bármikor ki lehessen egészíteni automata antenna forgatóval, így repülés során végig pontosan követni tudjuk a ballon útját.
A beérkezett rádióüzenetek felbontása után a megfelelő adatok feltöltésre kerülnek Mission Control Server-en található adatbázisba.</p>
</td>
<td style="border: 1.5px dashed black;"></td>
<td width="47.5%">
<p style="margin-left: 5%;">A MC munkaállomásai internet/intranet segítségével érik el a Mission Control Server-en található adatbázist, melyből az aktuális repülésre vonatkozó információkat kereshetik ki. Az egyes munkaállomások specializált feladatot látnak el:</p>

<ul style="margin-left: 5%;">
 	<li>Flight: A repülésvezető áttekintő információkat kap a teljes rendszerről</li>
 	<li>COM: A rádiós csapat közvetlenül felügyeli a rádiós kommunikációt</li>
 	<li>Telemetry: A beérkező telemetria adatok alapján az aktuális, szimulációk és meteorológiai adatok alapján pedig a jövőbeni pozíciót határozza meg</li>
 	<li>House-keeping: A rendszer életjeleit figyeli</li>
 	<li>Science: A hasznos teher (mérőműszer, kísérlet) kezelőcsapata</li>
</ul>
</td>
</tr>
</tbody>
</table>
Korábbi repülések során a hasonló felépítésű <a href="http://gnd.bme.hu/" target="_blank">BME-GND Műegyetemi Műholdkövető Állomás</a> berendezéseit használhattuk, melyet ezúton is köszönünk!

<hr />

&nbsp;

További részletek és folyamatosan frissülő információk az UPRA Projekt<a href="http://upra.sch.bme.hu/" target="_blank"> HONLAPján</a> és <a href="https://www.facebook.com/UPRA.team" target="_blank">Facebook oldalán</a> találhatók.

&nbsp;

<hr />

&nbsp;
