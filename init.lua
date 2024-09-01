local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local S = minetest.get_translator(modname)
chromakey = {
    registered_chromakeys = {}
}

minetest.register_node("chromakey:chroma", {
	description = S("Chroma block"),
	tiles = {"chromakey_white.png"},
	groups = {cracky = 1, ud_param2_colorable = 1},
	paramtype = "light",
	paramtype2 = "color",
	palette = "unifieddyes_palette_extended.png",
	light_source = minetest.LIGHT_MAX,
	on_dig = unifieddyes.on_dig
})