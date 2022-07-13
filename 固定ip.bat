@rem Created by LT_Name
@rem https://github.com/lt-name/IPSettingHelper
@echo off
title 网络设置

set ver_ip=192.168.1.199
set ver_mask=255.255.255.0
set ver_gateway=192.168.1.1
set ver_dns_1=8.8.8.8
set ver_dns_2=8.8.4.4

Netsh interface ip set address name="本地连接" source=static addr=%ver_ip% mask=%ver_mask% gateway=%ver_gateway%

ver|find "10.0" >nul && goto win10
ver|find "6.1" >nul && goto win7

:win10
echo Win10
Netsh interface ipv4 set dnsservers "本地连接" static %ver_dns_1% primary
Netsh interface ipv4 add dnsservers "本地连接" %ver_dns_2% index=2
goto end

:win7
echo Win7
Netsh interface ip set dnsservers "本地连接" static %ver_dns_1% primary
Netsh interface ip add dnsservers "本地连接" %ver_dns_2% index=2
goto end

:end
cls
title 网络配置成功！
echo 网络配置成功！
echo 已将ip设置为    %ver_ip%
echo 已将掩码设置为  %ver_mask%
echo 已将网关设置为  %ver_gateway%
echo 已将DNS1设置为  %ver_dns_1%
echo 已将DNS2设置为  %ver_dns_2%
echo=
echo 将在3秒后自动关闭此窗口!
ping -n 3 127.0.0.1>nul