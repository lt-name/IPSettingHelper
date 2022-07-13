@rem Created by LT_Name
@rem https://github.com/lt-name/IPSettingHelper
@echo off
title ��������

set ver_ip=192.168.1.199
set ver_mask=255.255.255.0
set ver_gateway=192.168.1.1
set ver_dns_1=8.8.8.8
set ver_dns_2=8.8.4.4

Netsh interface ip set address name="��������" source=static addr=%ver_ip% mask=%ver_mask% gateway=%ver_gateway%

ver|find "10.0" >nul && goto win10
ver|find "6.1" >nul && goto win7

:win10
echo Win10
Netsh interface ipv4 set dnsservers "��������" static %ver_dns_1% primary
Netsh interface ipv4 add dnsservers "��������" %ver_dns_2% index=2
goto end

:win7
echo Win7
Netsh interface ip set dnsservers "��������" static %ver_dns_1% primary
Netsh interface ip add dnsservers "��������" %ver_dns_2% index=2
goto end

:end
cls
title �������óɹ���
echo �������óɹ���
echo �ѽ�ip����Ϊ    %ver_ip%
echo �ѽ���������Ϊ  %ver_mask%
echo �ѽ���������Ϊ  %ver_gateway%
echo �ѽ�DNS1����Ϊ  %ver_dns_1%
echo �ѽ�DNS2����Ϊ  %ver_dns_2%
echo=
echo ����3����Զ��رմ˴���!
ping -n 3 127.0.0.1>nul