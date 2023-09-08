set nocompatible

filetype off
set completeopt=menu,menuone,noselect
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

call plug#begin()

" The best git vim plugin. Worth learning to use!
Plug 'tpope/vim-fugitive'
" Connects vim-fugitive with github. Important for :GBrowse
Plug 'tpope/vim-rhubarb'
" Connects vim-fugitive with sourcehut. Important for :GBrowse to work with
" sourcehut
Plug 'https://git.sr.ht/~willdurand/srht.vim'

" Handling surroundings: parens, brackets, quotes
Plug 'tpope/vim-surround'
" Rainbow parens
Plug 'amdt/vim-niji'

Plug 'github/copilot.vim'
" Helpers for common unix commands
Plug 'tpope/vim-eunuch'

" Improve netrw directory stuff
Plug 'tpope/vim-vinegar'

" Autoformatting plugins
" vim-maktaba is required for vim-codefmt
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'

" Provides a nice helper summary at the bottom of your vim window, with what mode
" you're in, what line you're on, branch, file, etc.
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

Plug 'folke/trouble.nvim'

" Provides fzf. Both of these lines are separately important!
" I also use ripgrep and the open buffers search! See the config
" at the bottom for how I use these.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Provides a fzf experience for checking out git branches
Plug 'stsewd/fzf-checkout.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'IndianBoy42/tree-sitter-just'

" Clojure config (interactive evaluation)
Plug 'Olical/conjure'
"Plug '~/conjure'

Plug 'goerz/jupytext.vim'
  
" Taming parentheses
" Plug 'guns/vim-sexp'
" Plug 'gpanders/nvim-parinfer'

" Golang support
Plug 'ray-x/go.nvim'
" theme
Plug 'EdenEast/nightfox.nvim' 

" prettier config for vim
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }


" lua-based snippet engine
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*'}
Plug 'saadparwaiz1/cmp_luasnip'

" completion framework stuff
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'MunifTanjim/nui.nvim'
Plug 'Olical/aniseed'
Plug 'nvim-lua/plenary.nvim'

" Plug '~/obsidianlite'
" Plug '~/ankinvim'
Plug 'https://git.sr.ht/~hermiod/obsidianlite.nvim'
 
" Plug 'CamdenClark/flyboy'
Plug '~/flyboy'
"
Plug '~/neoanki'
Plug '~/dictate.nvim'

Plug '/home/camden/anki-nvim'

call plug#end()

" general config
"
" leader config
let mapleader = "\<Space>"
let maplocalleader = ","

" This makes semicolon work identically to colon
nmap ; :
inoremap jj <Esc>

" Enable line numbers
set number

" My nvim theme: nightfox
colorscheme nightfox

" let g:conjure#debug = 1

let g:fzf_preview_window = ['up,50%', 'ctrl-/']

nmap <Leader>jf <C-i>
nmap <Leader>jb <C-o>

" go config
autocmd FileType go nmap <LocalLeader>rt :GoTestFunc<CR>
autocmd FileType go nmap <LocalLeader>rft :GoTestFile<CR>
autocmd FileType go nmap <LocalLeader>ri :GoInstall<CR>
autocmd FileType go nmap <LocalLeader>rb :GoBuild<CR>
autocmd FileType go nmap <LocalLeader>aj :GoAddTag<CR>
autocmd FileType go nmap <LocalLeader>at :GoAddTest<CR>
autocmd FileType go nmap <LocalLeader>ai :GoImport<Space>
autocmd FileType go nmap <LocalLeader>gg :GoGet<Space>
autocmd FileType go AutoFormatBuffer gofmt
autocmd FileType qf nmap <buffer> q :q<CR>

" clojure config
autocmd FileType clojure AutoFormatBuffer cljstyle
autocmd FileType clojure nmap <LocalLeader>cw :ConjureShadowSelect<Space>

" python config
autocmd FileType python AutoFormatBuffer yapf

" typescript config
" autocmd FileType markdown,json,typescriptreact,typescript,javascript,javascriptreact AutoFormatBuffer prettier

autocmd FileType clojure,go,markdown,prisma,python,rust,svelte,typescript,lua,typescriptreact,nix,zig set signcolumn=yes

" see lua/main.lua
" This contains the bulk of my other configuration
lua <<EOF
require("main")
EOF
