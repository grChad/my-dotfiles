local M = {}

M.lspkind = {
	Namespace = "",
	Text = " ",
	Method = " ",
	Function = " ",
	Constructor = " ",
	Field = "ﰠ ",
	Variable = " ",
	Class = "ﴯ ",
	Interface = " ",
	Module = " ",
	Property = "ﰠ ",
	Unit = "塞 ",
	Value = " ",
	Enum = " ",
	Keyword = " ",
	Snippet = " ",
	Color = " ",
	File = " ",
	Reference = " ",
	Folder = " ",
	EnumMember = " ",
	Constant = " ",
	Struct = "פּ ",
	Event = " ",
	Operator = " ",
	TypeParameter = " ",
	Table = "",
	Object = " ",
	Tag = "",
	Array = "[]",
	Boolean = " ",
	Number = " ",
	Null = "ﳠ",
	String = " ",
	Calendar = "",
	Watch = " ",
	Package = "",
}

M.separators = {
	default = { left = "", right = " " },

	round = { left = "", right = "" },

	block = { left = "█", right = "█" },

	arrow = { left = "", right = "" },

	line = {
		favorite = "|",
		one_line = "┃",
		two_line = "║",
		big_line = "█",
	},
}

M.others = { curve = "╰", close = "", pinned = "車" }

M.diagnostic = {
	error = "",
	hint = "",
	info = "",
	warning = "",
}

M.git = {
	branch = "",
	add = "",
	remove = "",
	modifier = "",
	check = "",
	unmerged = "",
}

return M
