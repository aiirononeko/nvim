" Do not create buck up file
set nobackup

" Do not create swap file
set noswapfile

" Auto reflect when init.vim saved
autocmd BufWritePost  ~/.config/nvim/init.vim  so ~/.config/nvim/init.vim

" Visualize indent
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" Encoding
set encoding=utf-8
scriptencoding utf-8

" Display line number
set number

" Automatically close paranthesis etc...
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

" cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
inoremap <Esc> <Esc>lh

" Saving clipboard when yank
set clipboard+=unnamed

