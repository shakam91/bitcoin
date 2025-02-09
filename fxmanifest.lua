fx_version 'adamant'
game 'gta5'

-----------------------------------------------
--------------------RageUI---------------------
-----------------------------------------------

client_scripts {
    'src/RageUI/RMenu.lua',
    'src/RageUI/menu/RageUI.lua',
    'src/RageUI/menu/Menu.lua',
    'src/RageUI/menu/MenuController.lua',
    'src/RageUI/components/*.lua',
    'src/RageUI/menu/elements/*.lua',
    'src/RageUI/menu/items/*.lua',
    'src/RageUI/menu/panels/*.lua',
    'src/RageUI/menu/panels/*.lua',
    'src/RageUI/menu/windows/*.lua',
}

-----------------------------------------------
-----------------Client------------------------
-----------------------------------------------

client_scripts {
	"client/*.lua",
}

-----------------------------------------------
--------------------server---------------------
-----------------------------------------------

server_scripts {
    '@mysql-async/lib/MySQL.lua',
	"server/*.lua",
}
