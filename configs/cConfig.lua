---@author Razzway
---@version 1.0
---@class _Config
_Config = {
    calif = false, --> Si vous utilisez la base calif : true | Sinon si esx normal : false
    califPrefix = "::{korioz#0110}::", --> Prefix de vos triggers base calif

    getESX = "esx:getSharedObject", --> Trigger de déclaration ESX | Défaut : esx:getSharedObject
    showBlips = true, --> Afficher ou non les blips sur la carte
    showPed = true, --> Afficher le ped de revente de bitcoin
    scenarioPed = true, --> Animation du ped
    scenarioName = 'WORLD_HUMAN_DRUG_DEALER', --> https://wiki.rage.mp/index.php?title=Scenarios

    Marker = { --> https://docs.fivem.net/docs/game-references/markers/
        Type = 25,
        Size = {0.9, 0.9, 0.9},
        Color = {255, 252, 255},
        Rotation = 0.0,
    },

    position = {
        infoBlip = { --> https://docs.fivem.net/docs/game-references/blips/
            Name = 'Bla bla bla...',
            Sprite = 205,
            Display = 4,
            Scale = 0.8,
            Color = 0,
            Range = true,
        },
        interactionZone = {
            {pos = vector3(-1341.58, -1090.25, 6.93-0.95), pedPos = vector3(-1342.58, -1090.93, 6.93-1), heading = 301.31, pedModel = 'a_m_m_og_boss_01'},
        },
    },

    info = {
        {label = "Récolte de weed", pos = vector3(2238.48, 5577.13, 53.87), price = 1000},
        {label = "Récolte de meth", pos = vector3(2431.74, 4979.59, 45.92), price = 1500},
        -- {label = "Exemple", pos = vector3(0.0.0), price = 2000},
    }
}

_Client = {} or {};
_Client.open = {};
_Arrow = "~c~→~s~ ";