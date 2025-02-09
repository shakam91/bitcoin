ESX = nil
TriggerEvent("esx:getSharedObject", function(obj)
	ESX = obj
end)


local open = false 
local mainMenu = RageUI.CreateMenu(" ", "Bitcoin", X, Y, "menu", "menu")
mainMenu.Display.Header = true 
mainMenu.Closed = function()
  open = false
end



function OpenMenuBitcoin()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
			RageUI.IsVisible(mainMenu,function() 
				RageUI.Info("Récolte de ~y~bitcoins", {"Temps de récolte (unité)", "Prix du bitcoin (unité)"}, {"~y~17s", "~y~235$"})

                RageUI.Separator('')


			RageUI.Button("Commencer le traitement des ~y~bitcoins", nil, {RightLabel = "→"},  true , {
				onSelected = function()
					FreezeEntityPosition(PlayerPedId(), true)
					starttraitbit()
				end
			})

			RageUI.Button("Stopper le traitement des ~y~bitcoins", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					stoptraitbit()
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
				end
			})

            RageUI.Separator('')
            RageUI.Line()
            RageUI.Separator('')

            RageUI.Button("Point GPS de la vente", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					SetNewWaypoint(-667.69, -855.42, 24.43) 
					RageUI.CloseAll()
				end
			})


			end)
		Wait(0)
		end
	end)
  	end
end


function stoptraitbit()
    if traitebit then
    	traitebit = false
    end
end

function starttraitbit()
    if not traitebit then
        traitebit = true
    while traitebit do
        Citizen.Wait(17000)
        TriggerServerEvent('traitementdebitcoin')
    end
    else
        traitebit = false
    end
end






local position = {
	{x = 1274.21, y = -1711.17, z = 53.82}
}

Citizen.CreateThread(function()

    while true do

        for k in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)



            if dist <= 8.0 then
            wait = 0
			DrawMarker(23, position[k].x, position[k].y, position[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.5, 0.5, 0.3, 0, 100, 255, 255, false, false, p19, true)   

            if dist <= 2.0 then
               wait = 0
			   	Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ouvrir le ~b~menu", 0) 
                   
                if IsControlJustPressed(1,51) then
					OpenMenuBitcoin()
            	end
            end
        end
    	Citizen.Wait(2)
    end
end
end)


CreateThread(function ()
    for k in pairs(position) do
    local blip = AddBlipForCoord(position[k].x, position[k].y, position[k].z)

    SetBlipSprite(blip, 431)
    SetBlipScale (blip, 0.6)
    SetBlipColour(blip, 28)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Bitcoin')
    EndTextCommandSetBlipName(blip)
    end
end)














local mainMenu2 = RageUI.CreateMenu(" ", "Vente de bitcoin", X, Y, "menu", "menu")
mainMenu2.Display.Header = true 
mainMenu2.Closed = function()
  open = false
end



function OpenMenuBitcoinVente()
	if open then 
		open = false
		RageUI.Visible(mainMenu2, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu2, true)
		CreateThread(function()
		while open do 
			RageUI.IsVisible(mainMenu2,function() 

                RageUI.Separator('')


			RageUI.Button("Commencer la vente de ~y~bitcoin", nil, {RightLabel = "→"}, true , {
				onSelected = function()
					startventebit()
					FreezeEntityPosition(PlayerPedId(), true)
				end
			})

			RageUI.Button("Stopper la vente de ~y~bitcoin", nil, {RightLabel = "→"}, true, {
				onSelected = function()
					stopventebit()
					FreezeEntityPosition(PlayerPedId(), false)
					RageUI.CloseAll()
				end
			})


			end)
		Wait(0)
		end
	end)
  	end
end





function stopventebit()
    if ventepossiblebitcoin then
    	ventepossiblebitcoin = false
    end
end

function startventebit()
    if not ventepossiblebitcoin then
        ventepossiblebitcoin = true

    while ventepossiblebitcoin do
            Citizen.Wait(5000)
            TriggerServerEvent('ventebitcoin')

		end
    else
        ventepossiblebitcoin = false
    end
end

local position2 = {
	{x = -667.69, y = -855.42, z = 23.36}
}

Citizen.CreateThread(function()

    while true do

        for k in pairs(position2) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position2[k].x, position2[k].y, position2[k].z)



            if dist <= 8.0 then
            wait = 0
			DrawMarker(23, position2[k].x, position2[k].y, position2[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.5, 0.5, 0.3, 0, 100, 255, 255, false, false, p19, true)   

            if dist <= 2.0 then
               wait = 0
			   	Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ouvrir le ~b~menu", 0) 
                   
                if IsControlJustPressed(1,51) then
					OpenMenuBitcoinVente()
            	end
            end
        end
    	Citizen.Wait(2)
    end
end
end)