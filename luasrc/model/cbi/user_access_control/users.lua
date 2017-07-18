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


ma = Map(CONFIG_FILE_AC, translate("Internet Access Control"),
    translate("Access Control allows you to manage Internet access for specific local hosts.<br/>\
       Each rule defines a device to block from having Internet access. The rules may be active permanently or during certain times of the day.<br/>\
       The rules may also be restricted to specific days of the week.<br/>\
       Any device that is blocked may obtain a ticket suspending the restriction for a specified time."))

        
--=============================================================================================
s = ma:section(TypedSection, "users", "User Settings")
s.anonymous = true
s.addremove = true
s.template = "cbi/tblsection"
--=================================================================================
s:option(Value, "name", translate("User"))
--=================================================================================

  return ma


