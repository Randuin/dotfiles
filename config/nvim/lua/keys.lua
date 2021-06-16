local opt = {noremap = true, silent = true}

vim.api.nvim_set_keymap("n", "<Leader>fm", [[<Cmd> Neoformat<CR>]], opt)
