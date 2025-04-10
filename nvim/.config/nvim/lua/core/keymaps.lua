local keymap = vim.keymap

-- General
keymap.set("n", "<leader>wq", ":wq<CR>")
keymap.set("n", "<leader>qq", ":q<CR>")
keymap.set("n", "<leader>ww", ":w<CR>")
keymap.set("n", "gx", ":!open <c-r><c-a><CR>")

-- Clipboard
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "X", '"_X', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "c", '"_c', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "C", '"_C', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "cc", '"_cc', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "c", '"_c', { noremap = true, silent = true })

-- Window switching
keymap.set("n", "<c-k>", ":wincmd k<CR>")
keymap.set("n", "<c-j>", ":wincmd j<CR>")
keymap.set("n", "<c-h>", ":wincmd h<CR>")
keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Split window management
keymap.set("n", "<leader>wv", "<C-w>v")     -- split window vertically
keymap.set("n", "<leader>wh", "<C-w>s")     -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=")     -- make split windows equal width
keymap.set("n", "<leader>wx", ":close<CR>") -- close split window
keymap.set("n", "<leader>wj", "<C-w>-")     -- make split window height shorter
keymap.set("n", "<leader>wk", "<C-w>+")     -- make split windows height taller
keymap.set("n", "<leader>wl", "<C-w>>5")    -- make split windows width bigger
keymap.set("n", "<leader>wh", "<C-w><5")    -- make split windows width smaller

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open a new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close a tab
keymap.set("n", "<leader>tn", ":tabn<CR>")     -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")     -- previous tab

-- Diff keymaps
keymap.set("n", "<leader>cc", ":diffput<CR>")   -- put diff from current to other during diff
keymap.set("n", "<leader>cj", ":diffget 1<CR>") -- get diff from left (local) during merge
keymap.set("n", "<leader>ck", ":diffget 3<CR>") -- get diff from right (remote) during merge
keymap.set("n", "<leader>cn", "]c")             -- next diff hunk
keymap.set("n", "<leader>cp", "[c")             -- previous diff hunk

-- Quickfix keymaps
keymap.set("n", "<leader>qo", ":copen<CR>")  -- open quickfix list
keymap.set("n", "<leader>qf", ":cfirst<CR>") -- jump to first quickfix list item
keymap.set("n", "<leader>qn", ":cnext<CR>")  -- jump to next quickfix list item
keymap.set("n", "<leader>qp", ":cprev<CR>")  -- jump to prev quickfix list item
keymap.set("n", "<leader>ql", ":clast<CR>")  -- jump to last quickfix list item
keymap.set("n", "<leader>qc", ":cclose<CR>") -- close quickfix list
-- keymap.set("n", "<C-q>", function()
--   require("telescope.actions").smart_send_to_qflist()
--   require("telescope.actions").open_qflist()
-- end)

-- Neotree
-- keymap.set("n", "<leader>ee", ":Neotree filesystem reveal left<CR>", {})
-- keymap.set("n", "<leader>er", ":Neotree toggle<CR>", {})

-- Mini Files
-- keymap.set("n", "<leader>ee", function()
--   if not MiniFiles.close() then
--     MiniFiles.open()
--   end
-- end)
--
keymap.set("n", "<leader>ee", function()
  if not MiniFiles.close() then
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    MiniFiles.reveal_cwd()
  end
end)

-- Vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle maximize tab

-- LSP
keymap.set("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>")
keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>")
keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
keymap.set({ "n", "v" }, "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
keymap.set("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
keymap.set("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
keymap.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
keymap.set("n", "<leader>tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
keymap.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>")

-- Telescope
keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, {})                -- fuzzy find files in project
keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {})                 -- grep file contents in project
keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {})                   -- fuzzy find open buffers
keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, {})                 -- fuzzy find help tags
keymap.set("n", "<leader>fc", require("telescope.builtin").current_buffer_fuzzy_find, {}) -- fuzzy find in current file buffer
keymap.set("n", "<leader>fo", require("telescope.builtin").lsp_document_symbols, {})      -- fuzzy find LSP/class symbols
keymap.set("n", "<leader>fi", require("telescope.builtin").lsp_incoming_calls, {})        -- fuzzy find LSP/incoming calls

-- Git
keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})

-- Harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>ha", function()
  harpoon:list():add()
end)
keymap.set("n", "<leader>h1", function()
  harpoon:list():select(1)
end)
keymap.set("n", "<leader>h2", function()
  harpoon:list():select(2)
end)
keymap.set("n", "<leader>h3", function()
  harpoon:list():select(3)
end)
keymap.set("n", "<leader>h4", function()
  harpoon:list():select(4)
end)
vim.keymap.set("n", "<leader>hh", function()
  harpoon:list():prev({ ui_nav_wrap = true })
end)
vim.keymap.set("n", "<leader>hl", function()
  harpoon:list():next({ ui_nav_wrap = true })
end)

-- Filetype-specific keymaps (these can be done in the ftplugin directory instead if you prefer)
keymap.set("n", "<leader>go", function()
  if vim.bo.filetype == "java" then
    require("jdtls").organize_imports()
  end
  if vim.bo.filetype == "python" then
    vim.api.nvim_command("PyrightOrganizeImports")
  end
end)

keymap.set("n", "<leader>gu", function()
  if vim.bo.filetype == "java" then
    require("jdtls").update_projects_config()
  end
end)

keymap.set("n", "<leader>tc", function()
  -- require("neo-tree.command").execute({ action = "close" })
  if vim.bo.filetype == "java" then
    require("jdtls").test_class()
  end
  if vim.bo.filetype == "python" then
    require("dap-python").test_class()
  end
end)

keymap.set("n", "<leader>tm", function()
  -- require("neo-tree.command").execute({ action = "close" })
  if vim.bo.filetype == "java" then
    require("jdtls").test_nearest_method()
  end
  if vim.bo.filetype == "python" then
    require("dap-python").test_method()
  end
end)

keymap.set("v", "<leader>rf", function()
  if vim.bo.filetype == "java" then
    require("jdtls").extract_method()
  end
end)

-- Debugging
keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymap.set("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>")
keymap.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>")
keymap.set("n", "<leader>dc", function()
  -- require("neo-tree.command").execute({ action = "close" })
  require("dap").continue()
end)
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>")
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_into()<cr>")
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_out()<cr>")
keymap.set("n", "<leader>dd", function()
  -- require("neo-tree.command").execute({ action = "show" })
  require("dap").disconnect()
  require("dapui").close()
end)
keymap.set("n", "<leader>dt", function()
  -- require("neo-tree.command").execute({ action = "show" })
  require("dap").terminate()
  require("dapui").close()
end)
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
keymap.set("n", "<leader>di", function()
  require("dap.ui.widgets").hover()
end)
keymap.set("n", "<leader>d?", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end)
keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>")
keymap.set("n", "<leader>de", function()
  require("telescope.builtin").diagnostics({ default_text = ":E:" })
end)
