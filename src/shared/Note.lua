export type Class = {
	__index: (Class),
	new: (data: string, length: number?) -> (Class),

	length: number,
	data: string?
}

local Note = {} :: Class
Note.__index = Note

function Note.new(data, length): Class
	local self = setmetatable({}, Note)
	self.data = data
	self.length = length

	return self :: Class
end

return Note
