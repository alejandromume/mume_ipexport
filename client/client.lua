ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('chat:addSuggestion', '/export-ip', 'Export IP from players', {
  { name="print/save", help="Print info by console or save in a file" },
})

function ShowNotification(text)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(text)
  DrawNotification(false, false)
end


RegisterCommand("export-ip", function(source, args)
  ESX.TriggerServerCallback("export-ip:fetchUserRank", function(playerRank)
  
    if playerRank == "admin" or playerRank == "superadmin" or playerRank == "mod" then
      local elements = {}                     

      table.insert(elements, { label = "Print IP of players"})
      table.insert(elements, { label = "Save IP of players"})

        ESX.UI.Menu.CloseAll()

            ESX.UI.Menu.Open(
                'default', GetCurrentResourceName(), 'tpmenu',
                {
                    title    = 'Export IP Script',
                    align    = 'bottom-right',
                    elements = elements

                },        function(data, menu)						--on data selection
                    if data.current.label == "Print IP of players" then
                      
                      TriggerServerEvent("export-ip:print")

                    elseif data.current.label == "Save IP of players" then

                      TriggerServerEvent("export-ip:save")

                    end
                    menu.close()							--close menu after selection
                  end,
                  function(data, menu)
                    menu.close()
                  end
                )
    else
        ShowNotification("~r~No Permissions")
    end
  end)

--[[RegisterCommand("export-ip", function(source, args)
  --TriggerServerEvent('export-ip', table.concat(args, " "))

      local elements = {}                     

      table.insert(elements, { label = "Print IP of players"})
      table.insert(elements, { label = "Save IP of players"})

        ESX.UI.Menu.CloseAll()

            ESX.UI.Menu.Open(
                'default', GetCurrentResourceName(), 'tpmenu',
                {
                    title    = 'Export IP Script',
                    align    = 'bottom-right',
                    elements = elements

                },        function(data, menu)						--on data selection
                    if data.current.label == "Print IP of players" then
                      
                      TriggerServerEvent("export-ip:print")

                    elseif data.current.label == "Save IP of players" then

                      TriggerServerEvent("export-ip:save")

                    end
                    menu.close()							--close menu after selection
                  end,
                  function(data, menu)
                    menu.close()
                  end
                )]]
end)

            