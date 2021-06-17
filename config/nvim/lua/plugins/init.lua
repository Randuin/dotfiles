-- cmd 'packadd paq-nvim'
-- local paq = require('paq-nvim').paq  -- a convenient alias
-- paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself
-- paq { 'kyazdani42/nvim-web-devicons' }
-- paq { 'kyazdani42/nvim-tree.lua' }
-- paq {'shougo/deoplete-lsp'}
-- paq {'shougo/deoplete.nvim', run = fn['remote#host#UpdateRemotePlugins']}
-- paq {'nvim-treesitter/nvim-treesitter'}
-- paq {'neovim/nvim-lspconfig'}
-- paq {'ojroques/nvim-lspfuzzy'}
-- require 'paq-nvim' {
--   'savq/paq-nvim';                  -- Let Paq manage itself
--   'kyazdani42/nvim-web-devicons';
--   'kyazdani42/nvim-tree.lua';
--   -- 'neovim/nvim-lspconfig';          -- Mind the semi-colons
--   -- 'nvim-lua/completion-nvim';
--   -- 'nvim-lua/lsp_extensions.nvim';
-- 
--   -- {'lervag/vimtex', opt=true};      -- Use braces when passing options
-- 
--   -- {'dracula/vim', as='dracula'};    -- Use `as` to alias a package name (here `vim`)
-- }
local packer = require("packer")
local use = packer.use

local windows = function() return require'utils.environment'.isWindows() end

local tmux = function() return vim.fn.exists('$TMUX') == 1 end

local kitty = function() return vim.fn.exists('$KITTY_WINDOW_ID') == 1 end

return packer.startup(function()
    use 'wbthomason/packer.nvim'
    use 'svermeulen/vimpeccable'
    use "norcalli/nvim.lua"
    use "siduck76/nvim-base16.lua"
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
            config = require 'plugins.treesitter',
            disable = windows()
        }, {
            'JoosepAlviste/nvim-ts-context-commentstring',
            requires = 'nvim-treesitter/nvim-treesitter',
            disable = windows()
        }, {
            'windwp/nvim-ts-autotag',
            requires = 'nvim-treesitter/nvim-treesitter',
            disable = windows()
        }
    }
    use {
        'onsails/lspkind-nvim', 'neovim/nvim-lspconfig',
        'nvim-lua/lsp-status.nvim', 'glepnir/lspsaga.nvim', 'folke/trouble.nvim'
    }
    use "hrsh7th/nvim-compe"
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
end, {
    display = {
        border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
    }
})

