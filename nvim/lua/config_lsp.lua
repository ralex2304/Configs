local attach_opts = { silent = true, buffer = bufnr }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, attach_opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, attach_opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, attach_opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, attach_opts)
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, attach_opts)
vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, attach_opts)
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, attach_opts)
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, attach_opts)
vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, attach_opts)
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, attach_opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, attach_opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, attach_opts)
vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_references, attach_opts)

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = { 'clangd', 'pyright' }
for _, lsp in ipairs(servers) do
	require('lspconfig')[lsp].setup {
		capabilities = capabilities,
	}
end

require'lspconfig'.verible.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = function() return vim.uv.cwd() end
}
