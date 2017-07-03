---
layout: default
title: prog2
---

# Prog2

## Infra szenzor:(eddig volt: Touch , ultrahang, RGB)

Az light sensor működésének két féle módja van, aktív és passzív. Annyi a különbség, hogy aktív módban használ saját fényforrást, míg a passzívban nem. Célszerű az aktív módban használni, mert saját fényforrással megvilágítva a felületet kiküszöbölhetők az árnyékból adódó sötét foltok.

fontos kifejezesek/függvények:

- SetSensorLight(PORT);
- SetSensorType(PORT,IN_TYPE_LIGHT_INACTIVE); -> passzív
- SetSensorType(PORT,IN_TYPE_LIGHT_ACTIVE); -> aktív
- ResetSensor(PORT);

## Taskosítás:

Az NXC program taskokból áll. Minden programnak kell lennie egy 'main ' taskjának, amit a robot elsőként végrehajt. Eddig olyan programokról volt szó, amik csak ebből az egy taskból álltak, de az NXC program több taskból állhat, amik párhuzamosan futnak le(gyakorlatilag nem párhuzamos, de ezt nem vesszük észre). A párhuzamosan futtatott taskokkal a programot átláthatóbbá és kompaktabbá lehet tenni.

fontos kifejezesek/függvények:

- task tasknev1{...}
- Procedes(task1, task2, task3,...,task255)
- start tasknev1;
- stop tasknev1;
- break;

pl.:

{% highlight c %}
task music() {
while (true) {
PlayTone(TONE_A4, MS_500);
Wait(MS_600);
}
}
task movement() {
while (true) {
OnFwd(OUT_A, Random(100));
Wait(Random(SEC_1));
}
}
task controller() {
Wait(SEC_10);
stop music;
Wait(SEC_5);
StopAllTasks();
}
task main() {
Precedes(music, movement, controller);
}
{% endhighlight %}

feladat: Legyen 3 task, amelyek közül az egyik cikkcakkban mozgatja a robotot, a másik pedig írja ki a kijelzőre az RGB értékeit, 3. pedig hangot ad ki 5 másodpercenként.

## (Szubrutin:)

Ha egy kódrészletet sokszor kell használni, akkor létrehozhatunk szubrutinokat:

{% highlight c %}
sub subnev(...){...}
sub turn_around(int pwr)
{
OnRev(OUT_C, pwr); Wait(900);
OnFwd(OUT_AC, pwr);
}
task main()
{
OnFwd(OUT_AC, 75);
Wait(1000);
turn_around(75);
Wait(2000);
turn_around(75);Wait(1000);
turn_around(75);
Off(OUT_AC);
}
{% endhighlight %}

feladat:

## Szemafor:

A taskosítás tehát nagyon jó arra, hogy párhuzamosan végezzünk műveleteket a különböző taskokkal, melyek közül az egyik például mozgatja a robotot, a másik pedig hangot ad ki. Ám a párhuzamosan futó taskok bizony némi hibalehetőséget is hordoznak magukban, könnyen interfellálhatnak egymással. Ennek kezelésére alkalmazzuk a szemafor algoritmust, melynek lényege, hogy létrehozunk egy globális bináris változót, amit billegtetünk egyes kritikus taskok esetén.

{% highlight c %}
until (sem == 0);
sem = 1; //Foglalt az erőforrás
// Végrehajtunk valamit a motorral
// kritikus rész
sem = 0; //Szabad az erőforrás
{% endhighlight %}

példa ROSSZ programra:

{% highlight c %}
task check_sensors()
{
while (true)
{
if (SENSOR_1 == 1)
{
OnRev(OUT_AC, 75);
Wait(500);
OnFwd(OUT_A, 75);
Wait(850);
OnFwd(OUT_C, 75);
}
}
}
task submain()
{
while (true)
{
OnFwd(OUT_AC, 75); Wait(1000);
OnRev(OUT_C, 75); Wait(500);
}
}
task main()
{
SetSensor(IN_1,SENSOR_TOUCH);
Precedes(check_sensors, submain);
}
{% endhighlight %}

példa program szemaforral:

{% highlight c %}
int sem;
task move_square()
{
while (true)
{
until (sem == 0); sem = 1;
OnFwd(OUT_AC, 75);
sem = 0;
Wait(1000);
until (sem == 0); sem = 1;
OnRev(OUT_C, 75);
sem = 0;
Wait(850);
}
}
task submain()
{
SetSensor(IN_1, SENSOR_TOUCH);
while (true)
{
if (SENSOR_1 == 1)
{
until (sem == 0); sem = 1;
OnRev(OUT_AC, 75); Wait(500);
OnFwd(OUT_A, 75); Wait(850);
sem = 0;
}
}
}
task main()
{
sem = 0;
Precedes(move_square, submain);
}
{% endhighlight %}

feladat: egyik task viszi a robotot cikkcakkban, a másik pedig érzékeli a színeket és kék színre
átveszi a motorok vezérlését és négyzet alakban körbe mozgatja a robotot.

## Encoder:

Az NXT szervomotorokban van beépített enkóder, amit ki tudunk használni precíz mozdulatokhoz.
Például be lehet állítani, hogy mekkora szögben forduljon el (fokban). Sőt adatokat tudunk
visszanyerni a motorokból, így haladás közben a megtett távolságról kapunk információkat.

fontos kifejezesek/függvények:
- ResetTachoCount(PORT);
- MotorTachoCount(PORT);
- RotateMotor(PORT,sebesség,fok)

feladat: -Kiszámítják, hogy 1 cm hány egység
- Menjenek 25 cm-t majd álljanak meg

## Szinkron fordulás:

Az enkóderekből nyert információkkal tudunk szinron mozgásokat végezni. A párban lévő motorokat
szinkronizálva elérhetjük, hogy a robot tökéletesen egyenesen haladjon, vagy például tartson egy
meghatározott sebességet.
- OnFwdReg(‘ports',‘speed',‘regmode')
- OnRevReg(‘ports',‘speed',‘regmode')
->regmode:
// OUT_REGMODE_IDLE -> Nincs szinrkonizáió
OUT_REGMODE_SPEED -> Tartja a sebességet
OUT_REGMODE_SYNC -> Szinkronban vannak a motorok
- OnFwdSync(‘ports',‘speed',‘turnpct')
-OnRevSync(‘ports',‘speed',‘turnpct')
->turnpct: forduláshoz megadható szinkron érték [-100;100]
0
-100 vagy 100
1
-> egyenesen megy
-> helyben elfrodulÖsszetett feladatok
1) Robot touchra indulva kövessen egy téglalap alakú szigszalagos részt, mérje
meg ennek a kerületét, de közben minden 10 cm-nél csippantson egyet.
// PlayTone(frequency, duration)
