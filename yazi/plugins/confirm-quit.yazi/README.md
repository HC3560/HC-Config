# Confirm before quitting if multiple tabs are open[#](https://yazi-rs.github.io/docs/tips#confirm-quit)

Save these lines as `~/.config/yazi/plugins/confirm-quit.yazi/main.lua`:

```lua
local count = ya.sync(function() return #cx.tabs end)

local function entry()
	if count() < 2 then
		return ya.emit("quit", {})
	end

	local yes = ya.confirm {
		pos = { "center", w = 62, h = 10 },
		title = "Quit?",
		body = ui.Text("There are multiple tabs open. Are you sure you want to quit?"):wrap(ui.Wrap.YES),
	}
	if yes then
		ya.emit("quit", {})
	end
end

return { entry = entry }
```

Next, bind it to the `q` key in your `keymap.toml`:

```toml
[[mgr.prepend_keymap]]
on  = "q"
run = "plugin confirm-quit"
```

Credits to [@lpnh for sharing it](https://github.com/sxyazi/yazi/issues/2267#issuecomment-2624805134).

Note: When using this plugin, you may notice a brief popup flashing before Yazi quits. This is a "running task" confirmation popup. For more details about this behavior, see: [#1059](https://github.com/sxyazi/yazi/issues/1059)
