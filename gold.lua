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
    -- [2023] = 0, -- Ohn'ahran Plains
    -- [2024] = 0, -- The Azure Span
    -- [2085] = 0, -- The Primalist Future
    -- [2025] = 0, -- Thaldraszus
    -- [2200] = 0, -- Emerald Dream
	-- [2133] = 0, -- Zaralek Cavern
}

ns.points = {
    [2022] = { -- The Waking Shores
        [24305559] = ({
            label = L["Obsidian Citadel"],
            cont = true,
            Zamro = true,
            note = L["Obsidian Citadel Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\tokens.tga",
        }),
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
		[47458353] = ({
            label = L["Camp"],
            cont = true,
            Zamro = true,
            note = L["Camp Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\tokens.tga",
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
	[2023] = { -- Ohn'ahran Plains
        [74977068] = ({
            label = L["Fyrakk Assaults"],
            cont = true,
			quest = 75447,  
            Zamro = true,
            note = L["Fyrakk Assaults Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\tokens.tga",
        }),
        [54633715] = ({
            label = L["Arena"],
            cont = true,    
		    Zamro = true,
            note = L["Arena Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\tokens.tga",
        }),
    },
    [2024] = { -- The Azure Span
        [13945012] = ({
            label = L["Community Feast"],
            cont = true,
		    quest = 70893, 			
            Zamro = true,
            note = L["Community Feast Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\tokens.tga",
        }),
	    [55433442] = ({
            label = L["Fyrakk Assaults"],
            cont = true,
		    quest = 75447, 
            Zamro = true,
            note = L["Fyrakk Assaults Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\tokens.tga",
	    }),
    },
    [2085] = { -- The Primalist Future
        [27902580] = {
            label = L["Elemental Bound"],
            cont = true,
			quest = 71995,
            Zamro = true,
            note = L["Elemental Bound Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\chest.tga",
        },
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
	[2025] = { -- Thaldraszus
        [59848221] = ({
            label = L["Elemental Portal"],
            cont = true,
            Zamro = true,
            note = L["Elemental Portal Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\portal.tga",
        }),
	    [60204160] = ({
            label = L["Elegant Canvas Brush"],
            cont = true,
			quest = 70609,
            Zamro = true,
            note = L["Elegant Canvas Brush Note"],
            pathto = "Interface\\Addons\\"..myname.."\\Icons\\chest.tga",
        }),
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
