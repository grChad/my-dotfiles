local present, alpha = pcall(require, 'alpha')
if not present then
   return
end

local dashboard = require('alpha.themes.dashboard')
local if_nil = vim.F.if_nil
-- +--------------------------------------------------------------------+

-- Header
local cabello = {
   type = 'text',
   val = {
      [[                                                                   ]],
      [[      ███████████           █████      ██                    ]],
      [[     ███████████             █████                            ]],
      [[     ████████████████ ███████████ ███   ███████    ]],
      [[    ████████████████ ████████████ █████ ████████████████  ]],
      [[   ███████████████ ██ █████████ █████ █████ ████ █████  ]],
      [[ ██████████████      ██ ██ ██████ █████ █████ ████ █████ ]],
      [[██████  ███ ████████  █████   ████ █████ █████ ████ ██████]],
   },
   opts = {
      position = 'center',
      hl       = 'SecondColor'
   }
}

-- +--------------------------------------------------------------------+

-- Informacion de la fecha
local get_date = io.popen('echo "$(date +%a) $(date +%d) de $(date +%b)" | tr -d "\n"')
if get_date == nil then return end

local date = get_date:read('*a')
get_date:close()

local fecha = {
   type = 'text',
   val  = '  Hoy es ' .. date,
   opts = {
      position = 'center',
      hl       = 'FifthColor'
   }
}
-- +--------------------------------------------------------------------+

-- ┌                                                                    ┐
-- │                              Botones                               │
-- │               > Copiado del código fuente Alpha.nvim               │
-- └                                                                    ┘
local leader = 'SPC'

-- @param sc string
-- @param txt string
-- @param keybind string optional
-- @param keybind_opts table optional

local function button(sc, txt, keybind, keybind_opts)
   local sc_ = sc:gsub('%s', ''):gsub(leader, '<leader>')

   local opts = {
      position       = 'center',
      shortcut       = sc,
      cursor         = 5,
      width          = 50,
      align_shortcut = 'right',
      hl_shortcut    = 'FirstColor',
   }
   if keybind then
      keybind_opts = if_nil(keybind_opts, {
         noremap = true, silent = true, nowait = true
      })
      opts.keymap = { 'n', sc_, keybind, keybind_opts }
   end

   local function on_press()
      local key = vim.api.nvim_replace_termcodes(sc_ .. '<Ignore>', true, false, true)
      vim.api.nvim_feedkeys(key, 't', false)
   end

   return {
      type     = 'button',
      val      = txt,
      on_press = on_press,
      opts     = opts,
   }
end

dashboard.section.buttons.val = {
   button("<C-P>", ' ' .. " " .. "Buscar archivo", "<cmd>lua require('plugins.telescope').project_files()<CR>", {}),
   button("<S-P>", ' ' .. " " .. "Buscar palabra", "<cmd>lua require('plugins.telescope.pickers.multi-rg')()<CR>", {}),
   button("SPC s h", ' ' .. " " .. "Abrir achivo reciente", "<cmd>Telescope oldfiles hidden=true<CR>", {}),
   button("SPC / s d", ' ' .. " " .. "Abrir session reciente", "<cmd>SessionManager load_current_dir_session<CR>", {}),
   button("SPC / u", ' ' .. " " .. "Actualizar Plugins", "<cmd>PackerSync<CR>", {}),
   button("SPC / c", ' ' .. " " .. "Configuracion", "<cmd>e $MYVIMRC<CR>", {}),
   button("-", ' ' .. " " .. "Exit", "<cmd>exit<CR>", {}),
}
-- +--------------------------------------------------------------------+

-- datos de la version de Nvim
local function footer()
   local plugins = #vim.tbl_keys(packer_plugins)
   local v = vim.version()
   -- local ecovim_version = line_from(config_dir .. '/.ecovim.version')
   local value_str = 'NeoVim v%d.%d.%d -  %d Plugins'

   return string.format(value_str, v.major, v.minor, v.patch, plugins)
end

dashboard.section.footer.val = footer()
dashboard.section.footer.opts = {
   position = 'center',
   hl       = 'FourthColor',
}
-- +--------------------------------------------------------------------+

local section = {
   section_cabello = cabello,
   section_date    = fecha,
   buttons         = dashboard.section.buttons,
   section_nvim    = dashboard.section.footer,
}

local opts = {
   layout = {
      { type = 'padding', val = 1 },
      section.section_cabello,
      { type = 'padding', val = 1 },
      section.section_date,
      { type = 'padding', val = 1 },
      section.buttons,
      section.section_nvim,
   },
   opts = {
      margin = 5
   },
}

-- ╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┓
-- Setup
alpha.setup(opts)

-- ╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍┛

-- Ocultar las pestañas(buffer) y Bar estatus en la pantalla de inicio
vim.api.nvim_create_augroup('alpha_tabline', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
   group   = 'alpha_tabline',
   pattern = 'alpha',
   command = 'set showtabline=0 laststatus=0 noruler',
})

vim.api.nvim_create_autocmd('FileType', {
   group    = 'alpha_tabline',
   pattern  = 'alpha',
   callback = function()
      vim.api.nvim_create_autocmd('BufUnload', {
         group   = 'alpha_tabline',
         buffer  = 0,
         command = 'set showtabline=2 ruler laststatus=3',
      })
   end,
})
