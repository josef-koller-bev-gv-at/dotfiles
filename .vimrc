set nocompatible

" -----------------------------------------------------------
" Setup Vundle
" -----------------------------------------------------------

filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
" install guide: https://github.com/Valloric/YouCompleteMe
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-surround'

" Color themes
Bundle 'jonathanfilip/vim-lucius'
Bundle 'tomasr/molokai'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

syntax on

let mapleader = "ö"
set t_Co=256

" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set listchars=tab:>-,trail:·,extends:>,eol:¬
set backspace=indent,eol,start    " backspace through everything in insert mode


" always show status bar
set laststatus=2

" always show line numbers
set number

" Join two lines with <C-j>
nnoremap <C-j> <S-j>

" tab navigation
nnoremap <C-tab>   :tabnext<CR>
nnoremap <S-k>     :tabnext<CR>
nnoremap <S-j>     :tabprevious<CR>
nnoremap <C-t>     :tabnew<CR>

" create not existing directories
" code from
" http://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
augroup END
autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))

" -----------------------------------------------------------
" Plugin configuration
" -----------------------------------------------------------
" vim-latex
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex -shell-escape -interaction=nonstopmode $*'

" Syntastic
" Automatically show error list
let g:syntastic_auto_loc_list = 1
" Make the list a little shorter
let g:syntastic_loc_list_height = 5

" airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
set noshowmode

" UltiSnips
let g:UltiSnipsEditSplit = 'vertical'

" fugitive
nnoremap <leader>gs :Gstatus<CR>

" Source this file when it's saved
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
endif
