-- written by HOPPL
-- Simple SCP:RP Hazmat script that nerfs the immune of hazmat with 20% more damage and u walk slower
hook.Add(
    "EntityTakeDamage",
    "hoppl_haz_damage_multiplier",
    function(target, dmginfo)
        local ply = target
        for k, v in pairs( player.GetAll() ) do
        if v:IsPlayer() and v:IsValid() and not v:IsBot() and v:Alive() then
            local PlayerModel = v:GetModel()
            if HOPPL_HAZ_DMG_MULTIPLIER and HOPPL_HAZ_MODELS[PlayerModel] then
                // print("DEBUG: DMGMULTIPLIER") -- only for me
                dmginfo:ScaleDamage(1.20) -- modify here | 1.20 means 120% dmg
            end
        end
      end
    end
)


-- UNFINISHED!! (do not uncomment)
--[[
hook.Add(
    "PlayerSetModel",
    "hoppl_haz_walk_speed",
    function()
        print("Hazmatsuit-Walk HOOK has been triggered!")
        for k, v in pairs( player.GetAll() ) do
        if v:IsPlayer() and v:IsValid() and not v:IsBot() and v:Alive() then
            PlayerModel = v:GetModel()
            if HOPPL_HAZ_WALK_NERF and HOPPL_HAZ_MODELS[PlayerModel] then
                print("DEBUG: SLOWERWALK")
                v:SetWalkSpeed(v:GetWalkSpeed() * 0.15)
                v:SetRunSpeed(v:GetRunSpeed() * 0.15) -- change to 85
                v:SetSlowWalkSpeed(v:GetSlowWalkSpeed() * 0.15)
                --v:SetDuckSpeed(v:GetDuckSpeed() * 0.10)
                v:SetLadderClimbSpeed(v:GetLadderClimbSpeed() * 0.10)
            end
        end
      end
    end
)--]]

print("[HAZMAT] SV-LOADED")
