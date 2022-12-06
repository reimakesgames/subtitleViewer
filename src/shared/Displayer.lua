local RunService = game:GetService("RunService")
local Displayer = {}

local function get_occurrence_count(s: string, chr)
    return s:gsub(chr, "")
end

local function ConvertToDisplayFormat(lyrics: string)
	local lines = lyrics:split("\n")
	local displayLines = {}
	-- 16 > is equal to a bar
	for _, line in lines do
		local words = line:split(" ")
		for _, word in words do
			local new, occurence = get_occurrence_count(word, ">")
			for _ = 1, occurence do
				table.insert(displayLines, false)
			end
			table.insert(displayLines, new)
		end
	end
	-- prune "" from the table
	for i, v in displayLines do
		if v == "" then
			table.remove(displayLines, i)
		end
	end
	return displayLines
end

local addSpace = false
local num = 0
function Displayer:Display(bpm: number, formattedText: string, where: Frame?)
	local stuff = ConvertToDisplayFormat(formattedText)
	local sixteenthSpeed = 60 / bpm / 4
	print(stuff)
	task.wait(4)
	workspace.parasocial:Play()
	local t = 0
	RunService.RenderStepped:Connect(function(deltaTime)
		t = t + deltaTime
		if t >= sixteenthSpeed then
			t = t - sixteenthSpeed
			local current = stuff[1]
			table.remove(stuff, 1)
			num = num + 1
			if num == 1 then
				where.One.Visible = true
				where.Two.Visible = false
				where.Three.Visible = false
				where.Four.Visible = false
			elseif num == 5 then
				where.Two.Visible = true
			elseif num == 9 then
				where.Three.Visible = true
			elseif num == 13 then
				where.Four.Visible = true
			end
			if num == 16 then
				num = 0
			end
			if current == false then
				-- do nothing
			elseif current == nil then
				-- end of song
				workspace.parasocial:Stop()
			else
				-- display current
				print(current)
				-- check if the last character is -
				-- if so, then don't add a space
				-- if not, then add a space
				if addSpace then
					current = " " .. current
					addSpace = false
				end
				local newCurrent = current
				if current:sub(-1) == "-" then
					newCurrent = current:sub(1, -2)
				else
					addSpace = true
				end
				where.TextLabel.Text = where.TextLabel.Text .. newCurrent
			end
		end
	end)
end

return Displayer
