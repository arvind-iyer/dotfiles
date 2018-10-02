set nocompatible
syntax on

filetype plugin indent on
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4

set number

set splitbelow
set splitright
" Enable mouse support
set mouse=a

" Always show status bar
set ls=2

" incremental search
set incsearch
" highlight search results
set hlsearch

"set completeopt-=preview

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'easymotion/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'hashivim/vim-terraform'
Plugin 'fatih/vim-go'
" Colorschemes
Plugin 'sickill/vim-monokai'
Plugin 'fisadev/fisa-vim-colorscheme'
call vundle#end()


"" NERDTree
"Open nerdtree when no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Open nerdtree when opening directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"" Aliases

nnoremap <F5> :NERDTreeToggle<CR>

" tabs
nnoremap <C-L> :tabnext<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-H> :tabp<CR>
nnoremap <C-Left> :tabp<CR>
nnoremap <silent> <C-n> :tabedit <CR> 

map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm 
map tt :tabnew 
map ts :tab split<CR>

" Save as sudo
ca w!! w !sudo tee "%"

" Tab Navigation
"" For Mac OS
nnoremap ˙ :wincmd h<CR>
nnoremap ∆ :wincmd j<CR>
nnoremap ˚ :wincmd k<CR>
nnoremap ¬ :wincmd l<CR>

"" For Linux
nnoremap <A-Up> :wincmd k<CR>
nnoremap <A-k> :wincmd k<CR>
nnoremap <A-Down> :wincmd j<CR>
nnoremap <A-j> :wincmd j<CR>
nnoremap <A-Left> :wincmd h<CR>
nnoremap <ESC>h :wincmd h<CR>
nnoremap <A-Right> :wincmd l<CR>
nnoremap <A-l> :wincmd l<CR>

" Easymotion 
" Fuzzy Search 
function! s:config_easyfuzzymotion(...) abort
	  return extend(copy({
	    \   'converters': [incsearch#config#fuzzyword#converter()],
	    \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
	    \   'keymap': {"\<CR>": '<Over>(easymotion)'},
	    \   'is_expr': 0,
	    \   'is_stay': 1
	    \ }), get(a:, 1, {}))
  endfunction
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

" Terraform Vim Integration
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1
let g:terraform_commentstring='//%s'

if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
	let &t_Co = 256
    colorscheme monokai
else
	colorscheme industry
endif

" colors for gvim
if has('gui_running')
	colorscheme monokai
endif

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3
set wildmode=list:longest

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") .">"<CR>
