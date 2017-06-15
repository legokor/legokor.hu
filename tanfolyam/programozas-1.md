---
title: prog1
layout: default
---
{% highlight c %}
    int getColor() {
      int color;
      color = Sensor(IN_3);
      NumOut(LCD_LINE2, LCD_LINE2, color, false);
      return color;
    }
{% endhighlight %}
