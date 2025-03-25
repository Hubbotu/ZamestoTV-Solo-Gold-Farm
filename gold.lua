local myname, ns = ...
local L = LibStub("AceLocale-3.0"):GetLocale(myname, false)

local path_meta = {__index = {
    label = "Path to treasure",
    atlas = "map-icon-SuramarDoor.tga",
    path = true,
    scale = 1.1,
}}

ns.map_spellids = {
    -- [2022] = 0, -- The Waking Shores
    -- [2025] = 0, -- Thaldraszus
    -- [2200] = 0, -- Emerald Dream
	-- [2133] = 0, -- Zaralek Cavern
    -- [2024] = 0, -- The Azure Span
	
    -- [2339] = 0, -- Dornogal
    -- [2214] = 0, -- ringing deeps
    -- [2215] = 0, -- hallowfall
	-- [2248] = 0, -- dorn	
}

ns.points = {
    [2022] = { -- The Waking Shores
        [25575695] = ({
            label = L["Alvin the Anvil"],
            cont = true,
            Zamro = true,
            note = L["Alvin the Anvil Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\fskull.tga",
        }),
		[35724793] = ({
            label = L["Cave Entrance"],
            cont = true,
            Zamro = true,
            note = L["Cave Entrance Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\cave.tga",
        }),
		[34624668] = ({
            label = L["Portal Forbidden Reach"],
            cont = true,
            Zamro = true,
            note = L["Portal Forbidden Reach Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\portal.tga",
        }),
		[58585305] = ({
            label = L["Misty Satchel"],
            cont = true,
			quest = 65646,  
            Zamro = true,
            note = L["Misty Satchel Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\chest.tga",
        }),
        [29405980] = ({
            label = L["Rohzor"],
            cont = true,
            quest = 74052,        
		    Zamro = true,
            note = L["Rohzor Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\bskull.tga",
        }),
    },
	[2133] = { -- Zaralek Cavern
        [28605100] = {
            label = L["Dinn"],
            cont = true,
			quest = 75352,
            Zamro = true,
            note = L["Dinn Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\bskull.tga",
        },
    },
	[2024] = { -- The Azure Span
        [67601860] = {
            label = L["Snowclaw Cub"],
            cont = true,
            Zamro = true,
            note = L["Snowclaw Cub Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\tokens.tga",
        },
    },	
	[2025] = { -- Thaldraszus
	    [64851655] = ({
            label = L["Surveyor's Magnifying Glass"],
            cont = true,
			quest = 70610,
            Zamro = true,
            note = L["Surveyor's Magnifying Glass Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\chest.tga",
        }),
	    [58168007] = ({
            label = L["Sandy Wooden Duck"],
            cont = true,
			quest = 70608,
            Zamro = true,
            note = L["Sandy Wooden Duck Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\chest.tga",
        }),			
	    [54937543] = ({
            label = L["Yennu's Map"],
            cont = true,
			quest = 70608,
            Zamro = true,
            note = L["Yennu's Map Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\tokens.tga",				
	    }),
    },
    [2339] = { -- Dornogal
        [59175580] = ({
            label = L["Gold"],
            cont = true,		
            Zamro = true,
            note = L["Gold Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\tokens.tga",
        }),
    },
	[2214] = { -- ringing deeps
        [43543524] = ({
            label = L["Gold 2"],
            cont = true,			
            Zamro = true, 			
            note = L["Gold 2 Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\tokens.tga",
        }),	
    },
	[2248] = { -- dorn
        [55185121] = ({
            label = L["Gold 4"],
            cont = true,			
            Zamro = true, 			
            note = L["Gold 4 Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\tokens.tga",
        }),	
    },	
    [2215] = { -- hallowfall
        [18761772] = ({
            label = L["Gold 3"],
            cont = true,				
            Zamro = true,
            note = L["Gold 3 Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\tokens.tga",
        }),	
    },		
    [2200] = { -- Emerald Dream
        [45801860] = {
           label = L["Moltenbinder Disciple"],
           cont = true,
           quest = 77941,
           Zamro = true,
           note = L["Moltenbinder Disciple Note"],
           pathto = "Interface\\Addons\\"..myname.."\\Icons\\fskull.tga",
         },
    },
}
