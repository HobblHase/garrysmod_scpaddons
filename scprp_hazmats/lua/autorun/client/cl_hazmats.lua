-- written by HOPPL
-- Simple SCP:RP Hazmat script that nerfs the immunity of hazmat with 20% more damage

if CLIENT then
    local function HazmatColorEffect()
        local ply = LocalPlayer()

        local clrs = { -- Preset from https://github.com/OverlordAkise
            ["$pp_colour_addr"] = 0.00,
            ["$pp_colour_addg"] = 0.43,
            ["$pp_colour_addb"] = 0,
            ["$pp_colour_brightness"] = 0,
            ["$pp_colour_contrast"] = 1,
            ["$pp_colour_colour"] = 1,
            ["$pp_colour_mulr"] = 0,
            ["$pp_colour_mulg"] = 0,
            ["$pp_colour_mulb"] = 0
        }
        if ply and ply:Alive() and HOPPL_HAZ_VISION and HOPPL_HAZ_MODELS[ply:GetModel()] then
            // print("DEBUG: HAZMATVIEW") --only for me
            DrawColorModify(clrs)
        end
    end

    hook.Add("RenderScreenspaceEffects", "hoppl_haz_player_vision", HazmatColorEffect)

    print("[HAZMATS] CL-LOADED")
end
