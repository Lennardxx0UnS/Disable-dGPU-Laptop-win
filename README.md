# Disable-dGPU-Laptop-win
A very simple batch command to turn off the dual graphics card notebook's independent display

通过调用MS自带的devcon工具禁用独显，实现双显卡笔记本电脑进一步节能。
使用须知：
1.必须确保系统存在devcon.exe这个程序，如果不存在请安装Windows SDK，然后从目录中将devcon.exe提取并放入/Windows/system32.
2.脚本必须以管理员身份运行，否则无法对显示设备做出更改。
3.请必须确保你填入的设备ID字符串在devcon status中是唯一的。
4.这个批处理没有设备保护功能，请确保你了解输入的设备ID和指令！
5.因为此脚本所造成的设备和系统损坏恕不负责。
