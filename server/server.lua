ESX = nil
TriggerEvent("esx:getSharedObject", function(obj)
	ESX = obj
end)



RegisterNetEvent('traitementdebitcoin')
AddEventHandler('traitementdebitcoin', function()
    local item = "bitcoin"
    local limiteitem = 100
    local xPlayer = ESX.GetPlayerFromId(source)
    local nbitemdansinventaire = xPlayer.getInventoryItem(item).count

    if nbitemdansinventaire >= limiteitem then
        TriggerClientEvent('esx:showNotification', source, "Tu n'a plus de place dans ton inventaire !")
        traitebit = false
    else
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, "Traitement de ~y~BitCoin~s~ en cours...")
		return
    end
end)



RegisterNetEvent('ventebitcoin')
AddEventHandler('ventebitcoin', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local bitcoinss = xPlayer.getInventoryItem('bitcoin').count
    
    if bitcoinss < 1 then
        TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez plus de ~y~Bitcoin~s~ à vendre...') 
    else
        xPlayer.removeInventoryItem('bitcoin', 1)
        xPlayer.addAccountMoney('money', 235)
        TriggerClientEvent('esx:showNotification', source, 'Vous avez vendu 1 ~y~BitCoin~s~ pour ~g~235$')
    end
end)