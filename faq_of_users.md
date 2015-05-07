有问题请先看 seuthesis.pdf，再看本 FAQ，最后实在没招，就去[这里](http://bbs.seu.edu.cn/bbsdoc.php?board=TeX) 提问。

**Q:** 为什么 seuthesis 编译不通过。

**A:** 这个可能原因有很多。不过用 texlive 并且 CJK 字体设置好的话，肯定能通过编译。其他发行版的问题我暂时不知道，_**知道的请 [mail](mailto://dongjianning1990@gmail.com) 我，或者留下 comments**_。

**Q:** 为什么我的 sample.tex 之类的文件打开是乱码？

**A:** 请注意：seuthesis 默认为 [utf-8](http://zh.wikipedia.org/wiki/UTF-8) 编码。如果您是 windows用户，推荐您也使用 utf-8 编码您的论文，这样做会减少很多问题。当然您也可以使用 gbk 编码，此时您需要指定编码:`\documentclass[gbk]{seuthesis}`。

**Q:** 不知道大家注意到没有，在使用seuthesis写论文时，当论文中出现中英文摘要、列出所有
图表（\listoftables、\listoffigures、\listoflistings）时出现一些空白页，
即使第二页没有内容仍然会产生出来，这样很影响美观。

**A:** 其实这个不是问题，空白页是因为book.cls默认为双面打印，插入空白页保证每一章的第一页在奇数页
这样设计是为了美观。如果想去掉加参数就可以了 `\documentclass[oneside]{seuthesis}`。
使用时，可以编译一个“ 电子版” 一个“ 打印版”。