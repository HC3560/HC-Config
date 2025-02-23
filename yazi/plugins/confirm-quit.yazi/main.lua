local count = ya.sync(function()
	return #cx.tabs
end)

local function entry()
	if count() < 2 then
		return ya.manager_emit("quit", {})
	end

	local yes = ya.confirm({
		pos = { "center", w = 65, h = 10 },
		title = "Quit?",
		content = "\nMultiple tabs open.\n\nAre you sure you want to quit?",
	})
	if yes then
		ya.manager_emit("quit", {})
	end
end

return { entry = entry }
