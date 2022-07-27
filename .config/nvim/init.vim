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

" Clojure plugin. Have yet to do much exploring, I just uninstalled
" vim-fireplace
Plug 'Olical/conjure'


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

" leader config
let mapleader = ","

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
nmap <Leader>gb :'<,'>GBrowse!<CR>
vmap <Leader>gb :'<,'>GBrowse!<CR>
" This uses fzf-checkout to
nmap <Leader>gc :GBranches checkout<CR>


"" TODO Where should the conjure vim keybindings go under leader?


" clojure config
autocmd FileType clojure AutoFormatBuffer cljstyle

" python config
autocmd FileType python AutoFormatBuffer yapf
