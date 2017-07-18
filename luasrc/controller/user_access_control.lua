--[[
LuCI - Lua Configuration Interface - Internet access control

Copyright 2015,2016 Krzysztof Szuster.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

$Id$
]]--

module("luci.controller.user_access_control", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/user_access_control") then
		return
	end
	
	
	local page
	page = entry({"admin", "network", "user_access_control"}, 
	    alias("admin", "network", "user_access_control", "settings"),  _("User Access Control"))
	page.dependent = true
	
	entry({"admin", "network", "user_access_control", "settings"},
                cbi("user_access_control/settings"),
                _("General Settings"), 10).leaf = true

	entry({"admin", "network", "user_access_control", "users"},
                cbi("user_access_control/users"),
                _("Users"), 20).leaf = true

        entry({"admin", "network", "user_access_control", "devices"},
                cbi("user_access_control/devices"),
               _("Devices"), 30).leaf = true

        entry({"admin", "network", "user_access_control", "rules"},
                cbi("user_access_control/access_control"),
                _("Access Rules"), 40).leaf = true

end
