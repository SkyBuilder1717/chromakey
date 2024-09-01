local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local S = minetest.get_translator(modname)
chromakey = {
    registered_chromakeys = {},
	colors = {
		{"white",      "White"},
		{"grey",       "Grey"},
		{"dark_grey",  "Dark Grey"},
		{"black",      "Black"},
		{"violet",     "Violet"},
		{"blue",       "Blue"},
		{"dark_cyan",  "Dark Cyan"},
		{"cyan",       "Cyan"},
		{"navajo_white","Navajo White"},
		{"dark_green", "Dark Green"},
		{"green",      "Green"},
		{"medium_spring_green", "Medium Spring Green"},
		{"lime",       "Lime"},
		{"yellow",     "Yellow"},
		{"olive",      "Olive"},
		{"brown",      "Brown"},
		{"orange",     "Orange"},
		{"red",        "Red"},
		{"magenta",    "Magenta"},
		{"pink",       "Pink"},
	}
}
dofile(modpath.."/api.lua")

for _, row in ipairs(chromakey.colors) do
	local name = row[1]
	local description = row[2]
	chromakey.register_block("chromakey:"..name, {
		color = S(description)
	})
end