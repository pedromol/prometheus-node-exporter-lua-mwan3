ut = require "luci.util"

local function assert(b, expected)
   if b == expected then
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
         enabled({interface=k}, assert(v.enabled, true))
         up({interface=k}, assert(v.up, true))
         running({interface=k}, assert(v.running, true))
         status({interface=k}, assert(v.status, "online"))
      end
   end
end


return { scrape = scrape }