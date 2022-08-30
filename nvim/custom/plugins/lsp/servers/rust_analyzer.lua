local M = {}

M.settings = {
   Rust = {
      assist = {
         importGranularity = "module",
         importPrefix = "by_self",
      },
      cargo = {
         loadOutDirsFromCheck = true
      },
      procMacro = {
         enable = true
      },
   },
}

return M
