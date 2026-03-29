# roblox-offline-earnings
A system that tracks the time when players leave to the time when they rejoin and rewards them based off of that amount of time.


-----
🚀 Features 🚀
-- Tracks when the player leaves the game using DateTime.now().UnixTimestamp
-- Tracks when the player rejoins the game and calculates the rewards for that amount of time
-- Pops up a GUI showing how long the player was gone and the rewards they got


How it works
-- Subtracts the Unix Time Stamp from when the player left to when the rejoined, giving the amount in seconds of how much time they were gone
-- Mutiplies that amount by a variable called, "mutiplier" that is currently set at 0.15
-- Changes the GUI via script based off of these calculations
