vim.g.calvera_italic_keywords = true
vim.g.calvera_borders = true
vim.g.calvera_contrast = true
vim.g.calvera_hide_eob = true
vim.g.calvera_custom_colors = {contrast = "#0f111a"}

local opt = vim.opt

-- Required Setting
-- require('calvera').set()

-- local saga = require 'lspsaga'
-- saga.init_lsp_saga()
-- vim.api.nvim_eval('nnoremap <silent> gh :Lspsaga lsp_finder<CR>')

opt.expandtab = true
opt.hidden = true
opt.ignorecase = true
opt.joinspaces = false
opt.shiftwidth = 2
opt.number = true
opt.smartindent = true

vim.g.tokyonight_style = "day"
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
vim.o.termguicolors = true
vim.cmd[[colorscheme calvera]]
