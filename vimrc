" Don't close window, when deleting a buffer
" Keep for GUI only
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Search behaviour similar to emacs'
set wildignorecase
set ignorecase
set smartcase
set hlsearch
set incsearch

set lazyredraw

set encoding=utf8

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()
autocmd BufWrite * :call DeleteTrailingWS()

" Enable syntax highlighting
syntax enable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 3 spaces
set shiftwidth=3
set tabstop=3

" Linebreak on 500 characters
" set lbr
" set tw=500

set ai "Auto indent
set si "Smart indent
set wrap linebreak nolist " Supposedly better line wrapping

au BufRead /tmp/pico* setlocal tw=72 "Autowrap in Alpine mail editing
au BufRead /tmp/mutt* setlocal tw=72 "Autowrap in Alpine mail editing

" Status line : always there, different colour for insert modes
set laststatus=2
if version >= 700
   au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guibg=Magenta
   au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif
