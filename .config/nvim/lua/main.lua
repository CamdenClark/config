require('lualine_config')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lsp_flags = {
	debounce_text_changes = 150,
}

local on_attach = function(_, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', '<localleader>gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', '<localleader>gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', '<localleader>gh', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', '<localleader>gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<localleader>gt', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<localleader>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<localleader>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', '<localleader>gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<localleader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
	vim.keymap.set('n', '<localleader>ai', function() vim.lsp.buf.code_action({ filter = function(code_action)
			print(code_action.title)
			return code_action.title:find("Add require", 1, true) ~= nil
		end, apply = true})
	end, bufopts)
end

vim.keymap.set('n', '<localleader>it', function() vim.cmd(":TroubleToggle") end)

require('tree-sitter-just').setup({})
require('go').setup()

local lspconfig = require('lspconfig')
-- to debug your lsp setup
-- vim.lsp.set_log_level("info")

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
		-- Tell the language server which version of Lua you're using
		-- (most likely LuaJIT in the case of Neovim)
		version = 'LuaJIT',
	},
	diagnostics = {
		-- Get the language server to recognize the `vim` global
		globals = { 'vim' },
	},
	workspace = {
		-- Make the server aware of Neovim runtime files
		library = { vim.api.nvim_get_runtime_file("", true) },
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
		{ name = 'conjure' },
	})
})

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	},
})

local function cmp_tab_colon(fallback)
	if cmp.visible() then
		cmp.confirm({ select = true }, function()
			cmp.reset()
			cmp.complete()
		end)
	elseif luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	else
		fallback()
	end
end


cmp.setup.cmdline(':', {
	mapping = {
		['<Tab>'] = cmp.mapping(cmp_tab_colon),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<Up>'] = cmp.mapping.select_prev_item(),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<Down>'] = cmp.mapping.select_next_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
	},
	sources = cmp.config.sources({
		{ name = 'cmdline' },
		{ name = 'path', options = { trailing_slash = true } }
	})
})
