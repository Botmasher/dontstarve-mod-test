GLOBAL.CHEATS_ENABLED = true
GLOBAL.require ( 'debugkeys' )

-- local variables
-- if in the mod environment (modmain.lua), you need to get require from the global environment
local require = GLOBAL.require
 
-- reference to the cached result stored in package.loaded["path/file"]
local Cooking = require "cooking"
 
print 'SAUCE got this stuff LOADED! YAYYYYAYAYYYY!'


function flowerpostinit(inst)    --print "Flower Post Init"
	local onpickedpre = inst.AddComponentPostInit.pickable.onpickedfn
	local onpicked = function(inst, picker)
		print("On Picked" .. tostring(inst) .. tostring(picker))
		inst:PushEvent("onpick", picker)
		onpickedpre(inst);
	end
	inst.components.pickable.quickpick = false
	inst.components.pickable.onpickedfn = onpicked
	local onpickedcheck = function(inst, picker)
		picker.components.happiness:DoDelta(10)
	end
	inst:ListenForEvent("onpick", onpickedcheck)
end


-- Store the existing function if it exists, otherwise store a dummy function as a fail-safe
local Cooking_AddIngredientValues_base = Cooking.AddIngredientValues or function() return true end

function Cooking:AddIngredientValues ( names, tags, cancook, candry )
    -- Get the result of the base function
    --[[
	    Note: Cooking_AddIngredientValues_base is called with the self parameter
	    because x:fn() is simply a shortcut for x.fn(x) with an implied self parameter
      ]]
    local cookable = Cooking_AddIngredientValues_base ( self, names, tags, cancook, candry )
 
    -- Mod statements
    cookable = candry and cancook

    return cookable
end

local function MyFn(self,inst) --this function acts as an extension to the class
	Cooking.AddIngredientValues ({"twigs"}, {inedible=1})
	print("postinit loaded")
	function self:SomeCoolFn() --you can even add functions
		self.inst:RemoveTag("hungercomponent")
		print("function fired")
	end
	inst:AddTag("hungercomponent")
end

local function OnLoad(player)
    Cooking.AddIngredientValues ({"twigs"}, {inedible=1}, false, false)
end
 
AddComponentPostInit(Cooking,MyFn) --again, this is where we actually add the stuff

AddSimPostInit(OnLoad)