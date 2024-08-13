set hlsearch
set autoindent
set number
set ignorecase
set incsearch
set laststatus=2
set cursorline
set cursorcolumn
set shiftwidth=2
set showcmd
set showmatch
set nobackup
set noswapfile
set autoread
set hidden
set background=dark

set listchars=tab:^\ ,trail:~
set smartindent
set shiftwidth=2
set softtabstop=2

inoremap <silent> jj <ESC>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
inoremap < <><LEFT>
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap U <C-r>
nnoremap J 10<Down>
nnoremap K 10<Up>
nnoremap fh 10<Left>
nnoremap H 0
nnoremap fl 10<Right>
nnoremap L $
vnoremap J 10<Down>
vnoremap K 10<Up>
vnoremap fh 10<Left>
vnoremap H 0
vnoremap fl 10<Right>
vnoremap L $
syntax enable
colorscheme hybrid
call plug#begin()
  Plug 'https://github.com/preservim/nerdtree'
call plug#end()
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
if has('vim_starting')
    let &t_SI .= "\e[5 q"
    let &t_EI .= "\e[0 q"
    let &t_SR .= "\e[4 q"
endif
