local Players = game.Players


local DSS = game:GetService("DataStoreService")
local dataStore = DSS:GetDataStore("PortfolioData") -- Change to any DataStore you want to reset or restart Data.

Players.PlayerAdded:Connect(function(plr)
	
	
	local succ, err = pcall(function()
		return dataStore:GetAsync(plr.UserId)
	end)
	
	local newPlayerGUI = plr.PlayerGui:WaitForChild("NewPlayer")
	local welcomePlayer = newPlayerGUI:WaitForChild("NewPlayerFrame"):WaitForChild("NewPlayerWelcome")
	newPlayerGUI.Enabled = false
	
	if succ then
		
		if err == nil then
			print("First time joining!")
			welcomePlayer.Text = "Welcome to the game: " .. plr.DisplayName
			newPlayerGUI.Enabled = true

			script.OfflineTimeToGifts:Fire(plr, 0)
			return
		end
		
		local timeGone = DateTime.now().UnixTimestamp - err
		
		
		script.OfflineTimeToGifts:Fire(plr, timeGone)
	else
		warn(err)
	end
end)

local function savePlayerData(plr)
	dataStore:SetAsync(plr.UserId, DateTime.now().UnixTimestamp)
end

Players.PlayerRemoving:Connect(savePlayerData)

game:BindToClose(function()
	if game["Run Service"]:IsStudio() then task.wait(0.1) return end
	for _, player in pairs(game.Players:GetPlayers()) do
		savePlayerData(player) 
	end
	task.wait(0.1)
end)
	
