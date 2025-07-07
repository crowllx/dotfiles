require("options.set")
require("options.remap")
require("options.autocmds")

function R(name)
    require("plenary.reload").reload_module(name)
end
--vim.g.term = "screen-256color"
vim.g.netrw_browse_split = 0
vim.g.netrw_hide = 1
vim.g.netrw_winsize = 25
vim.g.netrw_browsex_viewer = "cmd.exe /C start"
vim.g.netrw_browsex_support_remote = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.termguicolors = true
-- vimwiki
vim.g.vimwiki_listsyms = '✗○◐●✓'
vim.g.vimwiki_list = { { path = '~/notes/', syntax = 'markdown', ext = '.md' } }

-- lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("options.lazy")


