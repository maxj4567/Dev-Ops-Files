resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'
 
files {
    '**/vehicles.meta',
    '**/carvariations.meta',
    '**/carcols.meta',
    '**/handling.meta',
    '**/vehiclelayouts_*.meta',
    '**/weaponarchetypes.meta',
    '**/vehicleweapons_*.meta',
    '**/explosion.meta'
}

data_file 'HANDLING_FILE' '**/handling.meta'
data_file 'VEHICLE_METADATA_FILE' '**/vehicles.meta'
data_file 'CARCOLS_FILE' '**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' '**/carvariations.meta'
data_file 'VEHICLE_LAYOUTS_FILE' '**/vehiclelayouts_*.meta'
data_file 'WEAPON_METADATA_FILE' '**/weaponarchetypes.meta'
data_file 'EXPLOSION_INFO_FILE' '**/explosion.meta'
data_file 'WEAPONINFO_FILE' '**/vehicleweapons_*.meta'

client_script {
    'vehicle_names.lua'    
}

