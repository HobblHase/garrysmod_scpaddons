if SERVER then AddCSLuaFile("shared.lua") end
SWEP.PrintName = "CC-SWEP"
SWEP.Author = "SCP SWEPS"
SWEP.Purpose = ""
SWEP.Instructions = ""
SWEP.Slot = 0
SWEP.SlotPos = 0
SWEP.DrawCrosshair = false
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.Category = "Hoppl"
SWEP.ViewModel = ""
SWEP.WorldModel = ""
SWEP.ViewModelFlip = true
SWEP.DrawAmmo = false
SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.HoldType = "slam"
SWEP.Primary.Delay = 0.9
SWEP.Primary.Recoil = 0
SWEP.Primary.NumShots = -1
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"
SWEP.Secondary.Delay = 0.9
SWEP.Secondary.NumShots = 1
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
function SWEP:Initialize()
    self.IsJumping = 0
    self.NextJumpTime = 0
end

function SWEP:PrimaryAttack()
    if not self:CanPrimaryAttack() or self.IsJumping == 1 then return end
    self:StartJump()
end

function SWEP:SecondaryAttack()
    if self.IsJumping == 1 then self:EndJump() end
end

function SWEP:Think()
    if self.NextJumpTime == CurTime() then self:EndJump() end
end

function SWEP:StartJump()
    local player = self.Owner
    self.IsJumping = 1
    player:SetMoveType(MOVETYPE_FLY)
    self.NextJumpTime = CurTime() + math.random(3, 4)
    player:SetMaxSpeed(1500)
    player:ConCommand("pp_dof_initlength 9")
    player:ConCommand("pp_dof_spacing 8")
end

function SWEP:EndJump()
    local player = self.Owner
    self.IsJumping = 0
    player:ConCommand("pp_dof 0")
    player:SetVelocity(player:GetForward() * 50 + Vector(0, 0, 200))
    player:SetMoveType(MOVETYPE_WALK)
    player:SetMaxSpeed(200)
end

function SWEP:Deploy()
    local player = self.Owner
    self.OldModel = player:GetModel()
    player:SetModel("models/auditor/r6s/navy/guerilla/pigeon.mdl")
    return true
end

function SWEP:Holster()
    local player = self.Owner
    player:SetModel(self.OldModel)
    return true
end

function SWEP:OnRemove()
    local player = self.Owner
    player:SetModel(self.OldModel)
end
