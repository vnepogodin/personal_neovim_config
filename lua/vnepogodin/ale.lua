
vim.g.ale_c_build_dir_names = {'build'}
vim.g.ale_cpp_cc_options = '-std=c++2b -Wall -Wextra'

vim.cmd [[
  let g:ale_linters = {
  \   'cpp': ['cppcheck', 'flawfinder', 'g++', 'clangtidy'],
  \   'c': ['cppcheck', 'flawfinder', 'gcc'],
  \   'rust': ['cargo', 'analyzer'],
  \   'javascript': ['eslint', 'flow']
  \}
  let g:ale_fixers = {
  \   '*': ['trim_whitespace'],
  \   'rust': ['rustfmt'],
  \   'cpp': ['clangtidy', 'clang-format'],
  \   'c': ['clang-format']
  \}
]]

vim.g.ale_cpp_clangtidy_checks = {'-cppcoreguidelines-*','-hicpp-*','-misc-*','-modernize-*','-readability-*','-performance-*','-bugprone-*'}
-- C lang
--vim.g.ale_c_cppcheck_options = '--enable=style --addon=threadsafety.py --addon=$HOME/.config/nvim/misra.json'
vim.g.ale_c_cppcheck_options = '--enable=style --addon=threadsafety.py'
vim.g.ale_c_flawfinder_minlevel = 3

-- Cpp lang
--vim.g.ale_cpp_cppcheck_options = '--enable=style --addon=threadsafety.py --addon=$HOME/.config/nvim/misra.json'
vim.g.ale_cpp_cppcheck_options = '--enable=style --addon=threadsafety.py'
vim.g.ale_cpp_flawfinder_minlevel = 3
