
-- written by HOPPL
-- Simple SCP:RP Hazmat script that nerfs the immune of hazmat with 5% more damage and u walk slower


-- CONFIG

HOPPL_HAZ_MODELS = {
	--[""] = true,
	--[""] = true,
	--[""] = true,
	--[""] = true,
	--[""] = true,
	--[""] = true,
	["models/player/gman_high.mdl"] = true -- TEST
}

HOPPL_HAZ_DMG_MULTIPLIER 	= true
HOPPL_HAZ_WALK_NERF			= true
HOPPL_HAZ_VISION			= true

-- CONFIG END

local HAZ_QUEUE = HOPPL_HAZ_MODELS[PlayerModel]

print("[HAZMAT] SH-LOADED")
