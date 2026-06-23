--- Initialize the storage and register all of our entities on the map. If settings change, register them again.

local function init_storage()
    local magic_chest = game.create_inventory(4)
    local free = magic_chest[1]
    local wood = magic_chest[2]
    local iron = magic_chest[3]
    local steel = magic_chest[4]

    wood.set_stack("wood-packing-box")
    iron.set_stack("iron-packing-box")
    steel.set_stack("steel-packing-box")

    storage.ChestPool = {}
    storage.ProcessingQueue = {}
    storage.Magic = {chest=magic_chest,slots={free=free,wood=wood,iron=iron,steel=steel}}
end

local function init_entities()
    local clock = game.tick
    local i = 1
    local spread = settings.global["pii-spreader"].value
    local chestPool = {}
    local processingQueue = {}

    for _, surface in pairs(game.surfaces) do
        local chests = surface.find_entities_filtered{name ={
                "packer-chest-1",
                "packer-chest-2",
                "packer-chest-3",
                "unpacker-chest-1",
                "unpacker-chest-2",
                "unpacker-chest-3"
            }}

        for _, chest in pairs(chests) do
            local id = chest.unit_number
            if id == nil then
                goto continue
            end
            local now = processingQueue[clock+i]
            if now == nil then
                processingQueue[clock+i] = {}
                now = processingQueue[clock+i]
            end

            chestPool[id] = chest
            now[#now+1]=id
            i = (i+1) % spread

            ::continue::
        end
    end

    storage.ChestPool = chestPool
    storage.ProcessingQueue = processingQueue
end



script.on_init(function()
    init_storage()
    init_entities()
end)

local function reorganize(event)
    if event.setting == "pii-spreader" then init_entities() end
end

script.on_event(defines.events.on_runtime_mod_setting_changed, reorganize)



--- Keep track of all of our entities

local function OnEntityCreated(event)
    if event.effect_id ~= "pii-built-entity" then return end
    local entity = event.target_entity
    if not (entity and entity.valid) then return end
    local id = entity.unit_number
    local clock = event.tick + 1
    local future = storage.ProcessingQueue[clock]
    if future == nil then
        storage.ProcessingQueue[clock]={}
        future = storage.ProcessingQueue[clock]
    end

    storage.ChestPool[id] = entity
    future[#future+1]=id
end

script.on_event(defines.events.on_script_trigger_effect, OnEntityCreated)



--- Update our entities

local function pack_item(chest,slots,magic)
    local inventory = chest.get_inventory(defines.inventory.chest)

    if not inventory.is_full() then
        return
    end

    local box = magic.slots.free
    if slots == 1 then
        local item = inventory[1]
        if item.name == "wood-packing-box" then
            return
        end

        box.set_stack(magic.slots.wood)
    elseif slots == 3 then
        box.set_stack(magic.slots.iron)
    elseif slots == 10 then
        box.set_stack(magic.slots.steel)
    end

    local pocket_dimension = box.get_inventory(defines.inventory.item_main)
    for i = 1,slots do
        pocket_dimension[i].transfer_stack(inventory[i])
    end

    inventory[1].transfer_stack(box)
end

local function unpack_item(chest,slots,magic)
    local inventory = chest.get_inventory(defines.inventory.chest)
    local item = inventory[1]
    if not item.valid_for_read then
        return
    end

    local name = item.name
    if not ((name == "wood-packing-box"  and slots == 1) or
            (name == "iron-packing-box"  and slots == 3) or
            (name == "steel-packing-box" and slots == 10)) then
        return
    end

    if slots > 1 then
        for i = 2,slots do
            if inventory[i].valid_for_read then return end
        end
    end

    local box = magic.slots.free
    box.transfer_stack(item)
    local pocket_dimension = box.get_inventory(defines.inventory.item_main)
    for i = 1,slots do
        inventory[i].transfer_stack(pocket_dimension[i])
    end
    box.clear()
end



local function on_tick(event)
    local clock = event.tick
    local stored = storage
    local queue = stored.ProcessingQueue
    local now = queue[clock]

    if now ~= nil then
        local spread = settings.global["pii-spreader"].value
        local magic = stored.Magic
        local future = queue[clock + spread]
        if future == nil then
            queue[clock + spread] = {}
            future = queue[clock + spread]
        end
        local index = #future

        for _, id in pairs(now) do
            local chest = stored.ChestPool[id]

            if chest and chest.valid then
                index = index + 1
                future[index]=id
                local name = chest.name

                if name == "packer-chest-1" then
                    pack_item(chest,1,magic)
                elseif name == "unpacker-chest-1" then
                    unpack_item(chest,1,magic)
                elseif name == "packer-chest-2" then
                    pack_item(chest,3,magic)
                elseif name == "unpacker-chest-2" then
                    unpack_item(chest,3,magic)
                elseif name == "packer-chest-3" then
                    pack_item(chest,10,magic)
                elseif name == "unpacker-chest-3" then
                    unpack_item(chest,10,magic)
                end
                
            else
                stored.ChestPool[id] = nil
            end
        end

        queue[clock] = nil
    end
end



script.on_event(defines.events.on_tick, on_tick)
