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

return packer.startup(function()
    use 'wbthomason/packer.nvim'
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
    use 'nvim-treesitter/nvim-treesitter'
    use {'neovim/nvim-lspconfig', opt=false}
    use "hrsh7th/nvim-compe"
    use "onsails/lspkind-nvim"
    use 'sbdchd/neoformat'
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require('gitsigns').setup() end
    }
    use 'kabouzeid/nvim-lspinstall'

    -- Lazy loading:
    -- Load on specific commands
    -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

    -- Load on an autocommand event
    -- use {'andymass/vim-matchup', event = 'VimEnter'}
end, {
    display = {
        border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
    }
} -- Default to using opt (as opposed to start) plugins
)

