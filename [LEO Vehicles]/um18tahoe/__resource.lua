resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'
-- THIS RESOURCE FILE IS SETUP TO WORK WITHOUT A DATA FOLDER FOR THE METAS AND WILL NOT WORK IF YOU PUT THE METAS IN A DATA FOLDER! FROM TN STUDIOS. --
files {
    'vehicles.meta',
    'carvariations.meta',
    'carcols.meta',
    'handling.meta',
    'vehiclelayouts.meta',  
}

data_file 'HANDLING_FILE' 'handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'vehiclelayouts.meta'   -- Not Required


client_script {
    'veh_names.lua'    -- Not Required
}