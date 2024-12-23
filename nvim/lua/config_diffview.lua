require('diffview').setup{}

vim.keymap.set('n', "<leader>df", "<cmd>DiffviewOpen<cr>")
vim.keymap.set('n', "<leader>dF", "<cmd>DiffviewOpen -uno<cr>")
vim.keymap.set('n', "<leader>dc", "<cmd>DiffviewClose<cr>")
vim.keymap.set('n', "<leader>dt", "<cmd>DiffviewToggleFiles<cr>")
vim.keymap.set('n', "<leader>dh", "<cmd>DiffviewFileHistory<cr>")
vim.keymap.set('n', "<leader>dH", "<cmd>DiffviewFileHistory %<cr>")

