# NUI Coords and Teleport

This script fivem are created for learning about LUA fivem scripts.
I just tried to create an UI with interaction with client or server side to communicate between Javascript and LUA.

## Screenshot
![image](images/hud.png)

## Keybinds
By default, i store keybind in config.lua like this :

```lua
Config.Keybind_Focus = 'MULTIPLY' -- NumericPad *
Config.Keybind_ToggleHUD = 'PAGEDOWN' -- left of numpad7
```

This keybind can be customize from [FiveM Docs](https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/)

## HUD Position
You can customize HUD Position from config file, the list of position available is :

* top-left
* top-right
* bottom-left
* bottom-right
* top-middle