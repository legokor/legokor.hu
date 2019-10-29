---
title: Otthon okosítás, avagy a SmartHome projekt
layout: post
author: bodo-zsofia
image: https://github.com/legokor/legokor.hu/blob/master/images/posts/Smarthome_19_10_29/7.SH_Haz_Modell_Profil_Alpha.png?raw=true

excerpt: Az okos otthonoknak sok fajtája létezik. A LEGO Kör SmartHome projekt keretein belül az utólag is könnyen beépíthető vezeték nélküli megoldással foglalkozunk. 
---

Az okos otthonoknak sok fajtája létezik. Már nem elvetekedett gondolat manapság egy építkezés során, hogy egy ház kivitelezése eleve így történjen. Alapvetően a huzalozott rendszerrel létrejövő megoldások nevezhetők a legstabilabbnak, legmegbízhatóbbnak ezen a téren, azonban egy ilyesfajta megvalósítás egy idősebb lakásban, házban elég költséges, körülményes lehet. Nem feltétlenül a rendszer ára, hanem a kiépítés pluszmunkálatai (pl. fal megbontása) miatt is. Így mi, a SmartHome projekt keretein belül nem a vezetékes, hanem a vezeték nélküli megoldással foglalkozunk. 

# A hálózat felépítése

Fő eszközünk az ESP32 mikrokontroller NODEMCU boardon. Az alapötlet, hogy a lakás különböző pontjain elhelyezünk ilyen ESP-ket, melyek önállóan, jelerősség alapján (WiFi) felépítenek magukból egy úgynevezett „mesh hálózatot”. Ezt úgy kívánjuk megvalósítani, hogy kihasználjuk az ESP32 azon tulajdonságát, hogy képes „access point” (ap), és station (sta) módban is működni. Előbbi mód gyakorlatilag egy vezeték nélküli hozzáférési pontként értelmezhető, az utóbbi mód lényege pedig, hogy a már meglévő hálózatban keres ap-kat.

![](/images/posts/Smarthome_19_10_29/1.SBC-NODEMCU-ESP32-01.png) 
<p style="text-align: center; font-size: 10px;">Az ESP32 NODEMCU board</p>


A hálózat úgy épülne fel, hogy veszünk 1 db ESP-t, és ap módba állítjuk. Az összes többi ESP sta módban van, ők keresik a már meglévő ap-kat. Amint találnak egyet, (amennyiben többet, akkor a legnagyobb jelerősségűre) rácsatlakoznak, és önmagukat is ap módba állítják.  Ez addig zajlik, amíg az összes ESP ap módban nem lesz. 

# Szenzorok, perifériák

A kihelyezett mikrokontrollerekre mindenféle szenzort ráköthetünk (pl.: hőmérséklet-/levegőnedvességmérőt, mozgásérzékelőt, stb...). Ezek lesznek a bemeneteink. Ez már jó alap arra, hogy adatokat gyűjtsünk, melyeket tárolhatunk egy web-/localszerveren. Természetesen elemezhetjük, és vizualizálhatjuk is ezeket az adatokat. A mi ötletünk a szenzorok, és perifériák bekötéséhez az I2C protokollú buszrendszer használata. Ez azért jó, mert több ki-és bemenetünk lehet, mintha az ESP32 GPIO (General Purpose Input/Output) portjait használnánk. A kivitelezéshez 2 panelre van szükségünk.

Az egyik panel az ESP32 boardot foglalja magába, annak lábait vezeti ki RJ12-es csatlakozású aljzatokhoz. Illetve a tápellátás miatt egy DC-jack táp is található rajta.

![](/images/posts/Smarthome_19_10_29/2.nyak_esp32.png)  


A másik panel 1 db RJ12-es aljzattal rendelkezik, amivel összeköthető a fentebb említett panellal, és erre köthetjük rá tüskesoros csatlakozással a kívánt szenzorokat, perifériákat.

![](/images/posts/Smarthome_19_10_29/3.nyak_szenzor.png) 


# Programozás

A szenzorok elhelyezése és bekötése után tudatnunk kell az ESP-vel, hogy mik is kerültek rá. Ennek megvalósítása a Google Blockly rendszerének használatával történik a mellékelt ábrán is látható módon. Minden ESP azonosítható a MAC (Media Access Control) címén keresztül. Az így azonosított eszköznek pedig már meg tudjuk mondani, hogy egyes szenzorok valamilyen állapota esetén mit tegyen az egyes kimenetein.
  
![](/images/posts/Smarthome_19_10_29/4.blockly.png) 


A frontend Blazor segítségével készül. 

![](/images/posts/Smarthome_19_10_29/5.blazor.png)   


# Modellház

Jelenlegi tervünk egy modellház megépítése, melynek célja elsősorban nem a felépülő mesh hálózat, hanem a szenzorhálózat bemutatása lenne. Végül erről mutatnék egy-két látványtervet:

![](/images/posts/Smarthome_19_10_29/8.SH_Haz_Modell_combined.png)   
