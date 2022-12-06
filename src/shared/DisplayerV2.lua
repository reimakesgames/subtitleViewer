local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Note = require(script.Parent:WaitForChild("Note"))

export type DisplayerV2Class = {
	Display: (self: DisplayerV2Class, bpm: number, song: { [number]: { [number]: Note.Class } }, songInstance: Sound, where: Frame?, seek: number?) -> (nil),
	DisplayDrums: (self: DisplayerV2Class, bpm: number, song: { [number]: { [number]: Note.Class } }, songInstance: Sound, where: Frame?, seek: number?) -> (nil),
}

local DisplayerV2 = {} :: DisplayerV2Class

local function BeatDisplayer(noteIndex, where)
	if noteIndex == 1 then
		where.One.Visible = true
		where.Two.Visible = false
		where.Three.Visible = false
		where.Four.Visible = false
	elseif noteIndex == 5 then
		where.Two.Visible = true
	elseif noteIndex == 9 then
		where.Three.Visible = true
	elseif noteIndex == 13 then
		where.Four.Visible = true
	end
	local noteIndex2 = ((4 + (noteIndex - 1)) % 4) + 1
	warn(noteIndex2)
	if noteIndex2 == 1 then
		where.On.Visible = true
		where.Tw.Visible = false
		where.Th.Visible = false
		where.Fo.Visible = false
	elseif noteIndex2 == 2 then
		where.Tw.Visible = true
	elseif noteIndex2 == 3 then
		where.Th.Visible = true
	elseif noteIndex2 == 4 then
		where.Fo.Visible = true
	end
end

local function FilterString(str: string)
	-- find if the last 2 characters are --
	-- if they are, then remove them
	-- if they aren't, then return the string and append a space

	-- also check if they are "", if they are, then return ""
	local lastTwo = str:sub(-2)
	if lastTwo == "--" then
		return str:sub(1, -3)
	elseif str == "" then
		return ""
	else
		return str .. " "
	end
end

function DisplayerV2:Display(bpm: number, song: {[number]: {[number]: Note.Class}}, songInstance: Sound, where: Frame | any, seek: number?)
	local sixteenthSpeed = 60 / bpm / 4
	local currentBar = 1
	local currentNote = 1
	local t = 0
	if seek then
		songInstance.TimePosition = seek * sixteenthSpeed
		currentBar = (seek / 16) + 1
		currentNote = (seek % 16) + 1
	end
	songInstance:Play()
	RunService.RenderStepped:Connect(function(deltaTime)
		t = t + deltaTime
		if t >= sixteenthSpeed then
			t = t - sixteenthSpeed
			local current = song[currentBar][currentNote]
			currentNote = currentNote + 1
			if currentNote == 17 then
				currentNote = 1
				currentBar = currentBar + 1
			end
			BeatDisplayer(currentNote, where)
			if current == nil then
				-- end of song
				songInstance:Stop()
			else
				-- display current
				print(current.data)
				where.TextLabel.Text = where.TextLabel.Text .. FilterString(current.data)
			end
		end
	end)
end

function DisplayerV2:DisplayDrums(bpm: number, song: {[number]: {[number]: Note.Class}}, songInstance: Sound, where: Frame | any, seek: number?)
	local sixteenthSpeed = 60 / bpm / 4
	local currentBar = 1
	local currentNote = 1
	local t = 0
	if seek then
		songInstance.TimePosition = seek * sixteenthSpeed
		currentBar = (seek / 16) + 1
		currentNote = (seek % 16) + 1
	end
	songInstance:Play()
	RunService.RenderStepped:Connect(function(deltaTime)
		t = t + deltaTime
		if t >= sixteenthSpeed then
			t = t - sixteenthSpeed
			local current = song[currentBar][currentNote]
			currentNote = currentNote + 1
			if currentNote == 17 then
				currentNote = 1
				currentBar = currentBar + 1
			end
			BeatDisplayer(currentNote, where)
			if current == nil then
				-- end of song
				songInstance:Stop()
			else
				if current.data == "Kick" then
					where.Drums.Kick.BackgroundTransparency = 0
					TweenService:Create(where.Drums.Kick, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
				elseif current.data == "Snare" then
					where.Drums.Snare.BackgroundTransparency = 0
					TweenService:Create(where.Drums.Snare, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
					where.Drums.Snare.Snare.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TweenService:Create(where.Drums.Snare.Snare, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(32, 32, 48)}):Play()
				elseif current.data == "SnareStick" then
					where.Drums.Snare.BackgroundTransparency = 0
					TweenService:Create(where.Drums.Snare, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
					where.Drums.Snare.Snare.BackgroundColor = Color3.fromRGB(32, 32, 48)
				elseif current.data == "CloseHat" then
					-- glow Hat
					-- keep Close background color (32, 32, 48)
					where.Drums.Hat.BackgroundTransparency = 0
					where.Drums.Hat.Pedal.BackgroundTransparency = 1
					where.Drums.Hat.Close.BackgroundTransparency = 0
					TweenService:Create(where.Drums.Hat, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
				elseif current.data == "OpenHat" then
					-- glow All
					-- always fade Hat > Close to background color (32, 32, 48)
					where.Drums.Hat.BackgroundTransparency = 0
					where.Drums.Hat.Pedal.BackgroundTransparency = 1
					where.Drums.Hat.Close.BackgroundTransparency = 1
					TweenService:Create(where.Drums.Hat, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
				elseif current.data == "PedalHat" then
					-- glow Hat > Pedal
					where.Drums.Hat.BackgroundTransparency = 1
					where.Drums.Hat.Pedal.BackgroundTransparency = 0
					where.Drums.Hat.Close.BackgroundColor = Color3.fromRGB(255, 255, 255)
					TweenService:Create(where.Drums.Hat.Pedal, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
				elseif current.data == "Crash" then
					where.Drums.Crash.BackgroundTransparency = 0
					TweenService:Create(where.Drums.Crash, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
				elseif current.data == "Ride" then
					where.Drums.Ride.BackgroundTransparency = 0
					TweenService:Create(where.Drums.Ride, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
				elseif current.data == "Tom1" then
					where.Drums.Tom1.BackgroundTransparency = 0
					TweenService:Create(where.Drums.Tom1, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
				elseif current.data == "Tom2" then
					where.Drums.Tom2.BackgroundTransparency = 0
					TweenService:Create(where.Drums.Tom2, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
				elseif current.data == "Tom3" then
					where.Drums.Tom3.BackgroundTransparency = 0
					TweenService:Create(where.Drums.Tom3, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
				end
			end
		end
	end)
end

return DisplayerV2
