datastore = game:GetService("DataStoreService"):GetDataStore("Spartan")
--_G["datastore"] = game:GetService("DataStoreService"):GetDataStore("Spartan")

--_G.datastore:SetAsync("sblibrary",{})
datastore:SetAsync("sblibrary",{})
--table.foreach(_G.datastore:GetAsync("sblibrary"),print)
--print(_G.datastore:GetAsync("sblibrary")[1])
function chatevent(player)
player.Chatted:connect(function(message)
local message = message:lower()
if string.find(message,"http") or string.find(message,"https") or string.find(message,"www") or string.find(message,".lua")  then
local oldtab = datastore:GetAsync("sblibrary") or {}
oldtab[#oldtab + 1] = message
datastore:SetAsync("sblibrary",oldtab)
end 
end)	
end

for k,v in pairs(game.Players:GetPlayers()) do
chatevent(v)	
end

game.Players.PlayerAdded:connect(function(player)
chatevent(player)
end)

print("New version is working")
-- Created by AnimeWiki
