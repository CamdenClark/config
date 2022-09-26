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

" Autoformatting plugins
" vim-maktaba is required for vim-codefmt
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'

" Provides a file browser window in vim. I'm always considering whether or not
" to nix this, but sometimes it's useful.
Plug 'preservim/nerdtree'

" Provides a nice helper summary at the bottom of your vim window, with what mode
" you're in, what line you're on, branch, file, etc.
Plug 'vim-airline/vim-airline'

" Provides fzf. Both of these lines are separately important!
" I also use ripgrep and the open buffers search! See the config
" at the bottom for how I use these.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Clojure config
Plug 'Olical/conjure'

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

Plug '~/freepilotnvim'
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


" Using <Leader>z for obsidian/zettelkasten
nmap <Leader>zd :ObsidianOpenDailyNote<CR>
nmap <Leader>zk :ObsidianOpenZkNote<CR>

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

" javascript config
let g:coc_global_extensions = ['coc-tsserver']

let g:obsidian_vault = $HOME.'/Dropbox/notes/camden'

autocmd FileType typescript nmap <LocalLeader>ch <Plug>(coc-definition)
autocmd FileType typescript nmap <LocalLeader>cr <Plug>(coc-references)
autocmd FileType typescript nmap <LocalLeader>cr <Plug>(coc-references)
autocmd FileType typescript nmap <LocalLeader>cn <Plug>(coc-rename)

" theming
colorscheme nightfox



lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
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
   -- sorting = { comparators = { require('freepilotnvim.main').comparator }}
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
EOF

