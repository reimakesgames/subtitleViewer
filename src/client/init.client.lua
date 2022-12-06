local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage:WaitForChild("Shared")
local LocalPlayer = Players.LocalPlayer
local Displayer = require(Shared:WaitForChild("Displayer"))
local DisplayerV2 = require(Shared:WaitForChild("DisplayerV2"))
local Lyrics = require(Shared:WaitForChild("Lyrics"))
local LyricsV2 = require(Shared:WaitForChild("LyricsV2"))

-- Displayer:Display(85, Lyrics, LocalPlayer.PlayerGui:WaitForChild("Lyrics"))
task.wait(2)
DisplayerV2:Display(85, LyricsV2.lyrics, workspace.parasocial, LocalPlayer.PlayerGui:WaitForChild("Lyrics"))
DisplayerV2:DisplayDrums(85, LyricsV2.drums, workspace.parasocial, LocalPlayer.PlayerGui:WaitForChild("Lyrics"))
DisplayerV2:DisplayDrums(85, LyricsV2.hats, workspace.parasocial, LocalPlayer.PlayerGui:WaitForChild("Lyrics"))
