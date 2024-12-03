vim.cmd [[colorscheme nightfly]]

vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = "single"
    }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signatureHelp, {
        border = "single"
    }
)
vim.diagnostic.config({ float = { border = "single" } })

require('rainbow-delimiters.setup').setup{}
