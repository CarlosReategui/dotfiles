return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"cssls",
				"eslint",
				"jdtls",
				"lemminx",
				"lua_ls",
				"pylsp",
				"ts_ls",
			},
		})
	end,
}
