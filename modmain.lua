-- this is the mod environment; get require from the global environment
--local require = GLOBAL.require
 
-- reference to the cached result stored in package.loaded["path/file"]
--local Cooking = require "cooking"

local key1 = GLOBAL.KEY_R

local function TwigsCookLikeFruit ()
    AddIngredientValues ({"twigs"}, {fruit=1})
end

local function ActionOnKeyDown ()
	GLOBAL.TheInput:AddKeyDownHandler (key1, function ()
		print ("Pressed it! You sooo pressed the key!")	
		if not GLOBAL.IsPaused() then
			print ("\nNot pressed when paused.")
		else
			print ("\nYes, paused when pressed.")
		end
	end)
end

AddSimPostInit (TwigsCookLikeFruit)
AddSimPostInit (ActionOnKeyDown)
AddSimPostInit (function() print ("This thing is running like a SAUCE!!!") end)