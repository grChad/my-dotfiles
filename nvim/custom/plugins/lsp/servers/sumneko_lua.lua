local M = {}

M.settings = {
  Lua = {
    runtime = {
      version = 'LuaJIT',
    },
    diagnostics = {
      globals = { "vim" },
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file('', true),
      checkThirdParty = false,
      maxPreload = 100000,
      preloadFileSize = 10000, -- omita archivos que pesen mas de esto al cargar
    },
    telemetry = {
      enable = false,
    },
  },
}

return M
