set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'Auto-Pairs'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'pyte'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'qpkorr/vim-bufkill'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-arduino'
"" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set laststatus=2        " Status bar always presented
let g:airline_powerline_fonts = 1 " Enables PowerLine fonts
let g:airline#extensions#tabline#enabled = 1        " Smart tabline

" ConqueGdb Settings
let g:ConqueGdb_Leader = '<'

syntax on
set showtabline=1 " Показывать строку с табами
set shiftwidth=4
set smarttab
set tabstop=4 " Табуляция равна 4-ем пробелам
set expandtab " Табы в пробелы
set sts=4 " Двигать блоки в визуальном режиме на 4 пробела с помощью клавиш < и >
set bs=2 "без этого backspace не работает =\
set nu " Включаем нумерацию строк
set mousehide " Спрятать курсор мыши когда набираем текст
set mouse=a " Включить поддержку мыши
set wrap "Попросим Vim переносить длинные строки
set smartindent " smart autoindenting when starting a new line
set linebreak
set noswapfile
set encoding=utf-8 " Кодировка файлов по умолчанию
set cursorline

nnoremap <Leader>c :set cursorcolumn!<CR>

filetype plugin on
filetype  indent on

"nnoremap <SPACE> <Nop>
let mapleader=' '
"map <SPACE> <leader>
let python_highlight_all = 1
set t_Co=256 " ставим 256 цветов для иксовых терминалов
colorscheme pyte

set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'

nmap <F9> :TlistOpen<CR>
imap <F9> <ESC>:TlistOpen<CR>
nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>i
nmap <C-F10> :q!<CR>
imap <C-F10> <ESC>:q!<CR>
nmap <F3> :NERDTreeToggle<CR>

" C++__________________________________________________________________

nmap <F8> :w\|!g++ -o %.out % -lm -std=c++11<CR>
imap <F8> <ESC>:w\|!g++ -o %.out % -lm -std=c++11<CR>
nmap <F5> :!%.out<CR>
imap <F5> <ESC>:!%.out<CR>
nmap <F10> :qa<CR>
imap <F10> <ESC>:qa<CR>
" ___________________________________________________________________

"Walking Around Your Windows__________________________________________

" map control-backspace to delete the previous word
:imap <C-BackSpace> <C-W>
" Split the window vertically and move to it
nnoremap <Leader><CR> :exe "vs"<CR><C-w>l

" Move the cursor to the window left of the current one
noremap  <leader>h :wincmd h<CR>

" Move the cursor to the window below the current one
noremap  <leader>j :wincmd j<CR>

" Move the cursor to the window above the current one
noremap  <leader>k :wincmd k<CR>

" Move the cursor to the window right of the current one
noremap  <leader>l :wincmd l<CR>

" Close the window below this one
noremap  <leader>xj :wincmd j:close<CR>

" Close the window above this one
noremap  <leader>xk :wincmd k:close<CR>

" Close the window to the left of this one
noremap  <leader>xh :wincmd h:close<CR>

" Close the window to the right of this one
noremap  <leader>xl :wincmd l:close<CR>

" Close the current window
noremap  <leader>xc :close<CR>

" Move the current window to the right of the main Vim window
noremap  <leader>ml <C-W>L<CR>

" Move the current window to the top of the main Vim window
noremap  <leader>mk <C-W>K<CR>

" Move the current window to the left of the main Vim window
noremap  <leader>mh <C-W>H<CR>

" Move the current window to the bottom of the main Vim window
noremap  <leader>mj <C-W>J<CR>

" Next buffer
noremap <leader>n :bnext<CR>

" Previous buffer
noremap <leader>p :bprevious<CR>

" New tab
noremap <leader>t :tabnew<CR>
"______________________________________________________________

"Walking Around Your Buffers
" Next buffer
"nmap ,l :bnext<CR>
"nmap ,h :bprevious<CR>
" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Русская раскладка клавиатуры
  map ё `
  map й q
  map ц w
  map у e
  map к r
  map е t
  map н y
  map г u
  map ш i
  map щ o
  map з p
  map х [
  map ъ ]
  map ф a
  map ы s
  map в d
  map а f
  map п g
  map р h
  map о j
  map л k
  map д l
  map ж ;
  map э '
  map я z
  map ч x
  map с c
  map м v
  map и b
  map т n
  map ь m
  map б ,
  map ю .
  map Ё ~
  map Й Q
  map Ц W
  map У E
  map К R
  map Е T
  map Н Y
  map Г U
  map Ш I
  map Щ O
  map З P
  map Х {
  map Ъ }
  map Ф A
  map Ы S
  map В D
  map А F
  map П G
  map Р H
  map О J
  map Л K
  map Д L
  map Ж :
  map Э "
  map Я Z
  map Ч X
  map С C
  map М V
  map И B
  map Т N
  map Ь M
  map Б <
  map Ю >

" Меню смены кодировок
set wildmenu
set wcm=<Tab>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>
map <C-F5> :emenu Encoding.<TAB>
" Make < and > shifts keep selection
vnoremap < <gv
vnoremap > >gv
" Insert new line without switching to insert mode
nnoremap <C-J> a<CR><Esc>k$
cmap w!! w !sudo tee > /dev/null %
nnoremap - A;<Esc>
nnoremap <C-A> r-<Esc>li>

let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" Open the help in current buffer
command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>;


" Tagbar settings
" Open tagbar
nmap <F4> :TagbarToggle<CR>
imap <F4> <ESC>:TagbarToggle<CR>

nmap <leader><leader> V

" Resize your windows
nnoremap <silent> <Leader>+ :exe "resize +5"<CR>
nnoremap <silent> <Leader>- :exe "resize -5"<CR>

