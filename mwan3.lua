ut = require "luci.util"

local function fromBool(b)
   if b == true then
      return 1
   end
   return 0
end

local function isOnline(s)
   if s == 'online' then
      return 1
   end
   return 0
end

local function scrape()
   local state = ut.ubus("mwan3", "status", {})

   if state ~= nil then
      local enabled = metric("node_mwan3_interface_enabled", "gauge")
      local up = metric("node_mwan3_interface_up", "gauge")
      local running = metric("node_mwan3_interface_running", "gauge")
      local status = metric("node_mwan3_interface_status", "gauge")

      for k,v in pairs(state.interfaces) do
         enabled({interface=k}, fromBool(v.enabled))
         up({interface=k}, fromBool(v.up))
         running({interface=k}, fromBool(v.running))
         status({interface=k}, isOnline(v.status))
      end
   end
end


return { scrape = scrape }