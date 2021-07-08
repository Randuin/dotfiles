vim.g.calvera_italic_keywords = false
vim.g.calvera_borders = true
vim.g.calvera_contrast = true
vim.g.calvera_hide_eob = true
vim.g.calvera_custom_colors = {contrast = "#0f111a"}

-- Required Setting
require('calvera').set()

local saga = require 'lspsaga'
saga.init_lsp_saga()
-- vim.api.nvim_eval('nnoremap <silent> gh :Lspsaga lsp_finder<CR>')
