local count = ya.sync(function()
	return #cx.tabs
end)

local function entry()
	if count() < 2 then
		return ya.manager_emit("quit", {})
	end

	local yes = ya.confirm({
		pos = { "center", w = 75, h = 15 },
		title = "Quit?",
		content = "There are multiple tabs open. Are you sure you want to quit?",
	})
	if yes then
		ya.manager_emit("quit", {})
	end
end

return { entry = entry }
