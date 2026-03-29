local plrJoinedEvent = script.Parent.CalculateOfflineTime:WaitForChild("OfflineTimeToGifts")

local mutiplier = 2.5 -- Can easily customize reward mutiplier

local function calculateTime(Time, mutiplier)
	local RewardAmount = Time * mutiplier
	return RewardAmount
end


plrJoinedEvent.Event:Connect(function(plr, offlineTime)
	local reward = plr.PlayerGui:WaitForChild("Rewards")
	reward.Enabled = false
	local timeOffline = reward:WaitForChild("DisplayRewards"):WaitForChild("AmountOfTime")
	local rewardAmount = reward:WaitForChild("DisplayRewards"):WaitForChild("EarnedAmount")
	if offlineTime > 0 then
		reward.Enabled = true
		timeOffline.Text = "You were gone for " .. math.round(offlineTime/60) .. " minutes and " .. offlineTime%60 .. " seconds!"
		rewardAmount.Text = "This means you earned... $" .. math.round(calculateTime(offlineTime, mutiplier)) .. "!"
		
		reward:WaitForChild("DisplayRewards"):WaitForChild("ContinueButton").Activated:Connect(function()
			reward.Enabled = false
		end)
	end
end)
