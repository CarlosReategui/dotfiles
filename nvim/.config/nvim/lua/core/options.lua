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

vim.opt.number = true
vim.opt.relativenumber = true
vim.o.statuscolumn = "%s%=%l %r"

vim.opt.clipboard = "unnamedplus"
