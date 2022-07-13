@rem Created by LT_Name
@rem https://github.com/lt-name/IPSettingHelper
@echo off
title 网络设置

Netsh interface ip set address name="本地连接" source=dhcp

ver|find "10.0" >nul && goto win10
ver|find "6.1" >nul && goto win7

:win10
echo Win10
Netsh interface ipv4 set dnsservers "本地连接" static addr=none
goto end

:win7
echo Win7
Netsh interface ip set dnsservers "本地连接" static addr=none
goto end

:end
cls
title 网络配置成功！
echo 网络配置成功！
echo 已将ip和dns设置为自动获取！
echo=
echo 将在3秒后自动关闭此窗口!
ping -n 3 127.0.0.1>nul