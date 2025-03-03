return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
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
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
