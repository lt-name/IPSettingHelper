@rem Created by LT_Name
@rem https://github.com/lt-name/IPSettingHelper
@echo off
title ��������

Netsh interface ip set address name="��������" source=dhcp

ver|find "10.0" >nul && goto win10
ver|find "6.1" >nul && goto win7

:win10
echo Win10
Netsh interface ipv4 set dnsservers "��������" static addr=none
goto end

:win7
echo Win7
Netsh interface ip set dnsservers "��������" static addr=none
goto end

:end
cls
title �������óɹ���
echo �������óɹ���
echo �ѽ�ip��dns����Ϊ�Զ���ȡ��
echo=
echo ����3����Զ��رմ˴���!
ping -n 3 127.0.0.1>nul