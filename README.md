# user_access_control for OpenWrt based devices

 This provides device(mac) and time based access control to wifi.

This code is based on luci-access-control by k-szuster at the github - https://github.com/k-szuster/luci-access-control.

I have addded the ability to create user and associate devices with a particular user and then the access rules can be created.

This software is designed for OpwnWrt routers. It allows you to restrict the internet access for specific hosts in your LAN. You can block the internet access permanently or on schedule basis for any MAC address. The schedule contains the time of a day and the deys of the week. New in version 4: You can also issue a "ticket" for any blocked user. It gives him an extraordinary access to the internet for a given time.

The software is a Luci app extending system's firewall, so it runs on any platform with no need of recompiling. Tested on OpenWrt CC and LEDE 17.01.1. 

NOTE: For times to be consistent it is advised to use NTP.

After installation you'll find a new page in OpenWrt's GUI: Network/User Access control.

To build the package OpenWrt

The package is designed to be huilt on OpenWrt-CC, for any target (it is architecture independent).

    Place folder luci-access-control into your

    /feeds/luci/applications

folder.

    After this has been completed, call

	./scripts/feeds update luci ; ./scripts/feeds install -a luci

from your openwrt folder.

    Call

	make menuconfig

Here, you must include the following packages in your OpenWRT build for everything to work:

	LuCI -> applications -> luci-app-access-control

    Call make to compile OpenWRT with the selected package installed. You'll find it in /bin//packages/luci/luci-app-access-control_....ipk file.

    On OpenWrt-BB, after installing the ipk, you need to additionally run this command on the device:

	/etc/init.d/inetac enable

    Reboot.
