local packer = require("packer")
local use = packer.use

local tmux = function() return vim.fn.exists('$TMUX') == 1 end
local kitty = function() return vim.fn.exists('$KITTY_WINDOW_ID') == 1 end

return packer.startup(function()
    use 'wbthomason/packer.nvim'
    use 'svermeulen/vimpeccable'
    use "norcalli/nvim.lua"
    use "norcalli/nvim-colorizer.lua"
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({
                disable_filetype = {"TelescopePrompt", "vim"}
            })
        end
    }
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    -------------
    -- Treesitter
    -------------
    use {
        {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = require 'plugins.treesitter'
        }, {
            'JoosepAlviste/nvim-ts-context-commentstring',
            requires = 'nvim-treesitter/nvim-treesitter'
        },
        {'windwp/nvim-ts-autotag', requires = 'nvim-treesitter/nvim-treesitter'}
    }
    use {
        'neovim/nvim-lspconfig',
        'onsails/lspkind-nvim',
        'nvim-lua/lsp-status.nvim',
        'glepnir/lspsaga.nvim',
        'folke/trouble.nvim'
    }
    use 'kabouzeid/nvim-lspinstall'
    use "hrsh7th/nvim-compe"
    use "cespare/vim-toml"
    use 'sbdchd/neoformat'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require('gitsigns').setup() end
    }
    use 'folke/tokyonight.nvim'
    use 'yashguptaz/calvera-dark.nvim'
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
end, {
    display = {
        border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
    }
})

