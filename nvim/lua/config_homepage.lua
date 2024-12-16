vim.cmd([[
    let g:startify_center = 60

    let g:startify_lists = [
        \ { 'type': 'dir',       'header': startify#center(['MRU '.getcwd()]) },
        \ { 'type': 'sessions',  'header': startify#center(['Sessions']) },
        \ { 'type': 'files',     'header': startify#center(['MRU']) },
        \ { 'type': 'bookmarks', 'header': startify#center(['Bookmarks']) },
        \ { 'type': 'commands',  'header': startify#center(['Commands']) },
        \ ]
]])
