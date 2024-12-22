require('todo-comments').setup({
    keywords = {
        FIX  = { icon = "f" },
        TODO = { icon = "t" },
        HACK = { icon = "h" },
        WARN = { icon = "w" },
        PERF = { icon = "p" },
        NOTE = { icon = "n" },
        TEST = { icon = "t" },
    },
    highlight = {
        keyword = "wide_fg",
    }
})
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

vim.keymap.set('n', "<leader>xt", "<cmd>Trouble todo toggle<cr>")
vim.keymap.set('n', "<leader>xT", "<cmd>TodoTelescope<cr>")
