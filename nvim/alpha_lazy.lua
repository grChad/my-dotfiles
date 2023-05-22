local present, alpha = pcall(require, 'alpha')
if not present then
	return
end

-- Definir colores en una tabla
local colors = {
	-- Char 'g'
	{ 'char_g_1', '#4040fe' },
	{ 'char_g_2', '#354bfe' },
	{ 'char_g_3', '#255ffa' },
	{ 'char_g_4', '#1a70f4' },
	{ 'char_g_5', '#137def' },

	-- Char 'r'
	{ 'char_r_1', '#255ffa' },
	{ 'char_r_2', '#1a70f4' },
	{ 'char_r_3', '#1578f1' },
	{ 'char_r_4', '#0f85eb' },
	{ 'char_r_5', '#0a92e3' },

	-- Char 'C'
	{ 'char_C_1', '#2b57fc' },
	{ 'char_C_2', '#1f68f7' },
	{ 'char_C_3', '#1d6cf6' },
	{ 'char_C_4', '#1578f1' },
	{ 'char_C_5', '#0f85eb' },
	{ 'char_C_6', '#0a92e3' },
	{ 'char_C_7', '#03a6d5' },
	{ 'char_C_8', '#01b2cb' },

	-- Char 'h'
	{ 'char_h_1', '#1578f1' },
	{ 'char_h_2', '#0f85eb' },
	{ 'char_h_3', '#0a92e3' },
	{ 'char_h_4', '#059edb' },
	{ 'char_h_5', '#01b2cb' },
	{ 'char_h_6', '#01c8b5' },
	{ 'char_h_7', '#03d2a9' },
	{ 'char_h_8', '#06dc9d' },

	-- Char 'a'
	{ 'char_a_1', '#03d2a9' },
	{ 'char_a_2', '#06dc9d' },
	{ 'char_a_3', '#0ae491' },
	{ 'char_a_4', '#11ed80' },

	-- Char 'd'
	{ 'char_d_1', '#04d6a5' },
	{ 'char_d_2', '#07de99' },
	{ 'char_d_3', '#0ce68d' },
	{ 'char_d_4', '#11ed80' },
	{ 'char_d_5', '#14ef7c' },
	{ 'char_d_6', '#1bf56f' },
	{ 'char_d_7', '#23f962' },
	{ 'char_d_8', '#2cfc56' },

	{ 'FirstColor', '#51afef' },
	{ 'SecondColor', '#FF875F' },
	{ 'ThirdColor', '#FF5F5F' },
	{ 'ButtonColor', '#181818', '#51afef' },
	{ 'popOsColor', '#46b3c1' },
	{ 'fedoraColor', '#283f6e', '#1a70f4' },
	{ 'manjaroColor', '#159b81', '#06dc9d' },
	{ 'debianColor', '#d0074e', '#01b2cb' },
	{ 'archColor', '#198cc4' },
	{ 'ubuntuColor', '#e86e1f' },
	{ 'linuxMintColor', '#66af3d' },
	{ 'suseColor', '#6fb424', '#0ce68d' },
}

-- Definir y establecer los 'highlight groups' con los colores definidos
local api_hl = vim.api.nvim_set_hl

for _, color in ipairs(colors) do
	local group, opts = color[1], { fg = color[2] }
	if color[3] then
		opts.bg = color[3]
	end
	api_hl(0, group, opts)
end

-- +--------------------------------------------------------------------+
-- Header
local image_grChad = {
	[[                  ████████                       ██]],
	[[                 █████ ███                       ███ ]],
	[[                  ███      ███                          ]],
	[[██████    ███ ███     ███                       ███ ]],
	[[██████  █ █ ███    █████ ████████████████ ]],
	[[  █████ ███ ███      ███   ███  ████  ████ ]],
	[[      ██ ███  █████ ███   ███ ████ ████ ]],
	[[ ███████████ ███████  ███████████████]],
}

local group_custom = function(valor, table_hl)
	return {
		type = 'group',
		val = {
			{
				type = 'text',
				val = valor,
				opts = { position = 'center', hl = table_hl },
			},
		},
	}
