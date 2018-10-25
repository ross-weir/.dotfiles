function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  "" fzf from git is required because we can't use local paths
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')

  "" Autocomplete
  call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })

  "" Formatting
  call minpac#add('jiangmiao/auto-pairs')
  call minpac#add('tpope/vim-surround')
  call minpac#add('scrooloose/nerdcommenter')

  "" Python
  call minpac#add('Vimjas/vim-python-pep8-indent')
  call minpac#add('ambv/black')

  "" Git
  call minpac#add('tpope/vim-fugitive')
  "" Enable Gbrowse for GitHub
  call minpac#add('tpope/vim-rhubarb')
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
nnoremap <leader>b :Gbrowse<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>a :Ag<CR>

"" Plugin specific

"" FZF
let $FZF_DEFAULT_OPTS = ' --no-height'
let $FZF_DEFAULT_COMMAND = 'fd --type f' 

"" Black
let g:black_linelength = 100
"" Format on save
autocmd BufWritePre *.py execute ':Black'

"" Deoplete
let g:deoplete#enable_at_startup = 1

command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()
