-- Code Tree Support / Syntax Highlighting
return {
  -- https://github.com/nvim-treesitter/nvim-treesitter
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  dependencies = {
    -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  build = ":TSUpdate",
  opts = {
    highlight = {
      enable = true,
    },
    indent = { enable = true },
    auto_install = true, -- automatically install syntax support when entering new file type buffer
    ensure_installed = {
      "bash",
      "c",
      "cmake",
      "cpp",
      "css",
      "csv",
      "dart",
      "dockerfile",
      "gitignore",
      "html",
      "java",
      "javascript",
      "json",
      "json5",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "properties",
      "python",
      "tmux",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
  },
  config = function(_, opts)
    local configs = require("nvim-treesitter.configs")
    configs.setup(opts)
  end,
}
