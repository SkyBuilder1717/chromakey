local modname = minetest.get_current_modname()
local S = minetest.get_translator(modname)

local function get_after(str)
    return string.match(str, ":(.+)")
end

function chromakey.register_block(name, def)
    def.groups = {cracky = 1} or def.groups

    local clr = get_after(name)

    defn = {
        description = S("@1 chroma block", def.color),
        tiles = {"chromakey_white.png^[colorize:"..clr:gsub("_", "")},
        groups = def.groups,
        paramtype = "light",
        light_source = 15,
    }

    minetest.register_node(name, defn)
    chromakey.registered_chromakeys[name] = defn

    local dye = "dye:"..clr

    if not (minetest.registered_craftitems[dye]) then
        local groups = {}
	    groups["color_" .. clr] = 1
        
        minetest.register_craftitem(":"..dye, {
            inventory_image = "dye_white.png",
            description = S("@1 @2", def.color, S("dye")),
            color = clr,
            groups = groups
        })
    end
    
    minetest.register_craft({
        output = name.." 4",
        recipe = {
            {dye, "default:glass", dye},
            {"default:glass", "default:torch", "default:glass"},
            {dye, "default:mese_crystal", dye},
        },
    })
end