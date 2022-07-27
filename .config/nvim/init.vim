set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()


Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-surround'

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'

Plug 'amdt/vim-niji'

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'

Plug '/usr/local/opt/fzf'
Plug '~/.fzf'


Plug 'neovim/nvim-lspconfig'

Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production', 'branch': 'release/0.x', 'for' : ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']}

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
call plug#end()

" nerdtree config
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" clojure config
autocmd FileType clojure AutoFormatBuffer cljstyle

autocmd FileType python AutoFormatBuffer yapf
" js config
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" ctrl + p config
nmap <C-P> :FZF<CR>

set completeopt=menuone,noinsert,noselect
" Avoid showing extra messages when using completion
set shortmess+=c

