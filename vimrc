" vim setting for *nix
"
" Author: Mingxing Tan (tanmx.star@gmail.com)
" Date: 11/16/2013
"

" restore cursor to the position at the last open.
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" enable highlight search
set hlsearch

" enable tags for ctags tool.
set tags=tags;

" enable status bar
set laststatus=2