end

local header_line_01 = group_custom(image_grChad[1], {
	{ 'char_C_1', 20, 42 },
	{ 'char_h_1', 42, 54 },
	{ 'char_d_1', 78, 90 },
})

local header_line_02 = group_custom(image_grChad[2], {
	{ 'char_C_2', 18, 44 },
	{ 'char_h_2', 46, 54 },
	{ 'char_d_2', 78, 86 },
})

local header_line_03 = group_custom(image_grChad[3], {
	{ 'char_C_3', 20, 27 },
	{ 'char_h_3', 34, 42 },
	{ 'suseColor', 67, 70 },
})

local header_line_04 = group_custom(image_grChad[4], {
	{ 'char_g_1', 2, 30 },
	{ 'char_r_1', 30, 44 },
	{ 'char_C_4', 46, 54 },
	{ 'Text', 58, 62 },
	{ 'char_h_4', 62, 70 },
	{ 'char_d_4', 90, 106 },
})

local header_line_05 = group_custom(image_grChad[5], {
	{ 'char_g_2', 2, 30 },
	{ 'char_r_2', 34, 36 },
	{ 'fedoraColor', 36, 40 },
	{ 'char_r_2', 40, 46 },
	{ 'char_C_5', 48, 56 },
	{ 'char_h_5', 60, 78 },
	{ 'debianColor', 78, 82 },
	{ 'char_h_5', 82, 94 },
	{ 'char_a_1', 94, 122 },
	{ 'char_d_5', 122, 150 },
})

local header_line_06 = group_custom(image_grChad[6], {
	{ 'char_g_3', 4, 30 },
	{ 'char_r_3', 32, 44 },
	{ 'char_C_6', 44, 56 },
	{ 'char_h_6', 60, 82 },
	{ 'char_a_2', 82, 108 },
	{ 'char_d_6', 108, 136 },
})

local header_line_07 = group_custom(image_grChad[7], {
	{ 'archColor', 4, 8 },
	{ 'char_g_4', 10, 22 },
	{ 'char_r_4', 24, 32 },
	{ 'char_C_7', 34, 60 },
	{ 'char_h_7', 62, 84 },
	{ 'char_a_3', 84, 92 },
	{ 'linuxMintColor', 92, 96 },
	{ 'char_a_3', 96, 112 },
	{ 'char_d_7', 112, 120 },
	{ 'popOsColor', 120, 124 },
	{ 'char_d_7', 124, 138 },
})

local header_line_08 = group_custom(image_grChad[8], {
	{ 'char_g_5', 2, 32 },
	{ 'char_r_5', 32, 46 },
	{ 'ubuntuColor', 46, 50 },
	{ 'char_C_8', 52, 74 },
	{ 'char_h_8', 76, 80 },
	{ 'manjaroColor', 80, 84 },
	{ 'char_h_8', 84, 104 },
	{ 'char_a_4', 104, 132 },
	{ 'char_d_8', 132, 164 },
})
-- +--------------------------------------------------------------------+

-- Información de la fecha:
-- en lugar de usar 'date' del sistema, 'os.date' de Lua formatea directamente el código.
-- es mas eficiente y evita una llamada externa.
local fecha = os.date(' %A %d/%B/%G · %R')

local fecha_actual = group_custom(fecha, {
	{ 'SecondColor', 0, 4 },
	{ 'char_g_4', 4, 7 },
	{ 'char_r_3', 7, 10 },
	{ 'char_C_6', 10, 13 },
	{ 'char_C_7', 13, 16 },
	{ 'char_h_5', 16, 19 },
	{ 'char_h_6', 19, 22 },
	{ 'char_a_2', 22, 25 },
	{ 'char_a_4', 25, 28 },
	{ 'char_d_4', 28, 31 },
	{ 'char_d_8', 31, 34 },
})
-- +--------------------------------------------------------------------+
-- ┌                                                                    ┐
-- │                              Botones                               │
-- │               > Copiado del código fuente Alpha.nvim               │
-- └                                                                    ┘
local dashboard = require('alpha.themes.dashboard')
local leader = 'SPC'

