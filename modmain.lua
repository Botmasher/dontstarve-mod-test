-- local variables
-- if in the mod environment (modmain.lua), you need to get require from the global environment
--local require = GLOBAL.require
 
-- reference to the cached result stored in package.loaded["path/file"]
--local Cooking = require "cooking"

local function TwigsCookLikeFruit()
    AddIngredientValues ({"twigs"}, {fruit=1})
end
 
AddSimPostInit(TwigsCookLikeFruit)
AddSimPostInit(function() print ("This thing is running SAUCESTYLE!!!") end)