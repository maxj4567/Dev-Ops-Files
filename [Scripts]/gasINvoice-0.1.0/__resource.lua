description 'gasIvoice-TgMrP'

version '0.0.1'

client_scripts {
	'client.js'
}

server_scripts {
	'server.js'
}

ui_page "html/index.html"

files {
  "html/font.wof2",
  "html/index.html",
  "html/listener.js",
  "html/style.css",
  "html/sounds/fuel.wav",
}

dependencies {
  'FRFuel',
  'esx_datastore'
}
