local kl = require("__klib__.klib")

local created_eff =
{
    type = "direct",
    action_delivery = {
        type = "instant",
        target_effects = {
            {type = "script", effect_id = "pii-built-entity"}
        }
    }
}

local packer_1 = {name="packer-chest-1",minable={result="packer-chest-1"},inventory_type="with_custom_stack_size",
    inventory_properties={stack_size_multiplier=0.5},inventory_size=1,created_effect=created_eff,picture={layers={[1]={filename="__pocket_dimension_packing__/graphics/entity/wooden-chest.png",tint={r=0.6,g=1,b=0.6}}}}}
local unpacker_1 = {name="unpacker-chest-1",minable={result="unpacker-chest-1"},inventory_type="with_custom_stack_size",
    inventory_properties={stack_size_multiplier=0.5},inventory_size=1,created_effect=created_eff,picture={layers={[1]={filename="__pocket_dimension_packing__/graphics/entity/wooden-chest.png",tint={r=1,g=0.6,b=1}}}}}
local packer_2 = {name="packer-chest-2",minable={result="packer-chest-2"},inventory_size=3,created_effect=created_eff,picture={layers={[1]={filename="__pocket_dimension_packing__/graphics/entity/iron-chest.png",tint={r=0.6,g=1,b=0.6}}}}}
local unpacker_2 = {name="unpacker-chest-2",minable={result="unpacker-chest-2"},inventory_size=3,created_effect=created_eff,picture={layers={[1]={filename="__pocket_dimension_packing__/graphics/entity/iron-chest.png",tint={r=1,g=0.6,b=1}}}}}
local packer_3 = {name="packer-chest-3",minable={result="packer-chest-3"},inventory_size=10,created_effect=created_eff,picture={layers={[1]={filename="__pocket_dimension_packing__/graphics/entity/steel-chest.png",tint={r=0.6,g=1,b=0.6}}}}}
local unpacker_3 = {name="unpacker-chest-3",minable={result="unpacker-chest-3"},inventory_size=10,created_effect=created_eff,picture={layers={[1]={filename="__pocket_dimension_packing__/graphics/entity/steel-chest.png",tint={r=1,g=0.6,b=1}}}}}

kl.qmeld("container","wooden-chest",packer_1)
kl.qmeld("container","wooden-chest",unpacker_1)
kl.qmeld("container","iron-chest",packer_2)
kl.qmeld("container","iron-chest",unpacker_2)
kl.qmeld("container","steel-chest",packer_3)
kl.qmeld("container","steel-chest",unpacker_3)
