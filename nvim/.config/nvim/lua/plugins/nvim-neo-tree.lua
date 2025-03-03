return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	opts = {
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				visible = true,
				never_show = {
					".git",
					".mvn",
					".settings",
					".project",
					".factorypath",
					".classpath",
					"target",
				},
			},
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)
		vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>h", ":Neotree toggle<CR>", {})
	end,
}
