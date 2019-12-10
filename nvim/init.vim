set number
set shiftwidth=2
set tabstop=4
set autoindent
set smartindent

set clipboard+=unnamedplus

"---FOR Vim-Plug---
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/neocomplete.vim'
Plug 'posva/vim-vue'
Plug 'mattn/emmet-vim'
if !has('nvim')
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'wsdjeg/dein-ui.vim'
Plug 'scrooloose/nerdtree'
Plug 'tomasr/molokai'
Plug 'dracula/vim'
Plug 'vim-latex/vim-latex'
"call dein#add('prabirshrestha/async.vim'
"call dein#add('prabirshrestha/vim-lsp'
Plug 'neoclide/coc.nvim', {'branch':'release', 'do':{-> coc#util#install()}}
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'


call plug#end()

"---FOR Vim-Plug---


filetype plugin indent on
syntax enable
" Finish for dein.vim
colorscheme dracula

" Mappings
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Buffers
noremap <C-S-h> bprev
noremap <C-S-l> bnext
" Term
tnoremap <Esc> <C-\><C-n>

" Use deoplete.
"let g:deoplete#enable_at_startup = 1

"autocmd BufRead,BufNewFile *.ts set filetype=typescript

""
"" Vim-LaTeX
""
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_FormatDependency_pdf = 'pdf'
"let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_CompileRule_pdf = 'ptex2pdf -u -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
"let g:Tex_CompileRule_dvi = 'uplatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_BibtexFlavor = 'upbibtex'
let g:Tex_MakeIndexFlavor = 'upmendex $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
let g:Tex_ViewRule_pdf = 'xdg-open'
"let g:Tex_ViewRule_pdf = 'evince'
"let g:Tex_ViewRule_pdf = 'okular --unique'
"let g:Tex_ViewRule_pdf = 'zathura -x "vim --servername synctex -n --remote-silent +\%{line} \%{input}"'
"let g:Tex_ViewRule_pdf = 'qpdfview --unique'
"let g:Tex_ViewRule_pdf = 'texworks'
"let g:Tex_ViewRule_pdf = 'mupdf'
"let g:Tex_ViewRule_pdf = 'firefox -new-window'
"let g:Tex_ViewRule_pdf = 'chromium --new-window'


"autocmd BufWrite *.go term++hidden "gofmt -w %:p"
