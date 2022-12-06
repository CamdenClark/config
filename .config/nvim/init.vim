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

" Handling surroundings: parens, brackets, quotes
Plug 'tpope/vim-surround'
" Rainbow parens
Plug 'amdt/vim-niji'

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

" Clojure config
Plug 'Olical/conjure'
  
Plug 'gpanders/nvim-parinfer'

" Github copilot
Plug 'github/copilot.vim'

" Golang support
Plug 'ray-x/go.nvim'

" theme
Plug 'EdenEast/nightfox.nvim' 

" prettier config for vim
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }


" lua-based snippet engine
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*'}
Plug 'saadparwaiz1/cmp_luasnip'

" completion framework stuff
Plug 'neovim/nvim-lspconfig'
Plug 'PaterJason/cmp-conjure'
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

call plug#end()

" general config
"
" leader config
let mapleader = "\<Space>"
let maplocalleader = ","

" This makes semicolon work identically to colon
nmap ; :

" Enable line numbers
set number

" My nvim theme: nightfox
colorscheme nightfox

" netrw config
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 1

" Preview window is hidden by default. You can toggle it with ctrl-/.
" It will show on the right with 50% width, but if the width is smaller
" than 70 columns, it will show above the candidate list
let g:fzf_preview_window = ['up,50%', 'ctrl-/']

" Leader + p config: Fuzzy find a file in a git repository
nmap <C-P> :GFiles<CR>
nmap <Leader>p :GFiles<CR>

" Leader + f config: Grep through file content in a git repository
nmap <C-F> :Rg<CR>
nmap <Leader>f :Rg<CR>

" Leader + b config: Fuzzy find on buffers open in vim
nmap <C-B> :Buffer<CR>
nmap <Leader>b :Buffer<CR>

" Leader + g config: git, using vim-fugitive commands
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
autocmd FileType fugitive nmap <buffer> q :q<CR>

" Leader + q: 'meta' stuff like this configuration file
nmap <Leader>qc :e ~/.config/nvim/init.vim<CR>
nmap <Leader>qp :GFiles ~<CR>


" Obsidian config
let g:obsidian_vault = $HOME.'/notes/camden'
command! -bang ObsidianFiles call fzf#vim#files(g:obsidian_vault, <bang>0)

" <Leader>z for obsidian/zettelkasten
nmap <Leader>zd :ObsidianOpenDailyNote<CR>
nmap <Leader>zk :ObsidianOpenZkNote<CR>
nmap <Leader>zp :ObsidianFiles<CR>
" hardcoded notes for todo items
nmap <Leader>zw :e ~/notes/camden/Todos/WorkTodos.md<CR>
nmap <Leader>zz :e ~/notes/camden/Todos/ConfigTodos.md<CR>
nmap <Leader>zs :e ~/notes/camden/Todos/StudyTodos.md<CR>
nmap <Leader>zh :e ~/notes/camden/Todos/HomeTodos.md<CR>
" Some keys that help me with my `Concepts` folder in notes
nmap <Leader>zm :Move ~/notes/camden/Concepts/
nmap <Leader>zc :! add-concept<space>

" <Leader>c for system clipboard
vmap <Leader>cc "+y
nmap <Leader>cp "+p
nmap <Leader>cg :GBrowse!<CR>
vmap <Leader>cg :'<,'>GBrowse!<CR>

" Leader + d: filesystem config
nmap <Leader>db :Explore<CR>
nmap <Leader>dd :Delete<CR>
nmap <Leader>dr :Remove<CR>
nmap <Leader>dm :Move<space>
nmap <Leader>dc :Copy<space>

" Leader + w: window config
nmap <Leader>wv :vsplit<CR>
nmap <Leader>wh :split<CR>
nmap <Leader>wd :hide<CR>
nmap <Leader>wn <C-w><C-w>

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
autocmd FileType typescript,json AutoFormatBuffer prettier

autocmd FileType clojure,go,python,rust,typescript,lua set signcolumn=yes

" see lua/main.lua
" This contains the bulk of my other configuration
lua <<EOF
require("main")
EOF
