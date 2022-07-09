fx_version 'cerulean'
games { 'gta5' }
author 'London Studios'

lua54 'yes'

client_scripts {
    'cl_smartlaser.lua'
}

server_scripts {
    'sv_smartlaser.lua'
}

escrow_ignore {
    'config.lua',
}

shared_script 'config.lua'
dependency '/assetpacks'