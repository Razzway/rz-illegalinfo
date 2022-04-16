---@author Razzwaay
---@version 1.0

ESX = nil

if _Config.calif then
    TriggerEvent(_Config.califPrefix.. _Config.getESX, function(object) ESX = object end)
else
    TriggerEvent(_Config.getESX, function(object) ESX = object end)
end

RegisterServerEvent('rz-illegalinfo:buyInfo')
AddEventHandler('rz-illegalinfo:buyInfo', function(price, pos)
    local xPlayer = ESX.GetPlayerFromId(source)
    if _Config.calif then
        if xPlayer.getAccount('cash').money >= price then
            xPlayer.removeAccountMoney('cash', price)
            TriggerClientEvent('rz-illegalinfo:setNewWaypoint', source, pos)
            TriggerClientEvent(_Config.califPrefix..'esx:showAdvancedNotification', source, 'Julio', '~r~Paiement~s~', ('Vous avez payé %s ~g~$~s~'):format(price), 'CHAR_MP_JULIO')
            TriggerClientEvent(_Config.califPrefix..'esx:showAdvancedNotification', source, 'Julio', '~r~Message~s~', 'Je t\'ai mis le point sur ton GPS, fait gaffe à toi sur la route !', 'CHAR_MP_JULIO')
        else
            TriggerClientEvent(_Config.califPrefix..'esx:showNotification', source, "~r~Il semblerait que vous ne possédiez pas l'argent nécessaire.")
        end
    else
        if xPlayer.getMoney() >= price then
            xPlayer.removeMoney(price)
            TriggerClientEvent('rz-illegalinfo:setNewWaypoint', source, pos)
            TriggerClientEvent('esx:showAdvancedNotification', source, 'Julio', '~r~Paiement~s~', ('Vous avez payé %s ~g~$~s~'):format(price), 'CHAR_MP_JULIO')
            TriggerClientEvent('esx:showAdvancedNotification', source, 'Julio', '~r~Message~s~', 'Je t\'ai mis le point sur ton GPS, fait gaffe à toi sur la route !', 'CHAR_MP_JULIO')
        else
            TriggerClientEvent('esx:showNotification', source, "~r~Il semblerait que vous ne possédiez pas l'argent nécessaire.")
        end
    end
end)