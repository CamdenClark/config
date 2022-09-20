set nocompatible
filetype off

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

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" theme
Plug 'EdenEast/nightfox.nvim' 

" prettier config for vim
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" golang plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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
call plug#end()

" general config
"
" leader config
let mapleader = ","

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


" go config
autocmd FileType go nmap <Leader>ch :GoDoc<CR>
autocmd FileType go nmap <Leader>cd :GoDef<CR>
autocmd FileType go nmap <Leader>ct :GoTest<CR>
autocmd FileType go nmap <Leader>ci :GoImport<space>
autocmd FileType go nmap <Leader>cn :GoRename<CR>


" clojure config
autocmd FileType clojure AutoFormatBuffer cljstyle

" python config
autocmd FileType python AutoFormatBuffer yapf

" typescript config
autocmd FileType typescript,json AutoFormatBuffer prettier

" coc.nvim configuration
"
set updatetime=300
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" javascript config
let g:coc_global_extensions = ['coc-tsserver']

autocmd FileType typescript nmap <Leader>ch <Plug>(coc-definition)
autocmd FileType typescript nmap <Leader>cr <Plug>(coc-references)
autocmd FileType typescript nmap <Leader>cr <Plug>(coc-references)
autocmd FileType typescript nmap <Leader>cn <Plug>(coc-rename)

" theming
colorscheme nightfox
