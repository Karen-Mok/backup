call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

call plug#end()

:set number
:set relativenumber
:set hlsearch
:syntax enable
:syntax on
colorscheme monokai
"colorscheme solarized
set expandtab
:%ret! 4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent

":set wrap "行内折行，默认启用;此时折行内换行用gj/gk
"增加下面这两行，则在折行模式下j=gj,k=gk
"map j gj
"map k gk

set showcmd

let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set timeoutlen=150
autocmd InsertLeave * call Fcitx2en()

" vimtex配置  参见https://blog.csdn.net/qyhaill/article/details/100832805
" " Prevent that vim detect a file with the tex suffix as a plaintex
let g:tex_flavor='latex'
" " Set the viewer method 注意latexmk也设置了zathura预览,但那只适用其单独使用.如果vimtex这里不设置zathura,\ll会调用系统默认的pdf阅读器
let g:vimtex_view_method='zathura'
" " Never opened/closed the quickfix window automatically. The quickfix window
" shows the errors and/or warnings when compile, and we can open the quickfix
" windows use \le
let g:vimtex_quickfix_mode=0
