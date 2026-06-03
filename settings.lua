data:extend({
	{
		type = "string-setting",
		name = "visual_tracers--ammo_categories",
		description = "visual_tracers--ammo_categories",
		setting_type = "startup",
		default_value = "bullet",
		allow_blank = true,
		order = "a1",
		per_user = false
	},
	{
		type = "int-setting",
		name = "visual_tracers_mg--nth_round",
		setting_type = "startup",
		default_value = 3,
		minimum_value = 0,
		maximum_value = 20,
		order = "a2",
		per_user = false
	},
	{
		type = "double-setting",
		name = "visual_tracers--speed",
		setting_type = "startup",
		default_value = 1.0,
		minimum_value = 0.5,
		maximum_value = 2.0,
		order = "a3",
		per_user = false
	},
	{
		type = "double-setting",
		name = "visual_tracers--speed_deviation",
		setting_type = "startup",
		default_value = 0.20,
		minimum_value = 0.0,
		maximum_value = 1.0,
		order = "a4",
		per_user = false
	},
	{
		type = "double-setting",
		name = "visual_tracers--direction_deviation",
		setting_type = "startup",
		default_value = 0.15,
		minimum_value = 0.0,
		maximum_value = 1.0,
		order = "a5",
		per_user = false
	},
	{
		type = "double-setting",
		name = "visual_tracers--range",
		setting_type = "startup",
		default_value = 30,
		minimum_value = 10,
		maximum_value = 100,
		order = "a6",
		per_user = false
	},
	{
		type = "double-setting",
		name = "visual_tracers--range_deviation",
		setting_type = "startup",
		default_value = 0.15,
		minimum_value = 0.0,
		maximum_value = 1.0,
		order = "a7",
		per_user = false
	},
	{
		type = "double-setting",
		name = "visual_tracers--acceleration",
		setting_type = "startup",
		default_value = 0.0,
		minimum_value = -0.1,
		maximum_value = 0.1,
		order = "a8",
		per_user = false
	},
})
