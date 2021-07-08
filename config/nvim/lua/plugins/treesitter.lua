return function()
  local prerequire = require'utils.prerequire'
  local config = prerequire'nvim-treesitter.configs'

  config.setup {
    ensure_installed = 'maintained',
    highlight = {
      enable = true,
    },
    indent = {
      enable = false,
    },
    context_commentstring = {
      enable = true,
    },
    autotag = {
      enable = true,
    }
  }
  vim.cmd[[set foldmethod=expr]]
  vim.cmd[[set foldexpr=nvim_treesitter#foldexpr()]]
  vim.cmd[[set nofoldenable]]
end
