local lspconfig = require('lspconfig')
local trouble = require('trouble')
local lsp_status = require('lsp-status')
local lsp = vim.lsp
local handlers = lsp.handlers
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

require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})

trouble.setup()
lsp.handlers['textDocument/publishDiagnostics'] =
    lsp.with(lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
        update_in_insert = false,
        underline = true
    })
local keymap_opts = {noremap = true, silent = true}
local function on_attach(client)
    lsp_status.on_attach(client)

    buf_keymap(0, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', 'gTD', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>',
               keymap_opts)
    if client.resolved_capabilities.document_formatting then
        buf_keymap(0, 'n', '<leader>lf',
                   '<cmd>lua vim.lsp.buf.formatting()<cr>', keymap_opts)
    end

    if client.resolved_capabilities.document_highlight == true then
        cmd('augroup lsp_aucmds')
        cmd('au CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
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

local pop_opts = { border = "rounded", max_width = 80 }
handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)
