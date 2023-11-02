-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<Leader>zw", ":e ~/notes/camden/Todos/WorkTodos.md<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>zz", ":e ~/notes/camden/Todos/ConfigTodos.md<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>zs", ":e ~/notes/camden/Todos/StudyTodos.md<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>zh", ":e ~/notes/camden/Todos/HomeTodos.md<CR>", { noremap = true })
-- Some keys that help me with my `Concepts` folder in notes
vim.keymap.set("n", "<Leader>zm", ":Move ~/notes/camden/Concepts/", { noremap = true })
vim.keymap.set("n", "<Leader>zc", ":! add-concept<space>", { noremap = true })

-- <Leader>c for system clipboard
vim.keymap.set("v", "<Leader>cc", '"+y', { desc = "Copy to system clipboard", noremap = true })
vim.keymap.set("n", "<Leader>cp", '"+p', { desc = "Paste from system clipboard after", noremap = true })
vim.keymap.set("n", "<Leader>cP", '"+P', { desc = "Paste from system clipboard before", noremap = true })
vim.keymap.set("n", "<Leader>cg", ":GBrowse!<CR>", { noremap = true })
vim.keymap.set("v", "<Leader>cg", ":'<,'>GBrowse!<CR>", { noremap = true })

vim.keymap.set("n", "<leader>wn", "<C-W>p", { desc = "Other window" })
