local QBCore = exports['qb-core']:GetCoreObject()

local function isRaining()
    return GetRainLevel() >= Config.RainThreshold
end

local function isWearingFlops(ped)
    local d = GetPedDrawableVariation(ped,6)
    for _,idx in ipairs(Config.FlipFlopDrawables) do
        if d==idx then return true end
    end
    return false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.CheckInterval)
        local ped = PlayerPedId()
        if not IsPedInAnyVehicle(ped,false) and isRaining() and isWearingFlops(ped) then
            local speed = GetEntitySpeed(ped)
            if speed > Config.MoveSpeedThreshold then
                if math.random() < Config.SlipChance then
                    local t = math.random(Config.SlipMinTime,Config.SlipMaxTime)
                    SetPedToRagdoll(ped,t,t,0,false,false,false)
                end
            end
        end
    end
end)
