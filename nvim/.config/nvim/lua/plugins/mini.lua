return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.comment").setup({})
    require("mini.pairs").setup({})
    require("mini.ai").setup({})
    require("mini.surround").setup({})
    require("mini.files").setup({})
  end,
}
