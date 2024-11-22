vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_view_automatic = true
vim.opt.conceallevel = 2

vim.keymap.set('n', '<leader>ll', "<plug>(vimtex-compile)")
vim.keymap.set('n', '<leader>lv', "<plug>(vimtex-view)")
vim.keymap.set('n', '<leader>li', "<plug>(vimtex-info)")

