# Introduction #

本模板默认章首页不显示页眉，这也是国际惯例。但是似乎以前的多数论文章首页都是选择显示页眉的。本文将介绍如何在源文件里控制是否显示页眉。


# Details #
首先，你需要引入fancyhdr宏包。

如果需要在章首页显示页眉，只需要在\chapter定义的后面加上一句\thispagestyle{fancy}即可。

因为使用fancyhdr宏包之后，会自动在各chapter的首页使用\thispagestyle{plain}，所以必须要显示指定thispagestyle来强制当前页采用fancy风格。