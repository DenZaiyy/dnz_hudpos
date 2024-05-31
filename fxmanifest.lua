fx_version 'cerulean'
game 'gta5'
lua54 'yes'

-- Infos
author 'DenZaiyy'
description 'A simple NUI made by DenZaiyy'
version '1.0.0'

-- Shared Scripts
shared_script {
    '@es_extended/imports.lua',
    '@es_extended/locale.lua',
    'config.lua',
    'locales/*.lua',
}

-- Client Scripts
client_scripts {
    'client/client.lua'
}

-- NUI
ui_page 'nui/nui.html'

files {
    'nui/nui.html',
    'nui/styles.css',
    'nui/script.js',
    'nui/images/*',
}
