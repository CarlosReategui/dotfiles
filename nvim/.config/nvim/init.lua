vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "javascript", "typescript", "css", "lua", "markdown", "java" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

vim.g.mapleader = " "

vim.g.copilot_enabled = false
vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>")
vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>")
vim.keymap.set("i", "<c-s>", "<Plug>(copilot-suggest)")

vim.opt.number = true
vim.opt.relativenumber = true
vim.o.statuscolumn = "%s%=%l %r"

vim.opt.clipboard = "unnamedplus"
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "X", '"_X', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "c", '"_c', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "C", '"_C', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "cc", '"_cc', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "c", '"_c', { noremap = true, silent = true })

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>q", ":q<CR>")

require("config.lazy")
