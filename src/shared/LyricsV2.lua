local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Note = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Note"))

local SIXTEENTH = Note.new("")
local BAR = {SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH}

local Kick = Note.new("Kick")
local Snare = Note.new("Snare")
local CloseHat = Note.new("CloseHat")
local OpenHat = Note.new("OpenHat")
local Crash = Note.new("Crash")

local function n(data, length: number?)
	return Note.new(data, length or 1)
end

local lyrics = {
	BAR,
	BAR,
	BAR,
	BAR,
	BAR,
	BAR,
	{SIXTEENTH, n("My"), n("phone", 2), SIXTEENTH, n("rings", 2), SIXTEENTH, n("at", 2), SIXTEENTH, n("three", 2), SIXTEENTH, n("in"), n("the"), n("mor--"), n("ning"), SIXTEENTH,
	n("I")}, {n("bet--"), n("ter"), n("check"), n("the"), n("D--"), n("Ms"), n("when"), n("my"), n("eyes", 2), SIXTEENTH, n("are", 2), SIXTEENTH, n("burn--"), n("ing"), SIXTEENTH, SIXTEENTH},
	{SIXTEENTH, n("'Cause"), n("if"), n("I"), n("don't", 2), SIXTEENTH, n("they"), n("would"), n("think"), n("I'm"), n("ig--", 2), SIXTEENTH, n("nor--"), n("ing", 2), SIXTEENTH,
	n("And")}, {n("say"), n("that"), n("I'm"), n("an"), n("ass--"), n("hole"), n("who"), n("don't"), n("care"), n("a--"), n("bout"), n("the"), n("fans", 2), SIXTEENTH, n("well", 2), SIXTEENTH},
	-- blank blank To be honest, I don't think I could just care about
	{SIXTEENTH, SIXTEENTH, n("To"), n("be"), n("ho--"), n("nest"), n("I"), n("don't"), n("think"), n("I"), n("could"), n("just"), n("care"), n("a--"), n("bout"), SIXTEENTH},
	-- blank blank All the fans I wouldn't even get to know about
	{SIXTEENTH, SIXTEENTH, n("All"), n("the"), n("fans"), n("I"), n("would--"), n("n't"), n("e--"), n("ven"), n("get"), n("to"), n("know"), n("a--"), n("bout"), SIXTEENTH},
	-- blank I'm not a tool for you to get your day blank be-- tter blank so
	{SIXTEENTH, n("I'm"), n("not"), n("a"), n("tool"), n("for"), n("you"), n("to"), n("get"), n("your"), n("day", 2), SIXTEENTH, n("be--"), n("tter", 2), SIXTEENTH, n("So")},
	-- take your words pause back pause I don't wa-- nna see you later pause pause
	{n("take"), n("your"), n("words", 2), SIXTEENTH, n("back", 2), SIXTEENTH, n("I"), n("don't"), n("wa--"), n("nna"), n("see"), n("you"), n("la--"), n("ter"), SIXTEENTH, SIXTEENTH},
}

local drums = {
	{Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, Kick, Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, Kick},
	{Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, Kick, Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH},

	{Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, Kick, Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, SIXTEENTH},
	{Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, Kick, Kick, SIXTEENTH, Kick, SIXTEENTH, Snare, Kick, SIXTEENTH, SIXTEENTH},
	{Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, Kick, Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, SIXTEENTH},
	{Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, Kick, Kick, SIXTEENTH, Kick, SIXTEENTH, Snare, Kick, SIXTEENTH, SIXTEENTH},

	{Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, Kick, Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, SIXTEENTH},
	{Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, Kick, Kick, SIXTEENTH, Kick, SIXTEENTH, Snare, Kick, SIXTEENTH, SIXTEENTH},
	{Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, Kick, Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, SIXTEENTH},
	{Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, Kick, Kick, SIXTEENTH, Kick, SIXTEENTH, Snare, Kick, SIXTEENTH, SIXTEENTH},

	{Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, Kick, Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, SIXTEENTH},
	{Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, Kick, Kick, SIXTEENTH, Kick, SIXTEENTH, Snare, Kick, SIXTEENTH, SIXTEENTH},
	{Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, Kick, Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, SIXTEENTH},
	{Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, Snare, SIXTEENTH, SIXTEENTH, Kick, Kick, SIXTEENTH, Kick, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH},
}

local hats = {
	{OpenHat, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH},
	{SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH},

	{Crash, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH},
	{SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH},
	{SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH},
	{SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, OpenHat, SIXTEENTH},

	{SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH},
	{SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH},
	{SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH},
	{SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH},

	{SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH},
	{SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH},
	{SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH},
	{SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, CloseHat, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH, SIXTEENTH},

}

local _ = [[
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>My phone >rings >at >three >in the mor- ning
>I bet- ter check the D- Ms when my eyes >are >burn- ing
>>>'Cause If I don't, >they would think I'm ig- >no- ring
>And say that I'm an ass- hole who don't care a- bout the fans, >well

>>To be ho- nest, I don't think I could just care a- bout
>>All the fans I would- n't e- ven get to know a- bout
>>I'm not a tool for you to get your day be- tter
>So take your words >back, >I don't wa- nna see you la- ter
>>
]]

-- Leave me the hell alone
-- You know I'm not the only one
-- Just find someone else to talk about
-- I've got no time to fuck around
-- If this is what you want from me to get attention
-- You're parasocial

-- We've never met before and I don't even know about ya
-- You better let me go 'cause I don't wanna know about ya
-- I've got my friends and you don't get to be my friend
-- So stop making me sick, you're freaking me out
-- I'm giving up, now I'm paranoid
-- You're parasocial
-- You're parasocial

-- I've heard that I was someone's best friend
-- All the sudden, I became a person who been saying shit
-- Out of nowhere, I just got another hater when I'm not even that famous
-- What a stupid situation I'm dealing with

-- I think it's fine 'cause I've been hiding that I'm burning out
-- And after all, they wouldn't know what I just sang about
-- But once again, If you're talking shit on Twitter
-- Should cut your own fingers, that will make your life better

-- Leave me the hell alone
-- You know I'm not the only one
-- Just find someone else to talk about
-- I've got no time to fuck around
-- If this is what you want from me to get attention
-- You're parasocial

-- We've never met before and I don't even know about ya
-- You better let me go 'cause I don't wanna know about ya
-- I've got my friends and you don't get to be my friend
-- So stop making me sick, you're freaking me out
-- I'm giving up, now I'm paranoid
-- You're parasocial
-- You're parasocial

-- You're parasocial
-- You're parasocial

-- Leave me the hell alone
-- You know I'm not the only one
-- Just find someone else to talk about
-- I've got no time to fuck around
-- If this is what you want from me to get attention
-- You're parasocial

-- We've never met before and I don't even know about ya
-- You better let me go 'cause I don't wanna know about ya
-- I've got my friends and you don't get to be my friend
-- So stop making me sick, you're freaking me out
-- I'm giving up, now I'm paranoid
-- You're parasocial
-- You're parasocial

-- You're parasocial
-- ]]

return {["lyrics"] = lyrics, ["drums"] = drums, ["hats"] = hats}
