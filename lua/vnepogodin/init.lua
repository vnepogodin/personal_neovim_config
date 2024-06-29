require("vnepogodin.options")
require("vnepogodin.packer")
-- require("plugins")

local augroup = vim.api.nvim_create_augroup
VnepogodinGroup = augroup('vnepogodin', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd({"StdinReadPre"}, {
    group = VnepogodinGroup,
    pattern = "*",
    callback = function()
        vim.cmd 'let s:std_in=1'
    end
})

autocmd({"VimEnter"}, {
    group = VnepogodinGroup,
    pattern = "*",
    callback = function()
        vim.cmd 'if argc() == 0 && !exists("s:std_in") | endif'
    end
})

autocmd({"BufWritePre"}, {
    group = VnepogodinGroup,
    pattern = "*",
    callback = function()
        vim.cmd '%s/\\s\\+$//e | :retab'
    end
})

autocmd({"BufAdd"}, {
    group = VnepogodinGroup,
    pattern = "*",
    callback = function()
    vim.cmd [[
          if getfsize(expand('<afile>')) > 1024*1024 |
            \ let b:coc_enabled=0 |
            \ endif
    ]]
    end
})
