set nocompatible              " be iMproved, required
set paste " Por padrão quero modo de colar legal
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" vim coisas
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'groenewege/vim-less'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'elzr/vim-json'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-ruby/vim-ruby'
Plugin 'gagoar/StripWhiteSpaces'
Plugin 'chrisbra/Colorizer'
Plugin 'wavded/vim-stylus'
Plugin 'digitaltoad/vim-jade'
Plugin 'rodjek/vim-puppet'
Plugin 'kchmck/vim-coffee-script'
Plugin 'alfredodeza/pytest.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'rking/ag.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'motus/pig.vim'
Plugin 'roman/golden-ratio'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
set background=dark
colorscheme monokai

set encoding=utf-8
set fileencoding=utf-8
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
set history=100
set undolevels=1000

"sem swap files aqui
set noswf

"salvo aqui quando eu tiro o focus dos arquivos
au FocusLost * :wa
set noshowmode

" Ag
let g:ag_working_path_mode="r"

"barra de status
set statusline=
set statusline=[%n] "buffer mode
set statusline+=\ \%#warningmsg#


" set the format of the status line

set statusline+=%*
set statusline+=%f              "filename
set statusline+=%m              "modified flag
set statusline+=%r              "read only flag
set statusline+=\ \%y           "filetype
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%=              "left/right separator
set statusline+=%*              "show the errors/warning in the status line
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=              "left/right separator
set statusline+=%h\ \           "help file flag
set statusline+=[%l,%c]         "cursor line,column
set statusline+=\ \|%L\ lines\| "total lines
set statusline+=\ %P            "percent through file
set laststatus=2


"NERDTree coisas
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <silent> <F2> :NERDTreeToggle<Return>


function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('rb', 'Magenta', 'none', '#ff00ff', '#151515')


"Colorindo automaticamente apenas esses arquivos
let g:colorizer_auto_filetype='css,html,vim'

"Corrigindo backspace weird
set backspace=indent,eol,start
set fileformat=unix

set cursorline

"Ctrl-p nao pesquisando a desgraça toda

set wildignore+=*/tmp/*,*/bower_components/*,*/node_modules/*,*.so,*.swp,*.zip,*/.git/*,*/coverage/*

set nu

set autoread

noremap <silent><CR> :let @*=@%<CR>

" Pytest
nmap <silent><Leader>F <Esc>:Pytest file<CR>
nmap <silent><Leader>f <Esc>:Pytest function<CR>
nmap <silent><Leader>c <Esc>:Pytest class<CR>
nmap <silent><Leader>m <Esc>:Pytest method<CR>


" Eita deixando o Multiplo cursor bom
let g:multi_cursor_exit_from_insert_mode=0

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
