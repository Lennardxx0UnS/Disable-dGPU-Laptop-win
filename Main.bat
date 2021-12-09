@echo off
echo "Disable/Enable dGPU Tool"
echo Make sure that this script is run as an administrator.
echo WARNING: Please make sure you are using the internal screen instead of an external monitor!
choice /C YN /M "To confirm the operation, press Y, otherwise press N."
IF %ERRORLEVEL% EQU 1 goto ch1
IF %ERRORLEVEL% EQU 2 goto end

REM 这个管道即为主命令，根据上面的结果决定是否执行
:ch1
setlocal enabledelayedexpansion
REM 这里status后面的字符串，请自行用 devcon listclass display 找到独显的ID，然后使用devcon status *判断设备唯一性，再替换这一*""内的部分。
REM 后面的地址自己选一个空的存在的地址即可。
devcon status *"VEN_XXXXXX"  > "%Windir%\%tmp%.txt"
for  /f  "skip=2 delims="  %%a  in  (%Windir%\%tmp%.txt)  do  (
set  txt=%%~a
goto :Show
)
:Show
echo  %txt% | findstr "disabled" && devcon enable *"VEN_XXXXXX" && echo Enable dGPU. || devcon disable *"VEN_XXXXXX" && echo Disable dGPU.
del %Windir%\%tmp%.txt
goto end

:end
ping /n 4 127.1 > null
REM 定时关闭窗口，批处理结束
exit

