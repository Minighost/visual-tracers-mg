local NTH_ROUND = settings.startup["visual_tracers_mg--nth_round"].value
local SPEED = settings.startup["visual_tracers_mg--speed"].value
local SPEED_DEVIATION = settings.startup["visual_tracers_mg--speed_deviation"].value
local DIRECTION_DEVIATION = settings.startup["visual_tracers_mg--direction_deviation"].value
local RANGE = settings.startup["visual_tracers_mg--range"].value
local RANGE_DEVIATION = settings.startup["visual_tracers_mg--range_deviation"].value

script.on_init(function()
    storage.shot_counts = {}
end)

local function remove_counter(event)
    local entity = event.entity
    if entity and entity.unit_number then
        storage.shot_counts[entity.unit_number] = nil
    end
end

script.on_event(defines.events.on_entity_died, remove_counter)
script.on_event(defines.events.on_player_mined_entity, remove_counter)
script.on_event(defines.events.on_robot_mined_entity, remove_counter)

script.on_event(defines.events.on_script_trigger_effect, function(event)
    target_events = {
        ["visual-tracer-projectile-normal"] = 1,
        ["visual-tracer-projectile-piercing"] = 1,
        ["visual-tracer-projectile-uranium"] = 1
    }
    if not target_events[event.effect_id] then return end

    local shooter = event.source_entity
    if not shooter or not shooter.valid then return end

    local unit_number = shooter.unit_number
    if not unit_number then return end

    local count = (storage.shot_counts[unit_number] or 0) + 1
    storage.shot_counts[unit_number] = count

    if count % NTH_ROUND ~= 0 then return end

    storage.shot_counts[unit_number] = 0

    local tracer = event.effect_id

    local target = event.target_entity
    if not target or not target.valid then return end

    shooter.surface.create_entity {
        name = tracer,
        position = shooter.position,
        source = shooter.position,
        target = target.position,
        force = shooter.force,
        speed = SPEED + (math.random() * 2 - 1) * SPEED_DEVIATION,
        max_range = RANGE + (math.random() * 2 - 1) * RANGE_DEVIATION * RANGE,
    }
end)
