local state = false
local openHud = false
ESX = exports["es_extended"]:getSharedObject()

--
-- Function Toggle Position
--
local function togglePosition()
    if not state then
        CreateThread(function()
            while state == true do
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
                    state = state,
                    hudPosition = Config.HUD_Position
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

--
-- Function Focus HUD
--
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
        -- ESX.ShowNotification(TranslateCap('hud_need_openned'), 'error')
        ESX.ShowNotification('HUD need to be opened', 'error')
    end
end

--
-- NUI Callbacks
--
RegisterNUICallback('releaseFocus', function(data, cb)
    if data.error then
        togglePosition()
        ESX.ShowNotification(data.error, 'error')
    end
    openHud = not openHud
    SetNuiFocus(false, false)
end)

RegisterNUICallback('teleport', function(data, cb)
    ExecuteCommand('focusHUD')
    SetEntityCoords(PlayerPedId(), tonumber(data.x), tonumber(data.y), tonumber(data.z))
end)

--
-- Key Bindings
--
if Config.Enable_Command then
    RegisterCommand('focusHUD', function()
        focusHUD()
    end)
    RegisterKeyMapping('focusHUD', TranslateCap('focus_hud_key_description'), 'keyboard', Config.Keybind_Focus)


    RegisterCommand('togglePosition', function()
        togglePosition()
    end)
    RegisterKeyMapping('togglePosition', TranslateCap('toggle_hud_key_description'), 'keyboard', Config
        .Keybind_ToggleHUD)
end
