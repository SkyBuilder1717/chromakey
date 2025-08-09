local modname = core.get_current_modname()
local modpath = core.get_modpath(modname)
local S = core.get_translator(modname)

core.register_node("chromakey:chroma", {
	description = S("Chroma block"),
	tiles = {"chromakey_white.png"},
	groups = {cracky = 1, ud_param2_colorable = 1},
	paramtype = "light",
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	light_source = core.LIGHT_MAX,
	on_dig = unifieddyes.on_dig
})

core.register_craft({
	output = "chromakey:chroma 4",
	recipe = {
		{"dye:white", "default:glass", "dye:white"},
		{"default:glass", "default:torch", "default:glass"},
		{"dye:white", "default:mese_crystal", "dye:white"},
	},
})
