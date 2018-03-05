---
title: FreeRTOS villogó példa
layout: default
projects:
- Quadrocopter
---
# FreeRTOS villogó példa

Ha sikeresen feltelepítettük a fejlesztőkörnyezetet és le tudtuk fordítani az üres projektet, akkor nekiláthatunk tartalommal megtölteni. Először egy egyszerű LED-villogtató alkalmazást mutatunk be UART kommunikációval, majd kiegészítjük PMW generálással, amivel később a quadcopter motorjait tudjuk vezérelni.

A projekt konfigurálása során beállítottuk, hogy a konfigurátor állítsa be nekünk a FreeRTOS-t. Ez egy ingyenes, beágyazott rendszerekben előszeretettel használt [valós idejű](https://en.wikipedia.org/wiki/Real-time_operating_system) operációs rendszer. Segítségével taskokat hozhatunk létre, akár csak a tanfolyamon használt NXT-n, és ezeket az operációs rendszer felváltva, kvázi párhuzamosan futtatja, vagy a megadott időzítésekkel ütemezi. Az operációs rendszer tehát megkönnyíti a programozás menetét, illetve biztonságosabbá teszi programunkat. A FreeRTOS-nek saját függvénykönyvtára van, melyek segítségével létrehozhatjuk a taskokat, ütemezhetjük, vagy kinyírhatjuk azokat. A példák során megismerkedünk ezen függvények használatával.

Ezen kívül szükségünk van az STM HAL (Hardware Abstraction Layer) ismeretére. Ez szintén egy függvénykönyvtár, mellyel a mikrokontroller perifériáit (GPIO, UART, PWM, I2C, TIMER) kezelhetjük. Kezdetben bonyolultnak tűnhetnek, de ha az alapokkal megismerkedtünk, később sokkal könnyebb a fejlesztés menete.

## A kiindulási alapunk

A Cube legenerálta nekünk a beállításainknak megfelelő kezdeti kódot. Ez remélhetőleg mindenkinek úgy néz ki, mint itt a repoban. Minket most főleg az `Src/main.c` file fog érdekelni. Mint láthatjuk, elég terjedelmes kódot generált a program. Ebben főként a perifériákat inicializálja, valamint felkonfigurálja az OS-t. Minden perifériának külön inicializáló függvénye van, melyeknek az implementációja a kód végén található. Amik most számunkra érdekesek, azok az operációs rendszer függvényei. A kód futása a megszokott `main()`-ben kezdődik. Itt találhatjuk a példa task inicializáló sorait:

```c
osThreadDef(defaultTask, StartDefaultTask, osPriorityNormal, 0, 128);
defaultTaskHandle = osThreadCreate(osThread(defaultTask), NULL);
```

Ez inicializál egy taskot `defaultTask` néven, normál prioritással. A taskot egy függvény fogja megvalósítani, amit `StartDefaultTask` néven implementálunk (ahhoz, hogy itt ne kapjunk hibát, a függvényt korábban deklaráni kell).

Ezután elindítja az ütemezőt `osKernelStart()`, ami vált a taskok között. Most csak egy taskunk lesz, így az ütemező valójában nem fog váltogatni, de ettől még el kell indítani, hogy működjönk a program.

Ettől a ponttól fogva az ütemező dönti el, hogy mi fusson, és soha nem tér vissza a fent meghívott függvény.
Már csak implementálunk kell a taskot jelentő függvényt. Ezt már a kód végén el is kezdte nekünk a Cube. Keressük meg a következő részt:

```c
void StartDefaultTask(void const * argument)
{

  /* USER CODE BEGIN 5 */
  /* Infinite loop */
  for(;;)
  {
    osDelay(1);
  }
  /* USER CODE END 5 */
}
```

A taskoknak mindig végtelen ciklust kell tartalmazniuk, magától az ütemező nem ciklikusan hajtja végre a programot. Itt megírhatjuk a villogtató programot.

## LED villogtató task

Itt jegyezném meg, hogy az Eclipse-ben alapból a build gombra kattintva nem menti el a file-t a program, illetve szintén hasznos lehet tudni, hogy a ctrl+space billentyűkombinációval elérjük a kódkiegészítés funkciót.

Most lesz szükségünk a korábban említett HAL könyvtárra. Ennek a megfelelő elemei már include-olva vannak, ha az eddigiek alapján készítettük el a projektet. A GPIO (digitális ki/bemenet) kezelésére az alábbi függvényeink vannak:

```c
void HAL_GPIO_WritePin(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, GPIO_PinState PinState);
void HAL_GPIO_TogglePin(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
GPIO_PinState HAL_GPIO_ReadPin(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
```

Nekünk most a `HAL_GPIO_TogglePin` függvényre lesz szükségünk. A teljes dokumentációt [itt](http://www.st.com/content/ccc/resource/technical/document/user_manual/2f/71/ba/b8/75/54/47/cf/DM00105879.pdf/files/DM00105879.pdf/jcr:content/translations/en.DM00105879.pdf) találjuk. Ennek felhasználásával a villogtató ciklus így néz ki (a define-okat is a Cube hozta létre):

```c
for(;;)
{
  HAL_GPIO_TogglePin(LD3_GPIO_Port, LD3_Pin);
  osDelay(500); // 500ms-os várakozás
}
```

A programot a boardra töltve láthatjuk, hogy a középső, narancssárga LED fél másodpercenként ki-be kapcsol.
