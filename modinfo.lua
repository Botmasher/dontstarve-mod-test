name = "You Cook Twigs Now"
version = "1.0"
author = "Botmasher (Josh)"
description = [[Twigs can now be cooked in the crockpot!
This is my first test mod.]]
 
--this would be the address on the Klei forums
forumthread = "/files/file/"
 
--the following is not required, but useful for other
--mods that try to check whether our mod is enabled
id = "CookTwigs01"
 
 -- options to offer the user in settings
-- can access through modmain.lua using GetModConfigData("optionname")
--[[ configuration_options =
	{
		{ -- An option element
			-- serves as id
			name = "OptName",
			-- Displayed to user. (optional)
			label = "Some Option",
			options =
			{
				{description = "Selection 1", data = 1},
				{description = "Selection 2 (default)", data = 2},
				{description = "Selection 3", data = 3},
				{description = "Selection 4", data = 4}
			},
			default = 2 -- this should match one of above
		}, -- more options
	} ]]
 
api_version = 6
--the following are DLC related
--if set to false, the mod gets disabled while the DLC is used/not used
dont_starve_compatible = true --set this to false if requires DLC
reign_of_giants_compatible = true --set this to false if not working with DLC
 
icon = "modicon.tex" --preview image
icon_atlas = "modicon.xml"