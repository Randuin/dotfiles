local lspconfig = require('lspconfig')
local trouble = require('trouble')
local lsp_status = require('lsp-status')
local saga = require('lspsaga')
local lspkind = require('lspkind')
local lsp = vim.lsp
local buf_keymap = vim.api.nvim_buf_set_keymap
local cmd = vim.cmd

local kind_symbols = {
    Text = '',
    Method = 'Ƒ',
    Function = 'ƒ',
    Constructor = '',
    Variable = '',
    Class = '',
    Interface = 'ﰮ',
    Module = '',
    Property = '',
    Unit = '',
    Value = '',
    Enum = '了',
    Keyword = '',
    Snippet = '﬌',
    Color = '',
    File = '',
    Folder = '',
    EnumMember = '',
    Constant = '',
    Struct = ''
}

local sign_define = vim.fn.sign_define
sign_define('LspDiagnosticsSignError', {text = '', numhl = 'RedSign'})
sign_define('LspDiagnosticsSignWarning', {text = '', numhl = 'YellowSign'})
sign_define('LspDiagnosticsSignInformation', {text = '', numhl = 'WhiteSign'})
sign_define('LspDiagnosticsSignHint', {text = '', numhl = 'BlueSign'})
lsp_status.config {
    kind_labels = kind_symbols,
    select_symbol = function(cursor_pos, symbol)
        if symbol.valueRange then
            local value_range = {
                ['start'] = {
                    character = 0,
                    line = vim.fn.byte2line(symbol.valueRange[1])
                },
                ['end'] = {
                    character = 0,
                    line = vim.fn.byte2line(symbol.valueRange[2])
                }
            }

            return require('lsp-status/util').in_range(cursor_pos, value_range)
        end
    end,
    current_function = false
}

lsp_status.register_progress()
lspkind.init {symbol_map = kind_symbols}
trouble.setup()
lsp.handlers['textDocument/publishDiagnostics'] =
    lsp.with(lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
        update_in_insert = false,
        underline = true
    })
saga.init_lsp_saga {use_saga_diagnostic_sign = false}
local keymap_opts = {noremap = true, silent = true}
local function on_attach(client)
    lsp_status.on_attach(client)

    buf_keymap(0, 'n', 'gh',
               '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', 'K',
               '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', 'gS',
               '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', 'gTD', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', '<leader>rn',
               '<cmd>lua require("lspsaga.rename").rename()<CR>', keymap_opts)
    buf_keymap(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', 'gA',
               '<cmd>lua require("lspsaga.codeaction").code_action()<CR>',
               keymap_opts)
    buf_keymap(0, 'v', 'gA',
               ':<C-U>lua require("lspsaga.codeaction").range_code_action()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', ']e',
               '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<cr>',
               keymap_opts)
    buf_keymap(0, 'n', '[e',
               '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<cr>',
               keymap_opts)

    if client.resolved_capabilities.document_formatting then
        buf_keymap(0, 'n', '<leader>lf',
                   '<cmd>lua vim.lsp.buf.formatting()<cr>', keymap_opts)
    end

    if client.resolved_capabilities.document_highlight == true then
        cmd('augroup lsp_aucmds')
        cmd('au CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
        cmd(
            'au CursorHold <buffer> lua require("lspsaga.diagnostic").show_cursor_diagnostics()')
        cmd('au CursorMoved <buffer> lua vim.lsp.buf.clear_references()')
        cmd('augroup END')
    end
end

local servers = {
    bashls = {},
    cssls = {
        filetypes = {"css", "scss", "less", "sass"},
        root_dir = lspconfig.util.root_pattern("package.json", ".git")
    },
    ghcide = {},
    html = {},
    jsonls = {cmd = {'json-languageserver', '--stdio'}},
    pyright = {settings = {python = {formatting = {provider = 'yapf'}}}},
    rust_analyzer = {},
    tsserver = {},
    vimls = {}
}

local snippet_capabilities = {
    textDocument = {completion = {completionItem = {snippetSupport = true}}}
}

for server, config in pairs(servers) do
    if type(config) == 'function' then config = config() end
    config.on_attach = on_attach
    config.capabilities = vim.tbl_deep_extend('keep', config.capabilities or {},
                                              lsp_status.capabilities,
                                              snippet_capabilities)
    lspconfig[server].setup(config)
end
