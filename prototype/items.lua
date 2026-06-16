data:extend({
    {
    type = "item-subgroup",
    name = "packing-chests",
    group = "logistics",
    order = "packing-chests"
    },
    {
    type = "item",
    name = "packer-chest-1",
    icons = {{icon="__pocket_dimension_packing__/graphics/icons/wooden-chest.png",icon_size = 64,tint={r=0.6,g=1,b=0.6}}},
    subgroup = "packing-chests",
    order = "packer-chest-1",
    place_result = "packer-chest-1",
    stack_size = 50
    },
    {
    type = "item",
    name = "unpacker-chest-1",
    icons = {{icon="__pocket_dimension_packing__/graphics/icons/wooden-chest.png",icon_size = 64,tint={r=1,g=0.6,b=1}}},
    subgroup = "packing-chests",
    order = "unpacker-chest-1",
    place_result = "unpacker-chest-1",
    stack_size = 50
    },
    {
    type = "item",
    name = "packer-chest-2",
    icons = {{icon="__pocket_dimension_packing__/graphics/icons/iron-chest.png",icon_size = 64,tint={r=0.6,g=1,b=0.6}}},
    subgroup = "packing-chests",
    order = "packer-chest-2",
    place_result = "packer-chest-2",
    stack_size = 50
    },
    {
    type = "item",
    name = "unpacker-chest-2",
    icons = {{icon="__pocket_dimension_packing__/graphics/icons/iron-chest.png",icon_size = 64,tint={r=1,g=0.6,b=1}}},
    subgroup = "packing-chests",
    order = "unpacker-chest-2",
    place_result = "unpacker-chest-2",
    stack_size = 50
    },
    {
    type = "item",
    name = "packer-chest-3",
    icons = {{icon="__pocket_dimension_packing__/graphics/icons/steel-chest.png",icon_size = 64,tint={r=0.6,g=1,b=0.6}}},
    subgroup = "packing-chests",
    order = "packer-chest-3",
    place_result = "packer-chest-3",
    stack_size = 50
    },
    {
    type = "item",
    name = "unpacker-chest-3",
    icons = {{icon="__pocket_dimension_packing__/graphics/icons/steel-chest.png",icon_size = 64,tint={r=1,g=0.6,b=1}}},
    subgroup = "packing-chests",
    order = "unpacker-chest-3",
    place_result = "unpacker-chest-3",
    stack_size = 50
    },
    {
    type = "item-with-inventory",
    name = "wood-packing-box",
    icons = {{icon="__pocket_dimension_packing__/graphics/icons/wooden-chest.png",icon_size = 64,tint={r=1,g=1,b=0.6}}},
    subgroup = "packing-chests",
    order = "box-1",
    inventory_size = 1,
    stack_size = 1
    },
    {
    type = "item-with-inventory",
    name = "iron-packing-box",
    icons = {{icon="__pocket_dimension_packing__/graphics/icons/iron-chest.png",icon_size = 64,tint={r=1,g=1,b=0.6}}},
    subgroup = "packing-chests",
    order = "box-2",
    inventory_size = 3,
    stack_size = 1
    },
    {
    type = "item-with-inventory",
    name = "steel-packing-box",
    icons = {{icon="__pocket_dimension_packing__/graphics/icons/steel-chest.png",icon_size = 64,tint={r=1,g=1,b=0.6}}},
    subgroup = "packing-chests",
    order = "box-3",
    inventory_size = 10,
    stack_size = 1
    },
})

