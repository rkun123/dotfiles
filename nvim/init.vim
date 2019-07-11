set number
set shiftwidth=2
set tabstop=4
set autoindent
set smartindent

" For dein.vim

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('posva/vim-vue')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('wsdjeg/dein-ui.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('tomasr/molokai')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
" Finish for dein.vim
colorscheme molokai

" Mappings
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" For YouCompleteMe
let g:ycm_global_ycm_extra_conf = '${HOME}/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_autoclose_preview_window_after_insertion = 1
set splitbelow
"
" Use deoplete.
let g:deoplete#enable_at_startup = 1

autocmd BufRead,BufNewFile *.ts set filetype=typescript
