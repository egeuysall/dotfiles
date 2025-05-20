-- plugins/init.lua

local plugins = {}

-- Import plugin specs from other files (like wakatime.lua)
local wakatime = require("plugins.wakatime")

-- Add each plugin spec to the table (assuming wakatime.lua returns a table or list)
for _, plugin in ipairs(wakatime) do
  table.insert(plugins, plugin)
end

-- Return the combined plugins table
return plugins
