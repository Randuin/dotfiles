local opt = {noremap = true, silent = true}

vim.api.nvim_set_keymap("n", "<Leader>fm", [[<Cmd> Neoformat<CR>]], opt)

local bind = require('utils.keymap')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_args = bind.map_args
-- require('keymap.config')

vim.cmd([[
  nnoremap [Space] <Nop>
  nmap  <Space> [Space]
  xmap  <Space> [Space]
  
  nnoremap [Space]t <cmd>Telescope find_files<cr>
  nnoremap [Space]/ <cmd>Telescope live_grep<cr>
]])

local plug_map = {
    ["i|<TAB>"] = map_cmd('v:lua.tab_complete()'):with_expr():with_silent(),
    ["i|<S-TAB>"] = map_cmd('v:lua.s_tab_complete()'):with_silent():with_expr(),
    -- ["i|<CR>"]       = map_cmd([[compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })]]):with_noremap():with_expr():with_nowait(),
    -- person keymap
    -- ["n|mf"]             = map_cr("<cmd>lua require('internal.fsevent').file_event()<CR>"):with_silent():with_nowait():with_noremap();
    -- ["n|gb"]             = map_cr("BufferLinePick"):with_noremap():with_silent(),
    -- Packer
    ["n|<leader>pu"] = map_cr("PackerUpdate"):with_silent():with_noremap()
        :with_nowait(),
    ["n|<leader>pi"] = map_cr("PackerInstall"):with_silent():with_noremap()
        :with_nowait(),
    ["n|<leader>pc"] = map_cr("PackerCompile"):with_silent():with_noremap()
        :with_nowait(),
    -- Lsp mapp work when insertenter and lsp start
    ["n|<leader>li"] = map_cr("LspInfo"):with_noremap():with_silent()
        :with_nowait(),
    ["n|<leader>ll"] = map_cr("LspLog"):with_noremap():with_silent()
        :with_nowait(),
    ["n|<leader>lr"] = map_cr("LspRestart"):with_noremap():with_silent()
        :with_nowait(),
    ["n|gD"] = map_cmd("<cmd>lua vim.lsp.buf.implementation()<CR>"):with_noremap()
        :with_silent(),
    ["n|gt"] = map_cmd("<cmd>lua vim.lsp.buf.type_definition()<CR>"):with_noremap()
        :with_silent(),
    ["n|<Leader>cw"] = map_cmd("<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"):with_noremap()
        :with_silent(),
    ["n|<Leader>ct"] = map_args("Template"),
    ["n|<Leader>tf"] = map_cu('DashboardNewFile'):with_noremap():with_silent(),
    -- Plugin nvim-tree
    ["n|<C-c>"] = map_cr('NvimTreeToggle'):with_noremap():with_silent(),
    ["n|<Leader>F"] = map_cr('NvimTreeFindFile'):with_noremap():with_silent(),
    -- Plugin MarkdownPreview
    ["n|<Leader>om"] = map_cu('MarkdownPreview'):with_noremap():with_silent(),
    -- Plugin DadbodUI
    ["n|<Leader>od"] = map_cr('DBUIToggle'):with_noremap():with_silent(),
    -- Far.vim
    ["n|<Leader>fz"] = map_cr('Farf'):with_noremap():with_silent(),
    ["v|<Leader>fz"] = map_cr('Farf'):with_noremap():with_silent(),
    -- Plugin Telescope
    ["n|<Leader>bb"] = map_cu('Telescope buffers'):with_noremap():with_silent(),
    ["n|<Leader>fa"] = map_cu('DashboardFindWord'):with_noremap():with_silent(),
    ["n|<Leader>fb"] = map_cu('Telescope file_browser'):with_noremap()
        :with_silent(),
    ["n|<Leader>ff"] = map_cu('Telescope find_files'):with_noremap()
        :with_silent(),
    ["n|<Leader>fg"] = map_cu('Telescope git_files'):with_noremap()
        :with_silent(),
    ["n|<Leader>fw"] = map_cu('Telescope grep_string'):with_noremap()
        :with_silent(),
    ["n|<Leader>fh"] = map_cu('DashboardFindHistory'):with_noremap()
        :with_silent(),
    ["n|<Leader>fl"] = map_cu('Telescope loclist'):with_noremap():with_silent(),
    ["n|<Leader>fc"] = map_cu('Telescope git_commits'):with_noremap()
        :with_silent(),
    ["n|<Leader>ft"] = map_cu('Telescope help_tags'):with_noremap()
        :with_silent(),
    ["n|<Leader>fd"] = map_cu('Telescope dotfiles path=' .. os.getenv("HOME") ..
                                  '/.dotfiles'):with_noremap():with_silent(),
    ["n|<Leader>fs"] = map_cu('Telescope gosource'):with_noremap():with_silent(),
    -- prodoc
    ["n|gcc"] = map_cu('ProComment'):with_noremap():with_silent(),
    ["x|gcc"] = map_cr('ProComment'),
    ["n|gcj"] = map_cu('ProDoc'):with_silent():with_silent(),
    -- Plugin acceleratedjk
    -- ["n|j"]              = map_cmd('v:lua.enhance_jk_move("j")'):with_silent():with_expr(),
    -- ["n|k"]              = map_cmd('v:lua.enhance_jk_move("k")'):with_silent():with_expr(),
    -- Plugin QuickRun
    ["n|<Leader>r"] = map_cr(
        "<cmd> lua require'internal.quickrun'.run_command()"):with_noremap()
        :with_silent(),
    -- Plugin Vista
    ["n|<Leader>v"] = map_cu('Vista'):with_noremap():with_silent(),
    -- Plugin vim-operator-surround
    ["n|sa"] = map_cmd("<Plug>(operator-surround-append)"):with_silent(),
    ["n|sd"] = map_cmd("<Plug>(operator-surround-delete)"):with_silent(),
    ["n|sr"] = map_cmd("<Plug>(operator-surround-reklace)"):with_silent()
    -- Plugin hrsh7th/vim-eft
    -- ["n|;"]              = map_cmd("v:lua.enhance_ft_move(';r)"):with_expr(),
    -- ["x|;"]              = map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
    -- ["n|f"]              = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    -- ["x|f"]              = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    -- ["o|f"]              = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    -- ["n|F"]              = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    -- ["x|F"]              = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    -- ["o|F"]              = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    -- Plugin vim_niceblock
    -- ["x|I"]              = map_cmd("v:lua.enhance_nice_block('I')"):with_expr(),
    -- ["x|gI"]             = map_cmd("v:lua.enhance_nice_block('gI')"):with_expr(),
    -- ["x|A"]              = map_cmd("v:lua.enhance_nice_block('A')"):with_expr(),
};

bind.nvim_load_mapping(plug_map)

vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
                        {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xw",
                        "<cmd>Trouble workspace_diagnostics<cr>",
                        {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xd",
                        "<cmd>Trouble document_diagnostics<cr>",
                        {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
                        {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
                        {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
                        {silent = true, noremap = true})
