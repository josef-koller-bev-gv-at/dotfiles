let g:gruvbox_italic=0
colorscheme gruvbox

set cursorline

" Error Message for too long lines
autocmd FileType javascript,matlab,typescript let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
