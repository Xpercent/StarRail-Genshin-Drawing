# StarRail-Genshin-Drawing<br>
## 基于Qml和C++开发的一款桌面端原神崩铁抽签软件<br>
视频演示请见<br>
[https://space.bilibili.com/9579763](https://space.bilibili.com/1180550329)<br>
软件下载地址<br>
https://gitcode.net/yyx2216/genshin-prays-for-class-qml/-/raw/master/cq.zip<br>
==
<br>

![Snipaste_2024-01-28_00-52-37](https://github.com/Xpercent-YX/StarRail-Genshin-Drawing/assets/149877139/455379bc-4f14-4630-89f6-2b84b5a4a8cc)
![Snipaste_2024-01-28_00-53-12](https://github.com/Xpercent-YX/StarRail-Genshin-Drawing/assets/149877139/64fe0885-11a6-4d13-b9de-4b090d5bf765)

## 编译过程
运行环境QT 5.1x<br>
安装LAV(在release文件中)
```bash
open main_cq.pro 并编译

将文件夹中的：
        file
        font
        UI
        Updown
        restart.bat
        restart.vbs

复制到你release/debug的目录下(与编译出来的exe文件处于同一目录下)

编译完成Down
```
## 打包过程
软件：CQtDeployer.exe
      Bat_To_Exe_Converter.exe

win+R打开cmd 输入:
```bash
cd /d 编译后的软件exe目录
```
QT安装路径改成自己的 输入:
```bash
%cqtdeployer% -bin main_cq.exe -qmake F:\Code\tools\QT\5.15.2\mingw81_64\bin\qmake.exe -qmlDir F:\Code\tools\QT\5.15.2\mingw81_64\qml -qmlOut ku -libOut ku -pluginOut ku
```
运行后会得到DistributionKit文件
```bash
------------
DistributionKit--
            ku
            translations
            main_cq.bat
            main_cq.exe
            qt.conf
------------
```
把release/debug下的
```bash
------------
            file
            font
            UI
            Updown
            restart.bat
            restart.vbs
------------
复制到DistributionKit里
```
运行Bat_To_Exe_Converter.exe<br>
把DistributionKit里的main_cq.bat转为exe(32位,隐藏控制台)<br>
并把得到的exe文件名改为:cq.exe<br>
把cq.exe复制到DistributionKit里<br>
```bash
最终的程序结构目录--
------------
            file
            font
            ku
            UI
            Updown
            translations
            cq.exe
            main_cq.bat
            main_cq.exe
            restart.bat
            restart.vbs
            qt.conf
------------
```
# Contributors

[![Contributors](https://contributors-img.web.app/image?repo=Xpercent-YX/Xpercent-YX)](https://github.com/Xpercen/Keyboard-monitoring/graphs/contributors)
