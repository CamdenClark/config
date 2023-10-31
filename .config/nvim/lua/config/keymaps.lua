-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<Leader>zw", ":e ~/notes/camden/Todos/WorkTodos.md<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>zz", ":e ~/notes/camden/Todos/ConfigTodos.md<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>zs", ":e ~/notes/camden/Todos/StudyTodos.md<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>zh", ":e ~/notes/camden/Todos/HomeTodos.md<CR>", { noremap = true })
-- Some keys that help me with my `Concepts` folder in notes
vim.api.nvim_set_keymap("n", "<Leader>zm", ":Move ~/notes/camden/Concepts/", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>zc", ":! add-concept<space>", { noremap = true })

-- <Leader>c for system clipboard
vim.api.nvim_set_keymap("v", "<Leader>cc", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>cp", '"+p', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>cP", '"+P', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>cg", ":GBrowse!<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "<Leader>cg", ":'<,'>GBrowse!<CR>", { noremap = true })
