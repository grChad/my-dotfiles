local cp = require("custom.theme.colors")

return {
	-- for NvimTree
	NvimTreeRootFolder = { fg = cp.red_2, bg = cp.whiteSmoke, bold = true },
	NvimTreeFolderName = { fg = cp.folder },
	NvimTreeFolderIcon = { fg = cp.folder },
	NvimTreeNormal = { fg = cp.whiteSmoke },
	NvimTreeOpenedFolderName = { fg = cp.folder },
	NvimTreeEmptyFolderName = { fg = cp.text },
	NvimTreeIndentMarker = { fg = cp.overlay0 },
	NvimTreeSymlink = { fg = cp.pink_1 },
	NvimTreeStatuslineNc = { fg = cp.mantle, bg = cp.mantle }, -- Status line for NvimTree
	NvimTreeGitDirty = { fg = cp.yellow },
	NvimTreeGitNew = { fg = cp.blue },
	NvimTreeGitDeleted = { fg = cp.red },
	NvimTreeSpecialFile = { fg = cp.teal_2 },
	NvimTreeImageFile = { fg = cp.text },
	NvimTreeOpenedFile = { fg = cp.blue_1 },
	NvimTreeCursorLine = { bg = cp.surface0 },
	NvimTreeWinSeparator = { fg = cp.text },

	-- for Barbar
	BufferCurrent = { bg = cp.surface1, fg = cp.text },
	BufferCurrentIndex = { bg = cp.surface1, fg = cp.blue_1 },
	BufferCurrentMod = { bg = cp.surface1, fg = cp.yellow },
	BufferCurrentSign = { bg = cp.mantle, fg = cp.blue_1 },
	BufferCurrentTarget = { bg = cp.surface1, fg = cp.red },
	BufferVisible = { bg = cp.mantle, fg = cp.text },
	BufferVisibleIndex = { bg = cp.mantle, fg = cp.blue_1 },
	BufferVisibleMod = { bg = cp.mantle, fg = cp.yellow },
	BufferVisibleSign = { bg = cp.mantle, fg = cp.blue_1 },
	BufferVisibleTarget = { bg = cp.mantle, fg = cp.red },
	BufferTabpages = { bg = cp.mantle, fg = cp.none },
	BufferTabpage = { bg = cp.mantle, fg = cp.blue_1 },

	-- for GitSings
	GitSignsAdd = { fg = cp.green }, -- diff mode: Added line |diff.txt|
	GitSignsChange = { fg = cp.yellow }, -- diff mode: Changed line |diff.txt|
	GitSignsDelete = { fg = cp.red }, -- diff mode: Deleted line |diff.txt|

	--  for Editor
	CursorLineNR = { fg = cp.orange_1, bold = true },

	-- Others

	-- ------------------------ for Treesitter ------------------------------------------------
	["@text"] = { fg = cp.text }, -- For strings considerated text in a markup language.
	["@variable"] = { fg = cp.whiteSmoke }, -- Any variable name that does not have another highlighcp.
	["@variable.builtin"] = { fg = cp.lavender }, -- Variable names that are defined by the languages, like this or self.
	["@keyword"] = { fg = cp.pink_1 }, -- For keywords that don't fall in previous categories.
	["@function"] = { fg = cp.blue_1, italic = true, bold = true }, -- For function (calls and definitions).

	-- Markdown
	["@text.reference"] = { fg = cp.red_2 }, -- references
	["@text.emphasis"] = { fg = cp.peach, italic = true }, -- bold
	["@text.strong"] = { fg = cp.peach, bold = true }, -- italic
	["@text.literal"] = { fg = cp.whiteSmoke }, -- used for inline code in markdown and for doc in python (""")
	["@punctuation.special.markdown"] = { fg = cp.teal, bold = true },
	["@none.markdown"] = { fg = cp.whitesmoke },
	["@text.uri.markdown"] = { fg = cp.blue_1, underline = true },

	-- for html
	["@tag.html"] = { fg = cp.red },
	["@tag.delimiter.html"] = { fg = cp.red_1 }, -- Tag delimiter like < > /
	["@tag.attribute.html"] = { fg = cp.flamingo }, -- atributo de las etiquetas.
	["@text.title.html"] = { fg = cp.blue_2, bold = true }, -- titles for h1, h2, ... #1, #2...
	["@text.literal.html"] = { fg = cp.whiteSmoke }, -- used for inline code in markdown and for doc in python (""")
	["@text.uri"] = { fg = cp.blue_3, underline = true }, -- urls, links and emails
	["@constant.html"] = { fg = cp.blue },

	-- for Lua
	["@TSFieldkey"] = { fg = cp.teal },
	["@variable.lua"] = { fg = cp.whiteSmoke }, -- Any variable name that does not have another highlighcp.
	["@keyword.lua"] = { fg = cp.pink_1 }, -- For keywords that don't fall in previous categories.

	-- for C++
	["@variable.cpp"] = { fg = cp.whiteSmoke }, -- Any variable name that does not have another highlighcp.
	["@function.cpp"] = { fg = cp.blue_1, italic = true, bold = true }, -- For function (calls and definitions).
	["@keyword.cpp"] = { fg = cp.pink_1 }, -- For keywords that don't fall in previous categories.
	["@repeat.cpp"] = { fg = cp.red }, -- For keywords related to loops.

	-- for css and Scss
	["@type.css"] = { fg = cp.red_1 },
	["@property.css"] = { fg = cp.teal },
	["@function.css"] = { underline = false },
	["@type.scss"] = { fg = cp.red_1 },
	["@property.scss"] = { fg = cp.teal },
	["@string.scss"] = { fg = cp.text },
	["@function.scss"] = { underline = false },

	-- for yaml
	["@field.yaml"] = { fg = cp.blue }, -- For fields.

	-- for json
	["@label.json"] = { fg = cp.blue_1 }, -- For labels: label: in C and :label: in Lua.
	["@string.json"] = { fg = cp.text },
	["@conceal.json"] = { fg = cp.green_1 },
	["@punctuation.delimiter.json"] = { fg = cp.red_2 }, -- For delimiters ie: .

	-- for python
	["@variable.python"] = { fg = cp.whiteSmoke }, -- Any variable name that does not have another highlighcp.
	["@function.builtin.python"] = { fg = cp.orange_1 }, -- For builtin functions: table.insert in Lua.
	["@function.call.python"] = { fg = cp.peach },
}
