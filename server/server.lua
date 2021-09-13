ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

print("^4[ ^2IP Export Log^4 ] ^3Started Successfully^0")

RegisterServerEvent('export-ip:print')
AddEventHandler('export-ip:print', function(param)

      local xAll = ESX.GetPlayers()
      for i=1, #xAll, 1 do
            local xPlayer = ESX.GetPlayerFromId(xAll[i])
            local ip = GetPlayerIdentifiers(xAll[i])[7]
            local INFO = "[ ID : "..xPlayer.source.." | Name : "..xPlayer.getName().."  | IP : ".. ip .." ]\n"
            local PRINTINFO = "^4[ ^2ID : ^3"..xPlayer.source.." ^0| ^2Name : ^3"..xPlayer.getName().." ^0 | ^2IP : ^3".. ip .." ^4]^0\n"
            
            print(PRINTINFO)

      end

end)

ESX.RegisterServerCallback("export-ip:fetchUserRank", function(source, cb)
      local player = ESX.GetPlayerFromId(source)
  
      if player ~= nil then
          local playerGroup = player.getGroup()
  
          if playerGroup ~= nil then 
              cb(playerGroup)
          else
              cb("user")
          end
      else
          cb("user")
      end
  end)

RegisterServerEvent('export-ip:save')
AddEventHandler('export-ip:save', function(param)
      
      function SaveFile(filepath, content)
            file = io.open(filepath, "a")
            io.output(file)
            io.write(content)
            io.close(file)
      end
      

            local xAll = ESX.GetPlayers()
            for i=1, #xAll, 1 do
                  local xPlayer = ESX.GetPlayerFromId(xAll[i])
                  local ip = GetPlayerIdentifiers(xAll[i])[7]
                  local INFO = "[ ID : "..xPlayer.source.." | Name : "..xPlayer.getName().."  | IP : ".. ip .." ]\n"
                                    
                  local filepath = GetResourcePath(GetCurrentResourceName()) .. "/ip.txt"
                  SaveFile(filepath, "[--- " .. os.date() .. " ---]\n\n" .. INFO)
                  TriggerClientEvent('esx:showNotification', source, 'File saved as ~g~ip.txt')
                  print("^4[ ^2IP Export Log^4 ] ^3File saved as ^2ip.txt^0")
                  
            end
end)




