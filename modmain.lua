-- this is the mod environment; get require from the global environment
--local require = GLOBAL.require
 
-- reference to the cached result stored in package.loaded["path/file"]
--local Cooking = require "cooking"

-- 
local function WoodCooksLikeFood ()
	local fval = 2.6
    AddIngredientValues ({"twigs"}, {fruit=fval*0.2}, true)
    AddIngredientValues ({"log"}, {fruit=fval*0.4}, true)
end

--[[
	 Turn a prefab into an edible
	 and determine effect on stats
  ]]
local function MakeItFood(inst, hunger, health, sanity)
	inst:AddComponent ("edible")
	--	inst.components.edible.ismeat = false
	--	inst.components.edible.foodtype = "MEAT"
	inst.components.edible.foodtype = "VEGGIE"
	inst.components.edible.hungervalue = hunger
	inst.components.edible.healthvalue = health
	inst.components.edible.sanityvalue = sanity
end
  
-- Update food values of wood items
AddPrefabPostInit ("log", function (inst)
    MakeItFood (inst, 5, 4, 4)
end)

AddPrefabPostInit ("twigs", function(inst)
    MakeItFood (inst, 3, 2, 3)
end)

-- Update cooking values
AddSimPostInit (WoodCooksLikeFood)



-- TEST CODE ONLY below this line --

-- Carrot example from API examples modmain.lua
--[[local function BetterCarrotInit(prefab)
	prefab.components.edible.hungervalue = 200 -- carrots are the best food ever!!
end
AddPrefabPostInit("carrot", BetterCarrotInit)
]]

-- test event on key press (currently no effect on gameplay)
local key1 = GLOBAL.KEY_R

local function ActionOnKeyDown ()
	GLOBAL.TheInput:AddKeyDownHandler (key1, function ()
		print ("Pressed it! You sooo pressed that key!")	
		if not GLOBAL.IsPaused() then
			print ("\nNot pressed when paused.")
		else
			print ("\nYes, paused when pressed.")
		end
	end)
end

-- test keypress action (currently no effect on gameplay)
AddSimPostInit (ActionOnKeyDown)