local spell_types = { "text", "tex", "latex", "plaintex", "gitcommit", "markdown" }

vim.opt.spell = false

vim.api.nvim_create_augroup("Spellcheck", { clear = true })

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "Spellcheck",
  pattern = spell_types,
  callback = function()
    vim.opt_local.spell = true
    vim.opt.spelllang = {'en_us', 'ru'}

    require("spellwarn").setup{
        event = {
            "CursorHold",
            "InsertLeave",
            "TextChanged",
            "TextChangedI",
            "TextChangedP",
        },
        enable = true,
        ft_config = {
            alpha   = false,
            help    = false,
            lazy    = false,
            lspinfo = false,
            mason   = false,
        },
        ft_default = true,
        max_file_size = nil,
        severity = {
            spellbad   = "WARN",
            spellcap   = "HINT",
            spelllocal = "HINT",
            spellrare  = "INFO",
        },
        prefix = "possible misspelling(s): ",
        diagnostic_opts = { severity_sort = true },
    }
  end,
  desc = "Enable spellcheck for defined filetypes",
})

vim.keymap.set('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')

