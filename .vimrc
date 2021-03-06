" VIMRC - Saurav Muralidharan
" Created: 08/24/08

filetype plugin indent on
set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Other plugins
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'yegappan/mru'
Plugin 'mileszs/ack.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-jp/vim-cpp'
Plugin 'Konfekt/vim-alias'

call vundle#end()

syn on
autocmd FileType c,cpp,slang set cindent
autocmd FileType python setl ts=2 sw=2 sts=2 et
set ofu=syntaxcomplete#Complete
set encoding=utf8
set undolevels=1000
set hidden
set history=50
set ignorecase
set smartcase
set gdefault
set showmatch
set number
set wildmenu
set expandtab
set t_Co=256
set cursorline

" Ignore binary files
set wildignore=*.o,*~,*/tmp/*,*.so,*.swp,*.zip
set wildmode=list:longest,full

" Auto read when a file is changed externally
set autoread
set nobackup
set noswapfile
set wmh=0
set ruler

" Folding
"set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

set tw=0
set shiftwidth=2
set tabstop=2
set softtabstop=2
set nowrap
set noautoindent
" set smartindent
set formatoptions+=r
if has('gui_running')
  set guioptions-=T
  set guioptions-=L
  set guioptions-=r
  set guifont=Cousine\ for\ Powerline\ 12
endif

" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" -- SEARCH OPT --
set incsearch
set hlsearch

" -- KEYBOARD MAPPINGS --

map! <C-f> <esc>

let mapleader = ","
nnoremap <Space> :noh<CR>
nnoremap L $
nnoremap H ^
noremap <M-j> 3<C-e>
noremap <M-k> 3<C-y>
nnoremap <Leader>m :MRU<CR>
nnoremap <Leader>z <C-z>
nnoremap <Leader>e :e .<CR>
nnoremap <Leader>v :e ~/.vimrc<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>b :BufExplorer<CR>
nnoremap <Leader>t :tabn<CR>
nnoremap <Leader>T :tabp<CR>

map <Leader>g :Ack

nnoremap <C-P> :RainbowParenthesesToggle<CR>
nnoremap <C-[> :cprevious<CR>
nnoremap <C-]> :cnext<CR>

" Remap arrow keys for Mac + iTerm2
map OA <up>
map OB <down>
map OD <left>
map OC <right>

set pastetoggle=<F3>

" Tagbar
set shell=/bin/bash
nnoremap <C-T> :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

"nnoremap <Leader>f za

" Window shortcuts
nnoremap <Leader>s <C-W>v

nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

nnoremap j gj
nnoremap k gk

nmap <silent> <Leader>n :set nolist!<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

autocmd VimEnter * :Alias gs Gstatus
autocmd VimEnter * :Alias ga Gwrite
autocmd VimEnter * :Alias gci Gcommit
autocmd VimEnter * :Alias gp Gpush
autocmd VimEnter * :Alias gl Gpull

" -- Status Line Config --

set laststatus=2
" set statusline=%<%F%h%m%r%h%w%y[%{CurDir()}%h]\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ line:%l\/%L\ col:%c%V\ pos:%o\ %P

set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" -- TAB NAVIGATION (Firefox style) --

" -- PLUGIN STUFF --

let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:airline_powerline_fonts = 1

" -_ MISC _-

au BufNewFile,BufRead *.cu set syn=cpp
au BufNewFile,BufRead *.cuh set syn=cpp

" Set colorscheme
if has('gui_running')
	colors solarized
	set background=light
else
	colorscheme sorcerer
	set mouse=a
endif
