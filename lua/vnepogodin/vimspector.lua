local Remap = require("vnepogodin.keymap")
local nnoremap = Remap.nnoremap
local nmap = Remap.nmap

vim.g.vimspector_install_gadgets = { 'debugpy', 'vscode-cpptools', 'CodeLLDB' }
vim.g.vimspector_enable_mappings = 'HUMAN'

function GotoWindow(id)
    vim.fn['win_gotoid'](id)
    vim.fn['MaximizerToggle']()
end

-- Debugger remaps
nnoremap("<leader>dd", ":call vimspector#Launch()<CR>")
nnoremap("<leader>dc", ":call GotoWindow(vim.g.vimspector_session_windows.code)<CR>")
nnoremap("<leader>dt", ":call GotoWindow(vim.g.vimspector_session_windows.tagpage)<CR>")
nnoremap("<leader>dv", ":call GotoWindow(vim.g.vimspector_session_windows.variables)<CR>")
nnoremap("<leader>dw", ":call GotoWindow(vim.g.vimspector_session_windows.watches)<CR>")
nnoremap("<leader>ds", ":call GotoWindow(vim.g.vimspector_session_windows.stack_trace)<CR>")
nnoremap("<leader>do", ":call GotoWindow(vim.g.vimspector_session_windows.output)<CR>")
nnoremap("<leader>de", ":call vimspector#Reset()<CR>")

nnoremap("<leader>dtcb", ":call vimspector#ClearLineBreakpoint()<CR>")

-- Evaluate expression under cursor (or visual) in popup
nmap("<leader><C-s>de", "<Plug>VimspectorBalloonEval")

nmap("<leader>dl", "<Plug>VimspectorStepInto")
nmap("<leader>dl", "<Plug>VimspectorStepInto")
nmap("<leader>dj", "<Plug>VimspectorStepOver")
nmap("<leader>dk", "<Plug>VimspectorStepOut")
nmap("<leader>d_", "<Plug>VimspectorRestart")
nnoremap("<leader>d<space>", ":call vimspector#Continue()<CR>")

nmap("<leader>drc", "<Plug>VimspectorRunToCursor")
nmap("<leader>dbp", "<Plug>VimspectorToggleBreakpoint")
nmap("<leader>dcbp", "<Plug>VimspectorToggleConditionalBreakpoint")

-- <Plug>VimspectorStop
-- <Plug>VimspectorPause
-- <Plug>VimspectorAddFunctionBreakpoint
