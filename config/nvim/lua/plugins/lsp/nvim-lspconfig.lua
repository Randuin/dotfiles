-- local lspconfig = require('lspconfig')
-- local trouble = require('trouble')
-- local lsp_status = require('lsp-status')
-- local lsp = vim.lsp
-- local handlers = lsp.handlers
-- local buf_keymap = vim.api.nvim_buf_set_keymap
-- local cmd = vim.cmd
-- require'cmp'.setup {
--   sources = {
--     { name = 'nvim_lsp' }
--   }
-- }
-- local kind_symbols = {
--     Text = '',
--     Method = 'Ƒ',
--     Function = 'ƒ',
--     Constructor = '',
--     Variable = '',
--     Class = '',
--     Interface = 'ﰮ',
--     Module = '',
--     Property = '',
--     Unit = '',
--     Value = '',
--     Enum = '了',
--     Keyword = '',
--     Snippet = '﬌',
--     Color = '',
--     File = '',
--     Folder = '',
--     EnumMember = '',
--     Constant = '',
--     Struct = ''
-- }
-- local sign_define = vim.fn.sign_define
-- sign_define('LspDiagnosticsSignError', {text = '', numhl = 'RedSign'})
-- sign_define('LspDiagnosticsSignWarning', {text = '', numhl = 'YellowSign'})
-- sign_define('LspDiagnosticsSignInformation', {text = '', numhl = 'WhiteSign'})
-- sign_define('LspDiagnosticsSignHint', {text = '', numhl = 'BlueSign'})
-- lsp_status.config {
--     kind_labels = kind_symbols,
--     select_symbol = function(cursor_pos, symbol)
--         if symbol.valueRange then
--             local value_range = {
--                 ['start'] = {
--                     character = 0,
--                     line = vim.fn.byte2line(symbol.valueRange[1])
--                 },
--                 ['end'] = {
--                     character = 0,
--                     line = vim.fn.byte2line(symbol.valueRange[2])
--                 }
--             }
--             return require('lsp-status/util').in_range(cursor_pos, value_range)
--         end
--     end,
--     current_function = false
-- }
-- lsp_status.register_progress()
-- require('lspkind').init({
--     -- DEPRECATED (use mode instead): enables text annotations
--     --
--     -- default: true
--     -- with_text = true,
--     -- defines how annotations are shown
--     -- default: symbol
--     -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
--     mode = 'symbol_text',
--     -- default symbol map
--     -- can be either 'default' (requires nerd-fonts font) or
--     -- 'codicons' for codicon preset (requires vscode-codicons font)
--     --
--     -- default: 'default'
--     preset = 'codicons',
--     -- override preset symbols
--     --
--     -- default: {}
--     symbol_map = {
--       Text = "",
--       Method = "",
--       Function = "",
--       Constructor = "",
--       Field = "ﰠ",
--       Variable = "",
--       Class = "ﴯ",
--       Interface = "",
--       Module = "",
--       Property = "ﰠ",
--       Unit = "塞",
--       Value = "",
--       Enum = "",
--       Keyword = "",
--       Snippet = "",
--       Color = "",
--       File = "",
--       Reference = "",
--       Folder = "",
--       EnumMember = "",
--       Constant = "",
--       Struct = "פּ",
--       Event = "",
--       Operator = "",
--       TypeParameter = ""
--     },
-- })
-- trouble.setup()
-- lsp.handlers['textDocument/publishDiagnostics'] =
--     lsp.with(lsp.diagnostic.on_publish_diagnostics, {
--         virtual_text = false,
--         signs = true,
--         update_in_insert = false,
--         underline = true
--     })
-- local keymap_opts = {noremap = true, silent = true}
-- local function on_attach(client)
--     lsp_status.on_attach(client)
--     buf_keymap(0, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',
--                keymap_opts)
--     buf_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
--                keymap_opts)
--     buf_keymap(0, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',
--                keymap_opts)
--     buf_keymap(0, 'n', 'gTD', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
--                keymap_opts)
--     buf_keymap(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>',
--                keymap_opts)
--     if client.resolved_capabilities.document_formatting then
--         buf_keymap(0, 'n', '<leader>lf',
--                    '<cmd>lua vim.lsp.buf.formatting()<cr>', keymap_opts)
--     end
--     if client.resolved_capabilities.document_highlight == true then
--         cmd('augroup lsp_aucmds')
--         cmd('au CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
--         cmd('au CursorMoved <buffer> lua vim.lsp.buf.clear_references()')
--         cmd('augroup END')
--     end
-- end
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
-- for _, server in ipairs({
--     -- "bashls",
--     -- "ccls",
--     -- "eslint",
--     -- "jsonls",
--     -- "styleua",
--     "null-ls",
--     -- "pyright",
--     -- "sumneko_lua",
--     -- "tsserver",
-- }) do
--     require("plugins.lsp." .. server).setup(on_attach, capabilities)
-- end
-- local pop_opts = { border = "rounded", max_width = 80 }
-- handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
-- handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = {
  noremap = true,
  silent = true
}
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = {
    noremap = true,
    silent = true,
    buffer = bufnr
  }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150
}
require('lspconfig')['pyright'].setup {
  on_attach = on_attach,
  flags = lsp_flags
}
require('lspconfig')['tsserver'].setup {
  on_attach = on_attach,
  flags = lsp_flags
}
require('lspconfig')['rust_analyzer'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  -- Server-specific settings...
  settings = {
    ["rust-analyzer"] = {}
  }
}
