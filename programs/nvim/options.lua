-- options
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.backup = true
vim.opt.directory = os.getenv("HOME") .. "/.local/state/nvim/swap/"
vim.opt.backupdir = os.getenv("HOME") .. "/.local/state/nvim/backup/"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.bg = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

-- remaps

vim.keymap.set("v", "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+yy]])
vim.api.nvim_set_keymap('n', '<F10>', ":put=strftime('## %F')<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<F5>', ":NvimTreeToggle<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>f', ":NvimTreeFocus<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<F10>', ":put=strftime('## %F')<CR>", { noremap = true, silent = false })

-- globals

vim.g.term = "screen-256color"
vim.g.netrw_browse_split = 0
vim.g.netrw_hide = 1
vim.g.netrw_winsize = 25
vim.g.netrw_browsex_viewer = "cmd.exe /c start"
vim.g.netrw_browsex_support_remote = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vimwiki

vim.g.vimwiki_listsyms = '✗○◐●✓'
vim.g.vimwiki_list = { { path = '~/notes/', syntax = 'markdown', ext = '.md' } }

-- load plugin configs

require("plugin.cmp")
require("plugin.lsp")
require("plugin.telescope")
require("plugin.nvim-tree")
require("plugin.treesitter")
require("plugin.zen")
require("plugin.rose-pine")
