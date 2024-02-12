require("wshine.set")
require("wshine.remap")

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.g.netrw_browse_split = 0
vim.g.netrw_hide = 1
vim.g.netrw_winsize = 25
vim.g.netrw_browsex_viewer = "cmd.exe /C start"
vim.g.netrw_browsex_support_remote = true

-- vimwiki
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
vim.g.vimwiki_listsyms = '✗○◐●✓'
vim.g.vimwiki_list = { { path = '~/notes/', syntax = 'markdown', ext = '.md' } }
vim.opt.rtp:prepend(lazypath)
vim.api.nvim_set_keymap('n', '<F10>', ":put=strftime('## %F')<CR>", { noremap = true, silent = false })



require("wshine.lazy")


