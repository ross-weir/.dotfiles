function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  "" fzf from git is required because we can't use local paths
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')

  "" Git
  call minpac#add('tpope/vim-fugitive')
endfunction

"" Leader key
let mapleader = ","

"" Disable arrows
map <right> <nop> " normal, visual, operation-pending
map <down> <nop>
map <left> <nop>
map <up> <nop>
imap <right> <nop>  " insert mode
imap <down> <nop>
imap <left> <nop>
imap <up> <nop>

"" General editor settings
set number
set relativenumber
set wrap!
set expandtab
set autoindent
"" Auto relaod file on change
set autoread
au FocusGained * :checktime

"" Personal keybindings
nnoremap <leader>y +y
vnoremap <leader>y +y
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>l :Lines<CR>

"" Plugin specific

" FZF
let $FZF_DEFAULT_OPTS = ' --no-height'
let $FZF_DEFAULT_COMMAND = 'fd --type f' 

command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()
