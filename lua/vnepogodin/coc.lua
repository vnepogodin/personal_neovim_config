local Remap = require("vnepogodin.keymap")
local nnoremap = Remap.nnoremap

local augroup = vim.api.nvim_create_augroup
VnepogodinCocGroup = augroup('vnepogodin.coc', {})

local autocmd = vim.api.nvim_create_autocmd

vim.g.coc_global_extensions = {'coc-clangd'}
vim.g.coc_default_semantic_highlight_groups = 1

vim.cmd [[
augroup my_coc
    autocmd!

    let b:coc_diagnostic_disable = 1

    call coc#config('coc.source', {
    \ 'around': {'enable': 0},
    \ 'buffer': {'enable': 1},
    \})
    call coc#config('clangd.semanticHighlighting', 1)

augroup end
]]

nnoremap("<leader>gd", ":call CocActionAsync('jumpDefinition')<CR>")

-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
autocmd({"CursorHold"}, {
    group = VnepogodinCocGroup,
    pattern = "*",
    command = "silent call CocActionAsync('highlight')",
})

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-space> to trigger completion
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", function() _G.show_docs() end, {silent = true})

-- Symbol renaming
keyset("n", "<leader>rn", ":call CocActionAsync('rename')", {silent = false})
--keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- Update signature help on jump placeholder
autocmd("User", {
    group = VnepogodinCocGroup,
    pattern = "CocJumpPlaceholder",
    command = "silent call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})
