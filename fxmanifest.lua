fx_version 'cerulean'
game 'gta5'
lua54 'yes'

-- Infos
author 'DenZaiyy'
description 'A simple NUI HUD for coords made by DenZaiyy'
version '1.5.0'
repository 'https://github.com/DenZaiyy/dnz_hudpos'

-- Shared Scripts
shared_script {
    '@es_extended/imports.lua',
    '@es_extended/locale.lua',
    'config.lua',
    'locales/*.lua',
}

-- Client Scripts
client_script 'client/client.lua'

-- NUI
ui_page 'web/index.html'

files {
    'web/index.html',
    'web/script.js',
    'web/styles.css',
}
