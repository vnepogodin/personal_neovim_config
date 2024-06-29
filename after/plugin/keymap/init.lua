local Remap = require("vnepogodin.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<leader>ghw", ":h <C-R>=expand(\"<cword>\")<CR><CR>")
nnoremap("<leader>bs", "/<C-R>=escape(expand(\"<cWORD>\"), \"/\")<CR><CR>")
nnoremap("<leader>h", ":wincmd h<CR>")
nnoremap("<leader>j", ":wincmd j<CR>")
nnoremap("<leader>k", ":wincmd k<CR>")
nnoremap("<leader>l", ":wincmd l<CR>")
nnoremap("<leader>pv", ":Ex<CR>")
nnoremap("<leader>+", ":vertical resize +5<CR>")
nnoremap("<leader>-", ":vertical resize -5<CR>")
nnoremap("<leader>rp", ":resize 100<CR>")
nnoremap("<leader>ee", "oif err != nil {<CR>log.Fatalf(\"%+v\\n\", err)<CR>}<CR><esc>kkI<esc>")
nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- greatest remap ever
xnoremap("<leader>p", "\"_dP")

-- Jump
inoremap("<C-s>", "<C-O>:update<CR>")
nnoremap("<C-s>", ":update<CR>")
nnoremap("<leader>s", ":update<CR>")
nnoremap("<leader>w", ":update<CR>")

-- Tree
nnoremap("<leader>ga", ":Git fetch --all<CR>")
nnoremap("<leader>grum", ":Git rebase upstream/master<CR>")
nnoremap("<leader>grom", ":Git rebase origin/master<CR>")

nmap("<leader>gh", ":diffget //3<CR>")
nmap("<leader>gu", ":diffget //2<CR>")
nmap("<leader>gs", ":G<CR>")
nnoremap("<C-p>", ":GFiles<CR>")

-- Quit
inoremap("<C-Q>", "<esc>:q<CR>")
nnoremap("<C-Q>", ":q<CR>")
vnoremap("<C-Q>", "<esc>")

-- Build
nnoremap("<leader>cg", ":CMakeGenerate<CR>")
nnoremap("<leader>cb", ":CMakeBuild<CR>")
nnoremap("<leader>ci", ":CMakeInstall<CR>")
nnoremap("<leader>cs", ":CMakeSwitch<CR>")
nnoremap("<leader>cq", ":CMakeClose<CR>")

nnoremap("<leader>sw", ":ToggleWorkspace<CR>")
