vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from curent line when starting new one

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignores case sensitivity when searching
opt.smartcase = true -- when including mixed casing within search, automatically assumes you want the search to be case sensitive

opt.cursorline = true

-- turn on termguicolors for colorschemes to work
opt.termguicolors = true
opt.background = "dark" -- makes any colorscheme with dark and light modes go to dark mode
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line, or insert mode position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
-- make sure to install a clipboard tool like wl-clipboard 

-- split windows
opt.splitright = true -- split vertical windows to the right
opt.splitbelow = true -- split horizontal windows to the bottom
