require("wshine.set")
require("wshine.packer")
require("wshine.remap")

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.g.netrw_browse_split = 0
vim.g.netrw_hide = 1
vim.g.netrw_winsize = 25

