local F = {}

function F.hl_search(blinktime)
   local ns = vim.api.nvim_create_namespace("search")
   vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)

   local search_pat = "\\c\\%#" .. vim.fn.getreg("/")
   local m = vim.fn.matchadd("IncSearch", search_pat)
   vim.cmd("redraw")
   vim.cmd("sleep " .. blinktime * 1000 .. "m")

   local sc = vim.fn.searchcount()
   vim.api.nvim_buf_set_extmark(0, ns, vim.api.nvim_win_get_cursor(0)[1] - 1, 0, {
      virt_text = { { "[" .. sc.current .. "/" .. sc.total .. "]", "Comment" } },
      virt_text_pos = "eol",
   })

   vim.fn.matchdelete(m)
   vim.cmd("redraw")
end

-- +--------------------------------------------------------------------+

function F.spell_toggle()
   if vim.o.spell then
      vim.o.spell = false
      vim.notify("  Deshabilitando Spellchecking ... 😭😭")
   else
      vim.o.spell = true
      vim.notify("  Habilitando Spellchecking ... 😃😃")
   end
end

-- +--------------------------------------------------------------------+
local increment_map = {}

local generate = function(loop_list, capitalize)
   local do_capitalize = capitalize or false

   for i = 1, #loop_list do
      local current = loop_list[i]
      local next = loop_list[i + 1] or loop_list[1]

      increment_map[current] = next

      if do_capitalize then
         local capitalized_current = current:gsub("^%l", string.upper)
         local capitalized_next = next:gsub("^%l", string.upper)

         increment_map[capitalized_current] = capitalized_next
      end
   end
end

-- Booleanos
generate({ "true", "false" }, true)
generate({ "yes", "no" }, true)
generate({ "on", "off" }, true)

function F.toggle_bool()
   local under_cursor = vim.fn.expand("<cword>")
   local match = false or increment_map[under_cursor]

   if match ~= nil then
      return vim.cmd(":normal ciw" .. match)
   end

   return vim.cmd(":normal!" .. vim.v.count .. "")
end

return F
