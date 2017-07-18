--[[
LuCI - Lua Configuration Interface - Internet access control

Copyright 2015,2016 Krzysztof Szuster.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

$Id$
]]--
local uci = require "luci.model.uci"
local CONFIG_FILE_AC    = "user_access_control"

user_device_map = {}
function addToSet(set, key)
    set[key] = true
end

function removeFromSet(set, key)
    set[key] = nil
end

function setContains(set, key)
    return set[key] ~= nil
end
 
ma = Map(CONFIG_FILE_AC, translate("Internet Access Control"),
    translate("Access Control allows you to manage Internet access for specific local hosts.<br/>\
       Each rule defines a device to block from having Internet access. The rules may be active permanently or during certain times of the day.<br/>\
       The rules may also be restricted to specific days of the week.<br/>\
       Any device that is blocked may obtain a ticket suspending the restriction for a specified time."))

        
--=============================================================================================
s = ma:section(TypedSection, "device", "Device Settings")
s.anonymous = true
s.addremove = true
s.template = "cbi/tblsection"
--=================================================================================
u=s:option(ListValue, "user", translate("User"))
local uci_r = uci.cursor()
uci_r:foreach(CONFIG_FILE_AC, "users",
                        function(s)
				u:value(s.name,s.name)
	--			addToSet(user_device_map,s.src_mac)                                
                        end)

s:option(Value, "desc", translate("DescriptionÂ"))
o = s:option(Value, "src_mac", translate("MAC Address"))
        o.rmempty = false
        o.datatype = "macaddr"
        luci.sys.net.mac_hints(function(mac, name)
            o:value(mac, "%s (%s)" %{ mac, name })
        end)
los=s:option(ListValue, "os", translate("OS Type"))
los:value("OSX", translate("OSX"));
los:value("WINDOWS", translate("Windows"));
los:value("ANDROID", translate("Android"));
los:value("LINUX", translate("Linux"));
return ma


