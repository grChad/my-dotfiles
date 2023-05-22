local present, alpha = pcall(require, 'alpha')
if not present then
	return
end

-- Definir colores en una tabla
local colors = {
	{ 'Nvim_logo_01', '#AFD700' },
	{ 'Nvim_Logo_02', '#D7D700' },
	{ 'Nvim_Logo_03', '#D7AF00' },
	{ 'Nvim_Logo_04', '#FFAF00' },
	{ 'Nvim_Logo_05', '#FF8700' },
	{ 'Nvim_Logo_06', '#FF875F' },
	{ 'Nvim_Logo_07', '#FF5F5F' },
	{ 'Nvim_Logo_08', '#FF5F87' },
	{ 'Nvim_Logo_09', '#FF0087' },
	{ 'Nvim_Logo_10', '#FF00AF' },
	{ 'Nvim_Logo_11', '#D700AF' },
	{ 'Nvim_Logo_12', '#D700D7' },
	{ 'Nvim_Logo_13', '#AF00D7' },
	{ 'Nvim_Logo_14', '#AF00FF' },
	{ 'Nvim_Logo_15', '#8700FF' },
	{ 'Nvim_Logo_16', '#875FFF' },
	{ 'Nvim_Logo_17', '#5F5FFF' },

	{ 'FirstColor', '#51afef' },
	{ 'ThirdColor', '#40A02B' },
	{ 'FourthColor', '#7DADF1' },
	{ 'ButtonColor', '#181818', '#51afef' },
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
local image_portada = {
	[[                                                                   ]],
	[[      ███████████           █████      ██                    ]],
	[[     ███████████             █████                            ]],
	[[     ████████████████ ███████████ ███   ███████    ]],
	[[    ████████████████ ████████████ █████ ████████████████  ]],
	[[   ███████████████ ██ █████████ █████ █████ ████ █████  ]],
	[[ ██████████████      ██ ██ ██████ █████ █████ ████ █████ ]],
	[[██████  ███ ████████  █████   ████ █████ █████ ████ ██████]],
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

local header_line_01 = group_custom(image_portada[1], {
	{ 'Nvim_Logo_11', 47, 49 },
	{ 'Nvim_logo_12', 49, 69 },
})

local header_line_02 = group_custom(image_portada[2], {
	{ 'Nvim_Logo_02', 8, 13 },
	{ 'Nvim_Logo_03', 13, 24 },
	{ 'Nvim_Logo_04', 24, 36 },
	{ 'Nvim_Logo_05', 36, 52 },
	{ 'Nvim_logo_08', 64, 70 },
	{ 'Nvim_Logo_09', 70, 80 },
	{ 'Nvim_Logo_10', 80, 84 },
	{ 'Nvim_Logo_11', 90, 96 },
	{ 'Nvim_Logo_12', 96, 102 },
})

local header_line_03 = group_custom(image_portada[3], {
	{ 'Nvim_logo_02', 6, 12 },
	{ 'Nvim_logo_03', 12, 26 },
	{ 'Nvim_Logo_04', 26, 40 },
	{ 'Nvim_Logo_05', 40, 50 },
	{ 'Nvim_Logo_09', 50, 80 },
	{ 'Nvim_Logo_10', 80, 88 },
})

local header_line_04 = group_custom(image_portada[4], {
	{ 'Nvim_logo_02', 6, 12 },
	{ 'Nvim_logo_03', 12, 24 },
	{ 'Nvim_Logo_04', 24, 40 },
	{ 'Nvim_Logo_05', 40, 50 },
	{ 'Nvim_Logo_06', 50, 64 },
	{ 'Nvim_Logo_07', 64, 76 },
	{ 'Nvim_Logo_08', 76, 88 },
	{ 'Nvim_Logo_09', 88, 100 },
	{ 'Nvim_Logo_10', 100, 116 },
	{ 'Nvim_Logo_11', 116, 124 },
	{ 'Nvim_Logo_12', 124, 134 },
	{ 'Nvim_Logo_13', 134, 146 },
	{ 'Nvim_Logo_14', 146, 158 },
	{ 'Nvim_Logo_15', 158, 170 },
	{ 'Nvim_Logo_16', 170, 180 },
})

local header_line_05 = group_custom(image_portada[5], {
	{ 'Nvim_logo_02', 6, 10 },
	{ 'Nvim_logo_03', 10, 26 },
	{ 'Nvim_Logo_04', 26, 38 },
	{ 'Nvim_Logo_05', 38, 50 },
	{ 'Nvim_Logo_06', 50, 64 },
	{ 'Nvim_Logo_07', 64, 76 },
	{ 'Nvim_Logo_08', 76, 90 },
	{ 'Nvim_Logo_09', 90, 102 },
	{ 'Nvim_Logo_10', 102, 114 },
	{ 'Nvim_Logo_11', 114, 126 },
	{ 'Nvim_Logo_12', 126, 138 },
	{ 'Nvim_Logo_13', 138, 148 },
	{ 'Nvim_Logo_14', 148, 164 },
	{ 'Nvim_Logo_15', 164, 176 },
	{ 'Nvim_Logo_16', 176, 188 },
})

local header_line_06 = group_custom(image_portada[6], {
	{ 'Nvim_logo_02', 4, 12 },
	{ 'Nvim_logo_03', 12, 26 },
	{ 'Nvim_Logo_04', 26, 40 },
	{ 'Nvim_Logo_05', 40, 52 },
	{ 'Nvim_Logo_06', 52, 64 },
	{ 'Nvim_Logo_07', 64, 74 },
	{ 'Nvim_Logo_08', 74, 88 },
	{ 'Nvim_Logo_09', 88, 100 },
	{ 'Nvim_Logo_10', 100, 114 },
	{ 'Nvim_Logo_11', 114, 124 },
	{ 'Nvim_Logo_12', 124, 136 },
	{ 'Nvim_Logo_13', 136, 148 },
	{ 'Nvim_Logo_14', 148, 160 },
	{ 'Nvim_Logo_15', 160, 172 },
	{ 'Nvim_Logo_16', 172, 184 },
})

local header_line_07 = group_custom(image_portada[7], {
	{ 'Nvim_logo_02', 2, 18 },
	{ 'Nvim_logo_03', 18, 28 },
	{ 'Nvim_Logo_04', 28, 40 },
	{ 'Nvim_Logo_05', 40, 56 },
	{ 'Nvim_Logo_06', 56, 62 },
	{ 'Nvim_Logo_08', 68, 82 },
	{ 'Nvim_Logo_09', 82, 92 },
	{ 'Nvim_Logo_10', 94, 104 },
	{ 'Nvim_Logo_11', 104, 114 },
	{ 'Nvim_Logo_12', 116, 128 },
	{ 'Nvim_Logo_13', 128, 138 },
	{ 'Nvim_Logo_14', 138, 150 },
	{ 'Nvim_Logo_15', 150, 160 },
	{ 'Nvim_Logo_16', 162, 174 },
	{ 'Nvim_Logo_17', 174, 178 },
})

local header_line_08 = group_custom(image_portada[8], {
	{ 'Nvim_logo_01', 0, 4 },
	{ 'Nvim_logo_02', 4, 16 },
	{ 'Nvim_logo_03', 16, 24 },
	{ 'Nvim_Logo_04', 28, 40 },
	{ 'Nvim_Logo_05', 40, 48 },
	{ 'Nvim_Logo_06', 48, 64 },
	{ 'Nvim_Logo_07', 64, 72 },
	{ 'Nvim_Logo_08', 76, 84 },
	{ 'Nvim_Logo_09', 84, 96 },
	{ 'Nvim_Logo_10', 100, 104 },
	{ 'Nvim_Logo_11', 104, 116 },
	{ 'Nvim_Logo_12', 118, 130 },
	{ 'Nvim_Logo_13', 130, 140 },
	{ 'Nvim_Logo_14', 140, 148 },
	{ 'Nvim_Logo_15', 150, 162 },
	{ 'Nvim_Logo_16', 164, 174 },
	{ 'Nvim_Logo_17', 174, 184 },
})
-- +--------------------------------------------------------------------+

-- Información de la fecha:
-- en lugar de usar 'date' del sistema, 'os.date' de Lua formatea directamente el código.
-- es mas eficiente y evita una llamada externa.
local fecha = os.date(' %A %d/%B/%G · %R')

local fecha_actual = group_custom(fecha, {
	{ 'Nvim_Logo_06', 0, 3 },
	{ 'FirstColor', 4, 100 },
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
		-- hl = 'SecondColor',
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
	local plugins = #vim.tbl_keys(packer_plugins)
	local value_str = 'NeoVim v%d.%d.%d -  %d Plugins'

	return string.format(value_str, v.major, v.minor, v.patch, plugins)
end

local the_footer = group_custom(footer(), {
	{ 'FirstColor', 0, 3 },
	{ 'ThirdColor', 3, 6 },
	{ 'Text', 7, 50 },
})
-- +--------------------------------------------------------------------+

local credits = group_custom('by · @gr92', {
	{ 'Text', 0, 16 },
})
-- +--------------------------------------------------------------------+

-- Setup
alpha.setup({
	layout = {
		{ type = 'padding', val = 1 },
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
	margin = 5,
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
