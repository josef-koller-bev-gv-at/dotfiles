" Disable conflicting fireplace shortcut K
augroup fireplace_doc
  autocmd!
  "autocmd FileType clojure nmap <buffer> K  <Plug>FireplaceK
  autocmd FileType clojure nmap <buffer> [d <Plug>FireplaceSource
  autocmd FileType clojure nmap <buffer> ]d <Plug>FireplaceSource
  autocmd FileType clojure command! -buffer -nargs=1 Apropos :exe s:Apropos(<q-args>)
  autocmd FileType clojure command! -buffer -nargs=1 FindDoc :exe s:Lookup('clojure.repl', 'find-doc', printf('#"%s"', <q-args>))
  autocmd FileType clojure command! -buffer -bar -nargs=1 Javadoc :exe s:Lookup('clojure.java.javadoc', 'javadoc', <q-args>)
  autocmd FileType clojure command! -buffer -bar -nargs=1 -complete=customlist,fireplace#eval_complete Doc     :exe s:Lookup('clojure.repl', 'doc', <q-args>)
  autocmd FileType clojure command! -buffer -bar -nargs=1 -complete=customlist,fireplace#eval_complete Source  :exe s:Lookup('clojure.repl', 'source', <q-args>)
augroup END

nnoremap <leader>e :Eval<CR>
nnoremap <leader>ae :%Eval<CR>

nnoremap <C-j> :join<CR>
