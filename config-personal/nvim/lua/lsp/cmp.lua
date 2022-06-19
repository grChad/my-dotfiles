-- nvim-cmp setup
local cmp = require 'cmp'
if not cmp then
    return
end

-- luasnip setup
local luasnip = require 'luasnip'

--   פּ ﯟ   some other good icons
local kind_icons = {
    Text = '  ',
    Method = ' m ',
    Function = '  ',
    Constructor = '  ',
    Field = '  ',
    Variable = '  ',
    Class = '  ',
    Interface = '  ',
    Module = '  ',
    Property = '  ',
    Unit = '  ',
    Value = '  ',
    Enum = '  ',
    Keyword = '  ',
    Snippet = '  ',
    Color = '  ',
    File = '  ',
    Reference = '  ',
    Folder = '  ',
    EnumMember = '  ',
    Constant = '  ',
    Struct = '  ',
    Event = '  ',
    Operator = '  ',
    TypeParameter = '  ',
}

cmp.setup {
    snippet = {
        expand = function(args)
            if not luasnip then
                return
            end
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        { name = "buffer" },
        { name = 'nvim_lsp' },
        { name = "nvim_lua" },
        { name = "path" },
        { name = 'luasnip', option = { use_show_condition = false } },
    },

    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
            else
                fallback()
            end
        end,
    },

    formatting = {
        format = function(entry, vim_item)
            -- vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
            })[entry.source.name]
            return vim_item
        end,
    },

    window = {
        -- todo esto habilita la documentacion y los border por delante.
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    completion = {
        keyword_length = 1,
    },

    view = {
        ghost_text = true,
        entries = 'native',
    },
}
