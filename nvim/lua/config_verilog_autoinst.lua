require('autoinst').setup{
    fmt = true,
}

vim.keymap.set("n", "<leader>vi", "<cmd>AutoInst<cr>", { desc = "Automatic instantiation for verilog" })
