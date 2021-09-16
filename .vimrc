call plug#begin('~/.vim/plugged')

Plug 'skywind3000/vim-dict'
Plug 'skywind3000/vim-auto-popmenu'  "会被coc.nvim覆盖,需要:CocDisable使生效.配合vim-dict自动补全英语单词
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:coc_disable_startup_warning = 1

"install coc.nvim extensions
let g:coc_global_extensions = ['coc-clangd','coc-go','coc-python','coc-sh','coc-sql','coc-json']

call plug#end()

:set number
:set relativenumber
:set hlsearch
:syntax enable
:syntax on
colorscheme monokai  "适合本地终端但gotty显示效果差使用web终端时需注释掉
"colorscheme solarized
set expandtab
:%ret! 4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set cursorcolumn
set cursorline

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

"对于txt文件,禁用coc.nvim,启用vim-auto-popmenu.其他文件还是继续用coc.nvim补全
autocmd BufNew,BufEnter *.txt execute "silent! CocDisable"
autocmd BufLeave *.txt execute "silent! CocEnable"
let g:apc_enable_ft = {'text':1}
set cpt=.,k,w,b
set completeopt=menu,menuone,noselect
set shortmess+=c
