local VisualTracerAnim = require("__visual_tracers_mg__/libs/VisualTracerAnim")

data:extend({
-- Normal Bullet Tracer --
    {
        type = "projectile",
        name = "visual-tracer-projectile-normal",
        flags = {"not-on-map"},
		hit_collision_mask = {layers={water_tile=true}},
        hit_at_collision_position = true,
        acceleration = settings.startup["visual_tracers_mg--acceleration"].value,
        animation = VisualTracerAnim.generate(
			0.8,
			{r = 1, g = 0.8, b = 0.4, a = 0.5},
			1.2,
			{r = 1, g = 0.5, b = 0.2, a = 0.3},
			10
		),
        light = {intensity = 0.5, size = 4, color = {r = 1, g = 0.8, b = 0.4} },
        final_action =
        {
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "create-entity",
						entity_name = "visual-tracer-explosion-hit-normal",
						tile_collision_mask = {layers={water_tile=true}},
					},
					{
						type = "create-entity",
						entity_name = "water-splash",
						tile_collision_mask = {layers={ground_tile=true}},
					},
				},
			},
        },
    },
-- Piercing Bullet Tracer --
    {
        type = "projectile",
        name = "visual-tracer-projectile-piercing",
        flags = {"not-on-map"},
		hit_collision_mask = {layers={water_tile=true}},
        hit_at_collision_position = true,
        acceleration = settings.startup["visual_tracers_mg--acceleration"].value,
        animation = VisualTracerAnim.generate(
			0.8,
			{r = 1, g = 0.6, b = 0.3, a = 0.6},
			1.2,
			{r = 1, g = 0.4, b = 0.2, a = 0.4},
			10
		),
        light = {intensity = 0.6, size = 4, color = {r = 1, g = 0.6, b = 0.3} },
        final_action =
        {
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "create-entity",
						entity_name = "visual-tracer-explosion-hit-piercing",
						tile_collision_mask = {layers={water_tile=true}},
					},
					{
						type = "create-entity",
						entity_name = "water-splash",
						tile_collision_mask = {layers={ground_tile=true}},
					},
				},
			},
        },
    },
-- Uranium Bullet Tracer --
    {
        type = "projectile",
        name = "visual-tracer-projectile-uranium",
        flags = {"not-on-map"},
		hit_collision_mask = {layers={water_tile=true}},
        hit_at_collision_position = true,
        acceleration = settings.startup["visual_tracers_mg--acceleration"].value,
        animation = VisualTracerAnim.generate(
			0.8,
			{r = 0.7, g = 1, b = 0.5, a = 0.6},
			1.2,
			{r = 0.6, g = 1, b = 0.4, a = 0.4},
			10
		),
        light = {intensity = 0.6, size = 4, color = {r = 0.7, g = 1, b = 0.5} },
        final_action =
        {
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "create-entity",
						entity_name = "visual-tracer-explosion-hit-uranium",
						tile_collision_mask = {layers={water_tile=true}},
					},
					{
						type = "create-entity",
						entity_name = "water-splash",
						tile_collision_mask = {layers={ground_tile=true}},
					},
				},
			},
        },
    },
})
