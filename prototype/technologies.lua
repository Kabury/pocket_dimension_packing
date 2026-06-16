local kl = require("__klib__.klib")

kl.qtech("packing-chests-1",50,1,{pi={"__pocket_dimension_packing__/graphics/icons/wooden-chest.png",64,0.6,1,0.6,1},pre={"logistics"},eff={"packer-chest-1","unpacker-chest-1"},t=true})
kl.qtech("packing-chests-2",200,2,{pi={"__pocket_dimension_packing__/graphics/icons/iron-chest.png",64,0.6,1,0.6,1},pre={"logistics-2","packing-chests-1"},eff={"packer-chest-2","unpacker-chest-2"},t=true})
kl.qtech("packing-chests-3",500,3,{pi={"__pocket_dimension_packing__/graphics/icons/steel-chest.png",64,0.6,1,0.6,1},pre={"logistics-3","packing-chests-2"},eff={"packer-chest-3","unpacker-chest-3"},t=true})