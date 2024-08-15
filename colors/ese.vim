" Vim color file
" Maintainer: Cyrille Pierre <cypierre58@gmail.com>
" Last Change:  2024 June 08

hi clear
if exists("syntax_on")
  syntax reset
endif

if &background == 'light'
  runtime colors/ese-light.vim
else
  runtime colors/ese-dark.vim
endif

"colorscheme default
let g:colors_name = "ese"

