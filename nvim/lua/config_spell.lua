local spell_types = { "text", "tex", "latex", "plaintex", "gitcommit", "markdown" }

vim.opt.spell = false

require("spellwarn").setup()

vim.api.nvim_create_augroup("Spellcheck", { clear = true })

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "Spellcheck",
  pattern = spell_types,
  callback = function()
    vim.opt_local.spell = true
    vim.opt.spelllang = {'en_us', 'ru'}
  end,
  desc = "Enable spellcheck for defined filetypes",
})

vim.keymap.set('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')

