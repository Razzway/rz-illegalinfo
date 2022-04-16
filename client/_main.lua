---@author Razzwaay
---@version 1.0

ESX = nil

CreateThread(function()
    while ESX == nil do
        if _Config.calif then
            TriggerEvent(_Config.califPrefix.. _Config.getESX, function(object) ESX = object end)
        else
            TriggerEvent(_Config.getESX, function(object) ESX = object end)
        end
        Wait(10)
    end

    if _Config.showBlips then
        for _, info in pairs(_Config.position.interactionZone) do
            local blip = AddBlipForCoord(info.pos)
            SetBlipSprite(blip, _Config.position.infoBlip.Sprite)
            SetBlipDisplay(blip, _Config.position.infoBlip.Display)
            SetBlipScale(blip, _Config.position.infoBlip.Scale)
            SetBlipColour(blip, _Config.position.infoBlip.Color)
            SetBlipAsShortRange(blip, _Config.position.infoBlip.Range)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(_Config.position.infoBlip.Name)
            EndTextCommandSetBlipName(blip)
        end
    end

    if _Config.showPed then
        for _, ped in pairs(_Config.position.interactionZone) do
            while (not HasModelLoaded(ped.pedModel)) do
                RequestModel(ped.pedModel)
                Wait(1)
            end
            local nwPed = CreatePed(2, GetHashKey(ped.pedModel), ped.pedPos, ped.heading, 0, 0)
            FreezeEntityPosition(nwPed, 1)
            if _Config.scenarioPed then
                TaskStartScenarioInPlace(nwPed, _Config.scenarioName, 0, false)
            end
            SetEntityInvincible(nwPed, true)
            SetBlockingOfNonTemporaryEvents(nwPed, 1)
            npc = nwPed
        end
    end

    while true do
        local interval = 500

        for _, btc in pairs(_Config.position.interactionZone) do
            local pCoords, interactionPos = GetEntityCoords(PlayerPedId()), btc.pos

            if #(pCoords-interactionPos) < 9.0 then
                interval = 0
                DrawMarker(_Config.Marker.Type, interactionPos, 0, 0, 0, _Config.Marker.Rotation, nil, nil, _Config.Marker.Size[1], _Config.Marker.Size[2], _Config.Marker.Size[3], _Config.Marker.Color[1], _Config.Marker.Color[2], _Config.Marker.Color[3], 170, 0, 1, 0, 0, nil, nil, 0)
            end
            if #(pCoords-interactionPos) < 1.2 then
                ESX.ShowHelpNotification('~r~Informateur~s~ \nAppuyez sur ~INPUT_CONTEXT~ pour intéragir.')
                if IsControlJustReleased(0, 54) and IsPedOnFoot(PlayerPedId()) then
                    PlayAmbientSpeech1(npc, "GENERIC_HI", "SPEECH_PARAMS_FORCE_NORMAL_CLEAR")
                    FreezeEntityPosition(PlayerPedId(), true)
                    Visual.Subtitle(('~r~Julio~s~ : Salut, c\'est toi %s ? On m\'a parlé de toi.'):format(GetPlayerName(PlayerId())), 4000)
                    Wait(4000)
                    Visual.Subtitle('~r~Julio~s~ : Je vends des infos sur les circuits de la ville, voici mes tarifs', 4000)
                    Wait(4000)
                    _Client.open:infoMenu()
                end
            end
        end


        Wait(interval)
    end
end)

RegisterNetEvent('rz-illegalinfo:setNewWaypoint')
AddEventHandler('rz-illegalinfo:setNewWaypoint', function(pos)
    SetNewWaypoint(pos)
end)