local opt = {noremap = true, silent = true}

vim.api.nvim_set_keymap("n", "<Leader>fm", [[<Cmd> Neoformat<CR>]], opt)

nvim = require 'nvim'
local base16 = require 'base16'
base16(base16.themes["onedark"], true)
