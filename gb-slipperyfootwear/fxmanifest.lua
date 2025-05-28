fx_version 'cerulean'
game       'gta5'

author      'GrossBean'
description 'Slippery FootWear When it Rains'
version     '1.0.0'

-- load config first so it defines a global Config
client_scripts {
    'config.lua',
    'client/main.lua',
}

dependencies {
    'qb-core'
}
