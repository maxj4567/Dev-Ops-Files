fx_version 'bodacious'
games { 'gta5' }

author 'London Studios'
description 'A resource providing a realistic decontamination tent experience'
version '1.0.0'
lua54 'yes'

files {
    'stream/decon_tent.ytyp',
}

client_scripts {
    'cl_utils.lua',
    'cl_decontent.lua',
}

server_scripts {
    'sv_decontent.lua',
}

escrow_ignore {
    'stream/**',
    'cl_utils.lua',
    'sv_decontent.lua',
    'config.lua',
}

shared_script 'config.lua'

data_file 'DLC_ITYP_REQUEST' 'stream/decon_tent.ytyp'