require('lualine_config')

-- Leader + p config: Fuzzy find a file in a git repository
vim.api.nvim_set_keymap('n', '<C-P>', ':GFiles<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>p', ':GFiles<CR>', { noremap = true })

-- Leader + f config: Grep through file content in a git repository
vim.api.nvim_set_keymap('n', '<C-F>', ':Rg<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>f', ':Rg<CR>', { noremap = true })

-- Leader + b config: Fuzzy find on buffers open in vim
vim.api.nvim_set_keymap('n', '<Leader>b', ':Buffer<CR>', { noremap = true })

-- Leader + g config: git, using vim-fugitive commands
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Git<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gu', ':Git pull<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gp', ':Git -c push.default=current push<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gd', ':Git diff<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gl', ':Git log<CR>', { noremap = true })
-- This will copy to your clipboard a link to this file in whatever hosted git service you're using. This requires vim-rhubarb for github or the sourcehut plugin found above.
vim.api.nvim_set_keymap('n', '<Leader>gb', ':GBrowse!<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<Leader>gb', ':\'<, \'>GBrowse!<CR>', { noremap = true })
-- This uses fzf-checkout to fuzzy find through branches to checkout from
vim.api.nvim_set_keymap('n', '<Leader>gc', ':GBranches checkout<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gn', ':Git checkout -b ', { noremap = true })

vim.api.nvim_command('autocmd FileType fugitive nmap <buffer> q :q<CR>')
vim.api.nvim_command('autocmd FileType git nmap <buffer> q :q<CR>')

-- Obsidian config
vim.g.obsidian_vault = os.getenv("HOME") .. "/notes/camden"
vim.api.nvim_command('command! -bang ObsidianFiles call fzf#vim#files(g:obsidian_vault, <bang>0)')

-- <Leader>z for obsidian/zettelkasten
vim.api.nvim_set_keymap('n', '<Leader>zd', ':ObsidianOpenDailyNote<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>zk', ':ObsidianOpenZkNote<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>zp', ':ObsidianFiles<CR>', { noremap = true })
-- hardcoded notes for todo items
vim.api.nvim_set_keymap('n', '<Leader>zw', ':e ~/notes/camden/Todos/WorkTodos.md<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>zz', ':e ~/notes/camden/Todos/ConfigTodos.md<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>zs', ':e ~/notes/camden/Todos/StudyTodos.md<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>zh', ':e ~/notes/camden/Todos/HomeTodos.md<CR>', { noremap = true })
-- Some keys that help me with my `Concepts` folder in notes
vim.api.nvim_set_keymap('n', '<Leader>zm', ':Move ~/notes/camden/Concepts/', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>zc', ':! add-concept<space>', { noremap = true })

-- <Leader>c for system clipboard
vim.api.nvim_set_keymap('v', '<Leader>cc', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>cp', '"+p', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>cP', '"+P', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>cg', ':GBrowse!<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<Leader>cg', ":'<,'>GBrowse!<CR>", { noremap = true })

-- <Leader>d - filesystem config
vim.api.nvim_set_keymap('n', '<Leader>db', ':Explore<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>dd', ':Delete<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>dr', ':Remove<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>dm', ':Move<space>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>dc', ':Copy<space>', { noremap = true })

-- <Leader>w - window config
vim.api.nvim_set_keymap('n', '<Leader>wv', ':vsplit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>wh', ':split<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>wd', ':hide<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ww', '<C-w><C-w>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>wn', '<C-w><C-w>', { noremap = true })

-- <Leader>q - 'meta' stuff like this configuration file
vim.api.nvim_set_keymap('n', '<Leader>qc', ':e ~/.config/nvim/lua/main.lua<CR>', {})

-- netrw config
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 1
vim.api.nvim_command('autocmd FileType netrw nmap <buffer> q :q<CR>')

-- lsp config
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lsp_flags = {
	debounce_text_changes = 150,
}

local on_attach = function(_, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', '<localleader>gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', '<localleader>gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', '<localleader>h', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', '<localleader>gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<localleader>gt', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<localleader>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<localleader>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', '<localleader>gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<localleader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
	vim.keymap.set('n', '<localleader>ai', function() vim.lsp.buf.code_action({ filter = function(code_action)
			return code_action.title:find("Add require", 1, true) ~= nil
		end, apply = true })
	end, bufopts)
end

vim.keymap.set('n', '<localleader>it', function() vim.cmd(":TroubleToggle") end)

require('tree-sitter-just').setup({})
require('go').setup()

require('nvim-treesitter.configs').setup {
	highlight = { enable = true }
};
require('nvim-web-devicons').setup { }
local lspconfig = require('lspconfig')
-- to debug your lsp setup
-- vim.lsp.set_log_level("info")

lspconfig.tailwindcss.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	filetypes = {'svelte'}
}

lspconfig.marksman.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}
lspconfig.prismals.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

lspconfig.svelte.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

lspconfig.tsserver.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

lspconfig.pyright.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

lspconfig.elixirls.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	cmd = { "/usr/local/bin/elixir-ls/language_server.sh" };
}
lspconfig.solc.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

lspconfig.rust_analyzer.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}
vim.g['conjure#extract#tree_sitter#enabled'] = true

lspconfig.gopls.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

lspconfig.clojure_lsp.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

local lua_settings = {
	runtime = {
		version = 'LuaJIT',
	},
	diagnostics = {
		-- Get the language server to recognize the `vim` global
		globals = { 'vim' },
	},
	workspace = {
		-- Make the server aware of Neovim runtime files
		library = {
			vim.api.nvim_get_runtime_file("", true),
			'~/plenary.nvim'

		},
		checkThirdParty = false,
	},
	-- Do not send telemetry data containing a randomized but unique identifier
	telemetry = {
		enable = false,
	},
}

lspconfig.sumneko_lua.setup {
	settings = {
		Lua = lua_settings,
	},
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

require("trouble").setup {
	mode = "document_diagnostics",
}

-- Set up nvim-cmp.
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })

local luasnip = require("luasnip")

local cmp = require("cmp")
vim.cmd("set wildignorecase")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		ghost_text = true
	},
	mapping = {
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({ select = true })
				cmp.complete()
			elseif luasnip.expand_or_jumpable() then
				-- sucks--this conflicts with nvim-parinfer
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<Up>'] = cmp.mapping.select_prev_item(),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<Down>'] = cmp.mapping.select_next_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
	},
	sources = cmp.config.sources({
		{ name = 'luasnip' },
		{ name = 'nvim_lsp' },
	})
})

cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	},
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'cmdline' },
		{ name = 'path', options = { trailing_slash = true } }
	})
})

