fx_version 'bodacious'
games { 'gta5' }

author 'London Studios'
description 'A resource providing a realistic weapon lanyard system'
version '1.0.0'
lua54 'yes'

client_scripts {
    'config.lua',
    'cl_lanyard.lua',
}

escrow_ignore {
    'config.lua',
}
dependency '/assetpacks'