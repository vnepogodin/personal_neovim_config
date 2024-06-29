local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    print("Installing packer close and reopen Neovim...")
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    git = { depth = 1, clone_timeout = 1800, },
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    use("wbthomason/packer.nvim")
    -- use("sbdchd/neoformat")

    -- Themes
    use("Luxed/ayu-vim")
    -- use("gruvbox-community/gruvbox")
    use('vim-airline/vim-airline-themes')
    --use {
    --  "Pocco81/true-zen.nvim",
    --  ft = {"markdown"},
    --  config = function()
    --     require("true-zen").setup {}
    --  end
    --}
    use {
      "junegunn/goyo.vim",
      ft = {"markdown"},
      requires = {
         "junegunn/limelight.vim",
       },
       config = function()
         vim.g.goyo_height = 87
       end
    }
    -- use("folke/tokyonight.nvim")

    -- On-demand loading
    use("petRUShka/vim-opencl")
    use("mg979/vim-visual-multi")
    use {
      "thaerkh/vim-workspace",
      config = function()
        vim.g.workspace_persist_undo_history = 0
      end
    }
    use {
      "puremourning/vimspector",
      ft = { "cpp", "c" },
      config = function()
        require("vnepogodin.vimspector")
      end
    }
    use("szw/vim-maximizer")
    use("vim-airline/vim-airline")
    use("glts/vim-radical")
    use{"jackguo380/vim-lsp-cxx-highlight", ft = {'cpp'}}
    use {
      "bfrg/vim-cpp-modern",
      ft = {'cpp'},
      config = function()
        vim.g.cpp_attributes_highlight = 1
        vim.g.cpp_member_highlight = 1
        vim.g.cpp_simple_highlight = 1
      end
    }
    use{"rust-lang/rust.vim", ft = {'rust'}}
    use("tpope/vim-surround")
    use("jiangmiao/auto-pairs")
    --use {
    --    "windwp/nvim-autopairs",
    --    config = function() require("nvim-autopairs").setup({ map_cr = true }) end
    --}
    use {
      "dense-analysis/ale",
      config = function() require("vnepogodin.ale") end
    }
    use {
      "cdelledonne/vim-cmake",
      ft = {'cmake'},
      config = function()
        vim.g.cmake_link_compile_commands = 1
        vim.g.cmake_generate_options = {'-G Ninja'}
        vim.g.cmake_build_dir_location = 'build'
        vim.g.cmake_build_options = {'--parallel 10'}
      end
    }
    use("rajasegar/vim-astro")
    use("junegunn/fzf.vim")
    use{"kkoomen/vim-doge", run = function() vim.fn['doge#install'](0) end }
    use {
      "neoclide/coc.nvim",
      branch = 'release',
      config = function()
        require("vnepogodin.coc")
      end
    }
    use {
      "p00f/godbolt.nvim",
      branch = 'main',
      config = function()
        require("godbolt").setup({
            languages = {
                c = { compiler = "cgsnapshot", options = {} },
                cpp = { compiler = "gsnapshot", options = { libraries = { { id = "range-v3", version = "trunk" }, { id = "fmt", version = "trunk" } } } },
                rust = { compiler = "nightly", options = {} },
                -- any_additional_filetype = { compiler = ..., options = ... },
            },
            quickfix = {
                enable = false, -- whether to populate the quickfix list in case of errors
                auto_open = false -- whether to open the quickfix list in case of errors
            },
            url = "https://godbolt.org" -- can be changed to a different godbolt instance
        })
      end
    }
    -- use{"github/copilot.vim", ft = {'cpp', 'c', 'python', 'rust', 'dart'}}

    use{"plasticboy/vim-markdown", ft = {'markdown'}}
    -- use {'iamcco/markdown-preview.nvim', ft = {'markdown'}, run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

    -- Git
    use {
      'tpope/vim-fugitive',
       cmd = {
         'G', 'Git',
         'Ggrep',
         'Gdiffsplit',
         'GBrowse'
       }
    }
    use {
      'lewis6991/gitsigns.nvim',
       config = function()
         require("vnepogodin.gitsigns")
       end
    }

    use("tpope/vim-rhubarb")
    --[[use {
      "mhinz/vim-signify",
      config = function()
        vim.g.signify_vcs_list = {'git'}
        vim.g.signify_skip_filetype = { journal = 1 }
        vim.g.signify_sign_add          = '│'
        vim.g.signify_sign_change       = '│'
        vim.g.signify_sign_changedelete = '│'
      end
    }]]

end)

