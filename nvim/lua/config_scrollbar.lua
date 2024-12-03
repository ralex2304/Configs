local colors = require("nightfly").palette

require("scrollbar").setup({
    handle = {
        color = colors.bg,
    },
    marks = {
        Cursor    = { color = colors.white,     text = "<" },
        Search    = { color = colors.orange },
        Error     = { color = colors.red },
        Warn      = { color = colors.orange },
        Info      = { color = colors.malibu },
        Hint      = { color = colors.turquoise },
        Misc      = { color = colors.green },
        GitAdd    = {                           text = "|" },
        GitChange = {                           text = "|" },
    }
})

require("scrollbar.handlers.gitsigns").setup()
