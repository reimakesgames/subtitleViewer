local Note = require(script.Parent:WaitForChild("Note"))

export type BarClass = {
	__index: (BarClass),
	new: () -> (BarClass),

	notes: { [number]: Note.Class },

	Fill: (self: BarClass, data: { [number]: Note.Class }) -> (nil),
}

local Bar = {} :: BarClass
Bar.__index = Bar

function Bar.new(): BarClass
	local self = setmetatable({}, Bar)
	self.notes = {}

	return self :: BarClass
end

function Bar:Fill(data: {[number]: Note.Class})
	-- fill the bar with data
	-- data is a table with the following format:
	-- 1-16: string

	for index, value: Note.Class in data do
		self.notes[index] = value
	end
end

return Bar
