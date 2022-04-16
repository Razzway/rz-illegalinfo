---@author Razzwaay
---@version 1.0

function _Client.open:infoMenu()
    local infoMenu = RageUI.CreateMenu('Renseignement', 'Quelles infos tu veux ?')

    RageUI.Visible(infoMenu, (not RageUI.Visible(infoMenu)))
    FreezeEntityPosition(PlayerPedId(), true)

    while infoMenu do
        Wait(0)

        RageUI.IsVisible(infoMenu, function()
            RageUI.Line()
            for _,info in pairs(_Config.info) do
                dollars = " ~g~$~s~"
                RageUI.Button(_Arrow.. info.label, nil, {RightLabel = tostring(info.price) ..dollars}, true, {
                    onSelected = function()
                        TriggerServerEvent("rz-illegalinfo:buyInfo", info.price, info.pos)
                    end
                })
            end
        end)

        if not RageUI.Visible(infoMenu) then
            infoMenu = RMenu:DeleteType('infoMenu', true)
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end