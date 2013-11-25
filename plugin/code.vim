" coding guidelines conformance for VIM
" Author: Mingxing Tan (tanmx.star@gmail.com)
" Date: 11/24/2013
"
" It's VIM, not VI
set nocompatible

" Enable filetype detection
filetype on

" Highlight syntax in programming languages
syntax on

" Lines longer than 80 columns.
au BufWinEnter * let w:m0=matchadd('LongLine', '\%>80v.\+', -1)
au BufWinEnter * match WhitespaceEOL /\s\+\%#\@<!$/
au InsertEnter * match WhitespaceEOL /\s\+\%#\@<!$/
au InsertLeave * match WhitespaceEOL /\s\+$/

" Highlight trailing whitespace and lines longer than 80 columns.
highlight LongLine ctermbg=DarkYellow
highlight WhitespaceEOL ctermbg=DarkYellow

nmap <F7> :highlight LongLine ctermbg=None <cr>
nmap <F8> :highlight WhitespaceEOL ctermbg=None <cr>

" Add and delete spaces in increments of `shiftwidth' for tabs
set smarttab
set smartindent

" Set textwidth=80 and automatically start a new line if test is longer than 80.
autocmd FileType c,cpp,python,tex set textwidth=80

" Optional
" C/C++ programming helpers
augroup csrc
  au!
  autocmd FileType *      set nocindent  nosmartindent
  autocmd FileType c,cpp  set cindent softtabstop=2 shiftwidth=2 tabstop=2
                          set expandtab smarttab textwidth=80 
                          set cinoptions=:0,g0,(0,Ws,l1
  autocmd FileType python set nocindent nosmartindent softtabstop=4 shiftwidth=4
                          set tabstop=4 expandtab smarttab textwidth=80 
  autocmd FileType make   set noexpandtab nosmarttab
augroup END


" Delete trailing whitespace and tabs at the end of each line
command! DeleteTrailingWs :%s/\s\+$//

" Convert all tab characters to two spaces
command! Untab :%s/\t/  /g

augroup filetype
  au! BufRead,BufNewFile *.cpp     set filetype=cpp
augroup END

augroup filetype
  au! BufRead,BufNewFile *.cc      set filetype=cpp
augroup END

augroup filetype
  au! BufRead,BufNewFile *.c      set filetype=c
augroup END

augroup filetype
  au! BufRead,BufNewFile *.py     set filetype=python
augroup END

" Enable syntax highlighting for LLVM files. To use, copy
" utils/vim/llvm.vim to ~/.vim/syntax .
augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

