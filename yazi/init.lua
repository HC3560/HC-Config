-- HC-Plugin: git.yazi
require("git"):setup()

-- HC-Plugin: starship.yazi
require("starship"):setup({
	config_file = "~/.config/yazi/starship.toml",
})

-- HC-Plugin: yaziline.yazi
require("yaziline"):setup({
	color = "#A7C080", -- main theme color
	separator_style = "angly", -- "angly" | "curvy" | "liney" | "empty"
	separator_open = "",
	separator_close = "",
	separator_open_thin = "",
	separator_close_thin = "",
	separator_head = "",
	separator_tail = "",
	select_symbol = "",
	yank_symbol = "󰆐",
	filename_max_length = 24, -- truncate when filename > 24
	filename_truncate_length = 6, -- leave 6 chars on both sides
	filename_truncate_separator = "...", -- the separator of the truncated filename
})

-- HC-Plugin: full-border.yazi
require("full-border"):setup()

-- HC-Plugin: eza-preview.yazi
require("eza-preview"):setup({
	-- Set the tree preview to be default (default: true)
	default_tree = false,

	-- Directory depth level for tree preview (default: 3)
	level = 3,

	-- Follow symlinks when previewing directories (default: false)
	follow_symlinks = false,

	-- Show target file info instead of symlink info (default: false)
	dereference = false,

	-- Show hidden files (default: true)
	all = true,
})

-- HC-Plugin: yamb.yazi
-- You can configure your bookmarks by lua language
local bookmarks = {}
require("yamb"):setup({
	-- Optional, the path ending with path seperator represents folder.
	bookmarks = bookmarks,
	-- Optional, recieve notification everytime you jump.
	jump_notify = true,
	-- Optional, the cli of fzf.
	cli = "fzf",
	-- Optional, a string used for randomly generating keys, where the preceding characters have higher priority.
	keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
	-- Optional, the path of bookmarks
	path = (ya.target_family() == "windows" and os.getenv("APPDATA") .. "\\yazi\\config\\bookmark")
		or (os.getenv("HOME") .. "/.config/yazi/bookmark"),
})

-- 在状态栏中显示符号链接：https://yazi-rs.github.io/docs/tips/#symlink-in-status
Status:children_add(function(self)
	local h = self._current.hovered
	if h and h.link_to then
		return " -> " .. tostring(h.link_to)
	else
		return ""
	end
end, 3300, Status.LEFT)

-- 在状态栏中显示用户/文件组：https://yazi-rs.github.io/docs/tips/#user-group-in-status
Status:children_add(function()
	local h = cx.active.current.hovered
	if h == nil or ya.target_family() ~= "unix" then
		return ""
	end

	return ui.Line({
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		":",
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		" ",
	})
end, 500, Status.RIGHT)
