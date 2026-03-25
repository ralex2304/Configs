local attach_opts = { silent = true, buffer = bufnr }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, attach_opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, attach_opts)
vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({ border = 'single' }) end, attach_opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, attach_opts)
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, attach_opts)
vim.keymap.set('n', '<C-s>', function() vim.lsp.buf.signature_help({ border = 'single' }) end, attach_opts)
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, attach_opts)
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, attach_opts)
vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, attach_opts)
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, attach_opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, attach_opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, attach_opts)
vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_references, attach_opts)

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = { 'clangd', 'pyright', 'asm_lsp', 'cmake', 'glsl_analyzer'}
for _, lsp in ipairs(servers) do
	vim.lsp.config(lsp, {
		capabilities = capabilities,
	})
end

vim.lsp.config("slang-server", {
  cmd = { "slang-server" },
  root_markers = { ".git", ".slang" },
  filetypes = {
    "systemverilog",
    "verilog",
  },
})
vim.lsp.enable("slang-server")

vim.filetype.add({
    extension = {
        v = 'verilog',
        vh = 'verilog',
        nasm = 'asm',
        s = 'asm',
        vs = 'glsl',
        fs = 'glsl'
    },
    filename = {
        ['CMakeLists.txt'] = 'cmake',
    },
})

require('nvim-treesitter').install {
    "c", "cpp", "python", "verilog", "latex", "markdown", "comment", "make", "cmake", "lua", "nasm",
}

require("jupynium").setup({})

vim.keymap.set('n', '<leader>ja', '<cmd>JupyniumStartAndAttachToServer<CR>')
vim.keymap.set('n', '<leader>jy', '<cmd>JupyniumStartSync<CR>')

