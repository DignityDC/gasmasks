local gasMaskIDs = {36, 38, 46, 129, 130, 166, 175} -- Add the gas mask IDs you want to include in the table

function isWearingGasMask(playerPed)
    local maskIndex = GetPedDrawableVariation(playerPed, 1)

    for _, maskID in ipairs(gasMaskIDs) do
        if maskIndex == maskID then
            return true
        end
    end

    return false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        local playerPed = GetPlayerPed(-1)

        if DoesEntityExist(playerPed) and not IsEntityDead(playerPed) then
            if isWearingGasMask(playerPed) then
                SetEntityProofs(playerPed, false, false, false, false, false, false, true, true, false)
            else
                SetEntityProofs(playerPed, false, false, false, false, false, false, false, false, false)
            end
        end
    end
end)
