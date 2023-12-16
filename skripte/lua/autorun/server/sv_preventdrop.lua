-- a very small script to prevent players from dropping items that are blacklisted e.g. fists
-- Only works with DarkRP

local banned_classes = {
	"weapon_fists"
}

hook.Add("canDropWeapon", "CheckBannedWeapons", function(ply, wep)
    local wepClass = wep:GetClass()

    if table.HasValue(banned_classes, wepClass) then
        DarkRP.notify(ply, 1, 6, "Du darfst diese Waffe nicht wegwerfen!")
        return false
    end
end)

print("[PREVENT-DROP] SV-LOADED")
