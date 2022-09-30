local cp = require("custom.theme.colors")

return {
	-- for Editor
	Comment = { fg = cp.blue },
	LineNr = { fg = cp.overlay1 },
	CursorLine = { bg = "None" },
	SignColumn = { fg = cp.surface1 }, -- column where |signs| are displayed
	SignColumnSB = { bg = cp.crust, fg = cp.surface1 }, -- column where |signs| are displayed
	StatusLine = { fg = cp.text, bg = cp.mantle }, -- status line of current window
	StatusLineNC = { fg = cp.surface1, bg = cp.mantle }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
	ColorColumn = { bg = cp.surface0 }, -- used for the columns set with 'colorcolumn'
	Conceal = { fg = cp.overlay1 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
	Cursor = { fg = cp.base, bg = cp.text }, -- character under the cursor
	lCursor = { fg = cp.base, bg = cp.text }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
	CursorIM = { fg = cp.base, bg = cp.text }, -- like Cursor, but used when in IME mode |CursorIM|
	CursorColumn = { bg = cp.mantle }, -- Screen-column at the cursor, when 'cursorcolumn' is secp.
	Directory = { fg = cp.blue }, -- directory names (and other special names in listings)
	EndOfBuffer = { fg = cp.base }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
	ErrorMsg = { fg = cp.red, bold = true, italic = true }, -- error messages on the command line
	Folded = { fg = cp.blue, bg = cp.surface1 }, -- line used for closed folds
	FoldColumn = { fg = cp.overlay0 }, -- 'foldcolumn'
	Substitute = { bg = cp.white, fg = cp.pink_2 }, -- |:substitute| replacement text highlighting
	MatchParen = { fg = cp.white, bg = cp.blue_3, bold = true }, -- El caracter que conincide con la posicion de cursor { }, [], ()..
	ModeMsg = { fg = cp.text, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
	MsgArea = { fg = cp.text }, -- Area for messages and cmdline
	MsgSeparator = {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
	MoreMsg = { fg = cp.blue }, -- |more-prompt|
	NonText = { fg = cp.overlay0 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
	FloatBorder = { fg = cp.blue_2 },
	Pmenu = { bg = cp.surface0, fg = cp.overlay2 }, -- Popup menu: normal item.
	PmenuSel = { fg = cp.dark, bg = cp.teal, bold = true }, -- Popup menu: selected item.
	PmenuSbar = { bg = cp.surface1 }, -- Popup menu: scrollbar.
	PmenuThumb = { bg = cp.overlay0 }, -- Popup menu: Thumb of the scrollbar.
	Question = { fg = cp.blue }, -- |hit-enter| prompt and yes/no questions
	QuickFixLine = { bg = cp.surface1, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
	Search = { bg = cp.yellow_2, fg = cp.base }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand oucp.
	IncSearch = { bg = cp.red, fg = cp.base }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
	CurSearch = { bg = cp.red, fg = cp.mantle }, -- 'cursearch' highlighting: highlights the current search you're on differently
	SpecialKey = { fg = cp.text }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' textspace. |hl-Whitespace|
	SpellBad = { sp = cp.red, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
	SpellCap = { sp = cp.yellow, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
	SpellLocal = { sp = cp.blue, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
	SpellRare = { sp = cp.green, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
	TabLine = { bg = cp.mantle, fg = cp.surface1 }, -- tab pages line, not active tab page label
	TabLineFill = { bg = cp.black }, -- tab pages line, where there are no labels
	TabLineSel = { fg = cp.green, bg = cp.surface1 }, -- tab pages line, active tab page label
	Title = { fg = cp.blue, bold = true }, -- titles for output from ":set all", ":autocmd" etcp.
	Visual = { bg = cp.surface1, bold = true }, -- Visual mode selection
	VisualNOS = { bg = cp.surface1, bold = true }, -- Visual mode selection when vim is "Not Owning the Selection".
	WarningMsg = { fg = cp.yellow }, -- warning messages
	Whitespace = { fg = cp.surface1 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
	WildMenu = { bg = cp.overlay0 }, -- current match in 'wildmenu' completion
	WinBar = { fg = cp.rosewater },
	WinSeparator = { fg = cp.text },

	-- for Syntax
	Constant = { fg = cp.peach }, -- (preferred) any constant
	Character = { fg = cp.teal }, --  a character constant: 'c', '\n'
	Number = { fg = cp.peach }, --   a number constant: 234, 0xff
	Float = { fg = cp.peach }, --    a floating point constant: 2.3e10
	Boolean = { fg = cp.red_2, bold = true }, --  a boolean constant: TRUE, false
	Operator = { fg = cp.sky }, -- "sizeof", "+", "*", etcp.
	Include = { fg = cp.orange_2 }, --  preprocessor #include
}
