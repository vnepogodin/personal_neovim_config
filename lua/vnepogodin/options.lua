local options = {
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines

  exrc = true,

  secure = true,
  wrap = false,                            -- display lines as one long line

  encoding = "utf-8",                      -- the encoding written to a file

  splitright = true,
  autoindent = true,
  smartindent = true,                      -- make indenting smarter again
  scrolloff = 8,
  tabstop = 4,                             -- insert 4 spaces for a tab
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  softtabstop = 4,                         -- insert 4 spaces for a tab
  expandtab = true,
  smarttab = true,

  backspace = "indent,eol,start",
  history = 1000,
  autowrite = true,

  incsearch = true,                        -- enable incremental search
  hlsearch = true,                         -- highlight all matches on previous search pattern
  smartcase = true,                        -- smart case

  wildmode = "longest,list,full",
  wildmenu = true,

  termguicolors = true,                    -- set term gui colors (most terminals support this)
}

vim.opt.path:append "**"

-- Disable perl and ruby nvim providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append "c"

-- Ignore files
vim.opt.wildignore:append "*.o"
vim.opt.wildignore:append "*.pyc"
vim.opt.wildignore:append "*build/*"
vim.opt.wildignore:append "**/coverage/*"
vim.opt.wildignore:append "**/node_modules/*"
vim.opt.wildignore:append "**/android/*"
vim.opt.wildignore:append "**/ios/*"
vim.opt.wildignore:append "**/.git/*"

vim.g.html_font = "Hack"
vim.g.asmsyntax = "nasm"
if vim.fn.executable('rg') then
    vim.g.rg_derive_root = 'true'
end


vim.cmd [[
  filetype plugin on
  filetype indent on
]]

vim.cmd 'com! W w'

-- vim.cmd [[
--   syntax enable
--   set nocompatible
--   silent! set cryptmethod=blowfish2
-- ]]

-- use space as a the leader key
vim.g.mapleader = " "
vim.g.loaded_matchparen = 1

for k, v in pairs(options) do
  vim.opt[k] = v
end