local function on_press(sc_)
	local key = vim.api.nvim_replace_termcodes(sc_ .. '<Ignore>', true, false, true)
	vim.api.nvim_feedkeys(key, 't', false)
end

-- @param sc string
-- @param txt string
-- @param keybind string optional
-- @param keybind_opts table optional

local function button(sc, txt, keybind, keybind_opts)
	local sc_ = sc:gsub('%s', ''):gsub(leader, '<leader>')

	local keybind_map = { noremap = true, silent = true, nowait = true }

	local opts = {
		position = 'center',
		shortcut = sc,
		cursor = 5,
		width = 50,
		align_shortcut = 'right',
		hl_shortcut = 'ButtonColor',
		hl = 'Text',
	}

	if keybind then
		opts.keymap = { 'n', sc_, keybind, keybind_opts or keybind_map }
	end

	return {
		type = 'button',
		val = txt,
		on_press = function()
			on_press(sc_)
		end,
		opts = opts,
	}
end

dashboard.section.buttons.val = {
	button(' <S-P> ', '  Find Word ', ':Telescope live_grep<CR>'),
	button(' <C-P> ', '  Find File ', ':Telescope find_files<CR>'),
	button(' SPC sh ', '  Recent File ', ':Telescope oldfiles<CR>'),
	button(' SPC b m ', '  Bookmarks ', ':Telescope marks<CR>'),
	-- button(' SPC / s d ', ' Abrir session reciente', '<cmd>SessionManager load_current_dir_session<CR>'),
	button(' ❌ ', '  Exit ', '<cmd>exit<CR>'),
}
-- +--------------------------------------------------------------------+

-- datos de la version de Nvim
local function footer()
	local v = vim.version()
	local plugins_lazy = require('lazy').plugins()
	-- local plugins = #vim.tbl_keys(packer_plugins)
	local value_str = 'NeoVim v%d.%d.%d -  %d Plugins'

	return string.format(value_str, v.major, v.minor, v.patch, #plugins_lazy)
end

local the_footer = group_custom(footer(), {
	{ 'char_C_5', 0, 3 },
	{ 'linuxMintColor', 3, 6 },
	{ 'Text', 7, 15 },
	{ 'char_a_1', 15, 23 },
	{ 'Text', 23, 32 },
})
-- +--------------------------------------------------------------------+

local credits = group_custom('by · @grChad 󰊤 ', {
	{ 'Text', 0, 5 },
	{ 'char_c_6', 6, 7 },
	{ 'char_h_4', 7, 8 },
	{ 'char_h_5', 8, 9 },
	{ 'char_h_6', 9, 10 },
	{ 'char_h_8', 10, 11 },
	{ 'char_d_4', 11, 12 },
	{ 'char_d_8', 12, 18 },
})
-- +--------------------------------------------------------------------+

local padding_resize = 8
local height_window = vim.api.nvim_get_option('lines')
if height_window > 24 then
	padding_resize = math.floor((height_window - 24) / 2)
end

-- Setup
alpha.setup({
	layout = {
		{ type = 'padding', val = padding_resize },
		header_line_01,
		header_line_02,
		header_line_03,
		header_line_04,
		header_line_05,
		header_line_06,
		header_line_07,
		header_line_08,
		{ type = 'padding', val = 1 },
		fecha_actual,
		{ type = 'padding', val = 1 },
		dashboard.section.buttons,
		the_footer,
		credits,
	},
	-- margin = 5,
})
-- +--------------------------------------------------------------------+

-- Ocultar las pestañas(buffer) y Bar estatus en la pantalla de inicio
vim.api.nvim_create_augroup('alpha_tabline', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
	group = 'alpha_tabline',
	pattern = 'alpha',
	command = 'set showtabline=0 laststatus=0 noruler',
})

vim.api.nvim_create_autocmd('FileType', {
	group = 'alpha_tabline',
	pattern = 'alpha',
	callback = function()
		vim.api.nvim_create_autocmd('BufUnload', {
			group = 'alpha_tabline',
			buffer = 0,
			command = 'set showtabline=2 ruler laststatus=3',
		})
	end,
})
