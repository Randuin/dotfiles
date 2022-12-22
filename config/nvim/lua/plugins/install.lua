local packer = require("packer")
local use = packer.use

local tmux = function()
  return vim.fn.exists("$TMUX") == 1
end
local kitty = function()
  return vim.fn.exists("$KITTY_WINDOW_ID") == 1
end

return packer.startup(function()
  use("wbthomason/packer.nvim")

  local config = function(name)
    return string.format("require('plugins.%s')", name)
  end

  local use_with_config = function(path, name)
    use({
      path,
      config = config(name)
    })
  end

  use("svermeulen/vimpeccable")
  use("tpope/vim-sleuth") -- detects indentation
  use("norcalli/nvim.lua")
  use("norcalli/nvim-colorizer.lua")
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = {"TelescopePrompt", "vim"}
      })
    end
  })
  use("kyazdani42/nvim-web-devicons")
  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({})
    end
  })

  use({'neovim/nvim-lspconfig', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline',
       'hrsh7th/nvim-cmp'})

  use({"jose-elias-alvarez/null-ls.nvim"})

  -------------
  -- Treesitter
  -------------
  use({{
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = require("plugins.treesitter")
  }, {
    "JoosepAlviste/nvim-ts-context-commentstring",
    requires = "nvim-treesitter/nvim-treesitter"
  }, {
    "windwp/nvim-ts-autotag",
    requires = "nvim-treesitter/nvim-treesitter"
  }})

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        auto_open = false,
        use_diagnostic_signs = true -- en
      }
    end
  }
  use({"MaxMEllon/vim-jsx-pretty", "peitalin/vim-jsx-typescript", "alampros/vim-styled-jsx"})
  use("github/copilot.vim")
  -- use("sbdchd/neoformat")
  use({
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
  })
  use({
    "lewis6991/gitsigns.nvim",
    requires = {"nvim-lua/plenary.nvim"},
    config = function()
      require("gitsigns").setup()
    end
  })
  use("folke/tokyonight.nvim")
  use("yashguptaz/calvera-dark.nvim")
  use 'bluz71/vim-nightfly-guicolors'
  use("nvim-lualine/lualine.nvim")
end, {
  display = {
    border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
  }
})
