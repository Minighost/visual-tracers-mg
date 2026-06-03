local VisualTracerAnim = require("__visual_tracers__/libs/VisualTracerAnim")

local function modifyAmmo (ammo)
	if not ammo then
		return
	end
	
	if not ammo.ammo_type then
		return
	end

	validAmmo = false
	for ammoCategory in settings.startup["visual_tracers--ammo_categories"].value:gmatch("%S+") do
		if ammoCategory == ammo.ammo_category then
			validAmmo = true
		end
	end

	if false == validAmmo then
		return
	end

	local actions = ammo.ammo_type.action
	if actions.type then
		actions = {actions}
	end

	local tracer = "visual-tracer-projectile-normal"
	if string.match(ammo.name, "piercing") then
		tracer = "visual-tracer-projectile-piercing"
	elseif string.match(ammo.name, "uranium") then
		tracer = "visual-tracer-projectile-uranium"
	end

	table.insert(actions,
	{
		type = "direct",
		action_delivery = {
			type = "instant",
			target_effects = {
				{
					type = "script",
					effect_id = tracer
				}
			}
		},
	})
	
	ammo.ammo_type.action = actions
end

for _, prototype in pairs(data.raw["ammo"]) do
	modifyAmmo(prototype)
end

local function modifyShotgun ()
	local pellet = data.raw["projectile"]["shotgun-pellet"]
	if nil ~= pellet then
		pellet.animation = VisualTracerAnim.generate(
		0.8,
		{r = 1, g = 0.8, b = 0.4, a = 0.5},
		1.2,
		{r = 1, g = 0.5, b = 0.2, a = 0.3},
		10
	)
	end

	pellet = data.raw["projectile"]["piercing-shotgun-pellet"]
	if nil ~= pellet then
		pellet.animation = VisualTracerAnim.generate(
			0.8,
			{r = 1, g = 0.6, b = 0.3, a = 0.6},
			1.2,
			{r = 1, g = 0.4, b = 0.2, a = 0.4},
			10
		)
	end
end

modifyShotgun()
