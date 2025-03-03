return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		local default_servers = { "cssls", "eslint", "lemminx", "lua_ls", "ts_ls" }
		for _, server in ipairs(default_servers) do
			if lspconfig[server] then
				lspconfig[server].setup({ capabilities = capabilities })
			end
		end

		lspconfig.pylsp.setup({
			capabilities = capabilities,
			settings = {
				pylsp = {
					plugins = {
						pycodestyle = {
							ignore = { "E501" },
						},
					},
				},
			},
		})

		local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
		local lombok_path = jdtls_path .. "/lombok.jar"
		local workspace_path = vim.fn.stdpath("cache") .. "/jdtls/workspace"

		lspconfig.jdtls.setup({
			cmd = {
				jdtls_path .. "/bin/jdtls",
				"--jvm-arg=-javaagent:" .. lombok_path,
				"-configuration",
				vim.fn.stdpath("cache") .. "/jdtls/config_linux",
				"-data",
				workspace_path,
			},
			capabilities = capabilities,
			root_dir = lspconfig.util.root_pattern("pom.xml", "gradlew", "build.gradle", ".git"),
		})

		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
		vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
		vim.keymap.set({ "n", "v" }, "<leader>se", ":lua vim.diagnostic.open_float()<CR>", {})
	end,
}
