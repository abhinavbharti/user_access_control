--[[
LuCI - Lua Configuration Interface - Internet access control

Copyright 2015,2016 Krzysztof Szuster.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

$Id$
]]--

local CONFIG_FILE_AC    = "user_access_control"

ma = Map(CONFIG_FILE_AC, translate("Internet Access Control"),
    translate("Access Control allows you to manage Internet access for specific local hosts.<br/>\
       Each rule defines a device to block from having Internet access. The rules may be active permanently or during certain times of the day.<br/>\
       The rules may also be restricted to specific days of the week.<br/>\
       Any device that is blocked may obtain a ticket suspending the restriction for a specified time."))

local s_gen = ma:section(NamedSection, "general", "access_control", translate("General settings"))
    local o_global_enable = s_gen:option(Flag, "enabled", translate("Enabled"),
        translate ("Must be set to enable the internet access blocking"))
        o_global_enable.rmempty = false
    local o_ticket = s_gen:option(Value, "ticket", translate("Ticket time [min]"), 
	      translate("Time granted when a ticket is issued"))
        o_ticket.datatype = "uinteger"
        o_ticket.default = 60
        
--========================================================================================================
  return ma


