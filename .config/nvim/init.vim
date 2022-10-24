set nocompatible
filetype off
set completeopt=menu,menuone,noselect

call plug#begin()

" The best git vim plugin. Worth learning to use!
Plug 'tpope/vim-fugitive'
" Connects vim-fugitive with github. Important for :GBrowse
Plug 'tpope/vim-rhubarb'
" Connects vim-fugitive with sourcehut. Important for :GBrowse to work with
" sourcehut
Plug 'https://git.sr.ht/~willdurand/srht.vim'
" Provides a Ctrl + P - type experience for checking out git branches
Plug 'stsewd/fzf-checkout.vim'

" Handling surroundings: parens, brackets, quotes
Plug 'tpope/vim-surround'
" Rainbow parens
Plug 'amdt/vim-niji'

" Helpers for common unix commands
Plug 'tpope/vim-eunuch'

" Autoformatting plugins
" vim-maktaba is required for vim-codefmt
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'

" Provides a file browser window in vim. I'm always considering whether or not
" to nix this, but sometimes it's useful.
Plug 'preservim/nerdtree'

" Provides a nice helper summary at the bottom of your vim window, with what mode
" you're in, what line you're on, branch, file, etc.
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'


Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*'}
Plug 'saadparwaiz1/cmp_luasnip'

" Provides fzf. Both of these lines are separately important!
" I also use ripgrep and the open buffers search! See the config
" at the bottom for how I use these.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Clojure config
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Olical/conjure'

Plug 'gpanders/nvim-parinfer'

" Github copilot
Plug 'github/copilot.vim'

" theme
Plug 'EdenEast/nightfox.nvim' 

" prettier config for vim
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" golang plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" cmp
Plug 'neovim/nvim-lspconfig'
Plug 'PaterJason/cmp-conjure'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

"filetype plugin on
"
" Brief help
" :PlugList       - lists configured plugins
" :PlugInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PlugSearch foo - searches for foo; append `!` to refresh local cache
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plug stuff after this line
"
Plug 'Olical/aniseed'

" Plug '~/obsidianlite'
Plug 'https://git.sr.ht/~hermiod/obsidianlite.nvim'

call plug#end()


" general config
"
" leader config
let mapleader = "\<Space>"
let maplocalleader = ","

" Enable line numbers
set number

" nerdtree config
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ctrl + p config: Fuzzy find a file in a git repository
nmap <C-P> :GFiles<CR>
nmap <Leader>p :GFiles<CR>

" ripgrep config: Grep through file content in a git repository
nmap <C-F> :Rg<CR>
nmap <Leader>f :Rg<CR>

" buffers config: Fuzzy find through all buffers open in vim
nmap <C-B> :Buffer<CR>
nmap <Leader>b :Buffer<CR>

" git config: uses vim-fugitive commands
nmap <Leader>gs :Git<CR>
nmap <Leader>gu :Git pull<CR>
nmap <Leader>gp :Git -c push.default=current push<CR>
nmap <Leader>gd :Git diff<CR>
nmap <Leader>gl :Git log<CR>
" This will copy to your clipboard a link to this file in whatever hosted git
" service you're using. This requires vim-rhubarb for github or the sourcehut
" plugin found above.
nmap <Leader>gb :GBrowse!<CR>
vmap <Leader>gb :'<,'>GBrowse!<CR>
" This uses fzf-checkout to
nmap <Leader>gc :GBranches checkout<CR>

" Using q for 'meta' stuff
nmap <Leader>qc :e ~/.config/nvim/init.vim<CR>

" Obsidian config
let g:obsidian_vault = $HOME.'/notes/camden'

command! -bang ObsidianFiles call fzf#vim#files(g:obsidian_vault, <bang>0)

" Using <Leader>z for obsidian/zettelkasten
nmap <Leader>zd :ObsidianOpenDailyNote<CR>
nmap <Leader>zk :ObsidianOpenZkNote<CR>
nmap <Leader>zp :ObsidianFiles<CR>
" Now I have a bunch of hardcoded notes for todo items
nmap <Leader>zw :e ~/notes/camden/Todos/WorkTodos.md<CR>
nmap <Leader>zz :e ~/notes/camden/Todos/ConfigTodos.md<CR>
nmap <Leader>zs :e ~/notes/camden/Todos/StudyTodos.md<CR>
nmap <Leader>zh :e ~/notes/camden/Todos/HomeTodos.md<CR>

" Using <Leader>c for system clipboard
vmap <Leader>cc "+y
nmap <Leader>cp "+p
nmap <Leader>cg :GBrowse!<CR>
vmap <Leader>cg :'<,'>GBrowse!<CR>

" filesystem config
nmap <Leader>dd :Delete<CR>
nmap <Leader>dr :Remove<CR>
nmap <Leader>dm :Move<space>
nmap <Leader>dc :Copy<space>

" window config
nmap <Leader>wv :vsplit<CR>
nmap <Leader>wh :split<CR>
nmap <Leader>wd :hide<CR>
nmap <Leader>wn <C-w><C-w>
nmap <Leader>wt :NERDTreeFocus<CR>
nmap <Leader>wr :NERDTreeRefreshRoot<CR>

" go config
autocmd FileType go nmap <LocalLeader>ch :GoDoc<CR>
autocmd FileType go nmap <LocalLeader>cd :GoDef<CR>
autocmd FileType go nmap <LocalLeader>ct :GoTest<CR>
autocmd FileType go nmap <LocalLeader>ci :GoImport<space>
autocmd FileType go nmap <LocalLeader>cn :GoRename<CR>

" clojure config
autocmd FileType clojure AutoFormatBuffer cljstyle
autocmd FileType clojure nmap <LocalLeader>cw :ConjureShadowSelect<Space>

" python config
autocmd FileType python AutoFormatBuffer yapf

" typescript config
autocmd FileType typescript,json AutoFormatBuffer prettier

" theming
colorscheme nightfox

autocmd FileType python,typescript set signcolumn=yes

" testing this
nmap ; :


" nvim-cmp autocompletion stuff
lua <<EOF
require('lualine_config')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
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
end
local lspconfig = require('lspconfig')
lspconfig['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}
lspconfig['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}
lspconfig.solc.setup{}
  -- Set up nvim-cmp.
  require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets"})

  local luasnip = require("luasnip")


  local cmp = require("cmp")

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
    mapping = {
	['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
	    cmp.confirm({ select = true })
          elseif luasnip.expand_or_jumpable() then
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
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'conjure' },
    })
  })
  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    },
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = {
	['<Tab>'] = cmp.mapping.confirm({ select = true }),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
	    
	    },
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
EOF

