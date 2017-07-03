---
title: prog1
layout: default
---

# Prog 1

## Bevezetés

- NXC -> Not eXactly C
- LEGO NXT, MINDSTORMS NXT termékek programozására
- Case-sensitive nyelv, mint a C és C++, azaz pl.: "xYz" != "Xyz"
- Hasonló C/C++-hoz
- Változók (bool, char, unsigned int, mutex stb.)
- Tömb (array)
- Operátorok (!= , == , += , stb. )
- Struktúrák pl.:
  {% highlight c %}
  struct car
  {
  string car_type;
  };

  car.car_type= "honda";
  {% endhighlight %}
- Nyelvi elemek (if, while, do, for, switch, stb.)

## Alap függvények

### Motorvezérlések

- OnFwd(OUT_X, N);

  Az X-ben megadott portokon lévő motorokat előre menetbe állítja, N-ben a feszültséget (és így a sebességet) lehet állítani, %-ban adható meg az érték.
- OnRev(OUT_X, N);

  Motor hátramenet.
- Off(OUT_X);

  Kikapcsolja a motorokat.

### Szenzorok

- SetSensorTouch(IN_X);

  Nyomógomb inicializálása, X a port, amire be van kötve.
- SetSensorLowspeed(IN_X);

  Ultrahang szenzor inicializálása.

- SetSensorColorFull(IN_X);
  RGB Szenzor inicializálása. (1 – fekete; 2 – kék; 3 – zöld; 4 – sárga; 5 – piros; 6 – fehér)

A szenzorok értékét a SENSOR_X változóval lehet lekérni, kivéve az ultrahang szenzort, azt a
SensorUS(IN_X) változóval lehet.

### Egyéb

- Wait(x);

  Üresjárat, x egy szám, ms-ban adható meg a késleltetés.
- NumOut(0,LCD_LINE1, X ,FALSE);

  Szám kiírása az LCD- -re.
- TextOut(0,LCD_LINE2,"String",FALSE);

## Példák

Előremegy fél másodpercig, visszamegy fél másodpercig, és folyamatosan írja ki az ultrahang szenzor értékét. (távolság)

{% highlight c %}
task main()
{
SetSensorLowspeed(IN_1); //Ultrahang szenzor inicializálása
OnFwd(OUT_AB, 60); //A és B portokon lévő motorokat előremenetbe kapcsolja
Wait(500);
//Fél másodpercet vár
OnRev(OUT_AB, 60); //Motorokat hátramenetbe kapcsolja
Wait(500);
//Ismét vár
Off(OUT_AB);
//Kikapcsolja a motorokat
while(1)
//Folyamatosan mőködő cilus
{
NumOut(0,LCD_LINE1,SensorUS(IN_1),FALSE); //Szám kiírása. Folyamatosan
//kiírja a távolságot
TextOut(0,LCD_LINE2,"Hello World",FALSE); //Kirja, hogy "Hello World"
Wait(100);
//Vár 100ms-t
ClearScreen();
//Törli a kijelzıt
}
}
{% endhighlight %}

Megy, amíg meg nem nyomják a gombot, ha kék színt érzékel, akkor megfordul és megy tovább.

{% highlight c %}
task main()
{
SetSensorTouch(IN_3); //Nyomógomb inicializálása
SetSensorColorFull(IN_2); //RGB szenzor inicializálása
while(SENSOR_3==0)
//Amíg nincs benyomva a gomb, addig fut
{
OnFwd(OUT_AB,60);
//Megy elıre
el
if(SENSOR_2==2)
//Ha kéket érzékel
{
OnFwd(OUT_A,50);
//A porton lévő motor előre
OnRev(OUT_B,50);
//B hátra
Wait(2900);
//Vár 2,9 másodpercet
}
}
}
{% endhighlight %}
