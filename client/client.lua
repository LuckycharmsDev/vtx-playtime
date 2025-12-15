AddEventHandler('ox_inventory:currentWeapon', function(weapon)
    if Config.Debug then print("Weapon event triggered for:", weapon and weapon.name or "none") end
    if weapon then
        if Config.BypassWeapons then
            for _, bypassWeapon in ipairs(Config.BypassWeapons) do
                if weapon.name:upper() == bypassWeapon:upper() then
                    if Config.Debug then print("Weapon bypassed:", weapon.name) end
                    return
                end
            end
        end
        if Config.Debug then print("Triggering server check for weapon:", weapon.name) end
        TriggerServerEvent('engineer-playtime:checkWeapon', weapon)
    end
end)

RegisterNetEvent('engineer-playtime:removeWeapon')
AddEventHandler('engineer-playtime:removeWeapon', function()
    local ped = PlayerPedId()
    RemoveAllPedWeapons(ped, true)
end)