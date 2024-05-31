local state = false
local openHud = false
ESX = exports["es_extended"]:getSharedObject()
--
-- Function Toggle Position
--

local function togglePosition()
    if not state then
        CreateThread(function()
            while true do
                Wait(0)

                local playerId = PlayerPedId()
                local playerCoords = GetEntityCoords(playerId)
                local playerHeading = GetEntityHeading(playerId)

                SendNUIMessage({
                    type = 'position',
                    x = playerCoords.x,
                    y = playerCoords.y,
                    z = playerCoords.z,
                    heading = playerHeading,
                    state = state
                })
            end
        end)
        state = not state
        openHud = not openHud
    else
        SendNUIMessage({
            state = state
        })
        state = not state
        openHud = not openHud
    end
end

local function focusHUD()
    if state then
        if openHud then
            SetNuiFocus(true, true)
            openHud = not openHud
        else
            SetNuiFocus(false, false)
            openHud = not openHud
        end
    else
        ESX.ShowNotification(TranslateCap('hud_need_openned'), 'error')
    end
end

--
-- NUI Callbacks
--

RegisterNUICallback('releaseFocus', function(data, cb)
    cb({})
    openHud = not openHud
    SetNuiFocus(false, false)
end)

RegisterNUICallback('teleport', function(data, cb)
    cb({})

    SetEntityCoords(PlayerPedId(), tonumber(data.x), tonumber(data.y), tonumber(data.z))
end)

--
-- Key Bindings
--

RegisterCommand('focusHUD', function()
    focusHUD()
end, true)

RegisterKeyMapping('focusHUD', 'Focus NUI for position panel', 'keyboard', 'DIVIDE')


RegisterCommand('togglePosition', function()
    togglePosition()
end, true)

RegisterKeyMapping('togglePosition', 'Toggle position HUD', 'keyboard', 'PAGEDOWN')
