set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'Auto-Pairs'
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
colorscheme pyte 

nnoremap <Leader>c :set cursorcolumn!<CR>

filetype plugin on
filetype  indent on

let mapleader = ","
let python_highlight_all = 1
set t_Co=256 " ставим 256 цветов для иксовых терминалов
"Настройка omnicompletion для Python (а так же для js, html and css)
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"Авто комплит по табу
"
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"


imap <C-u> <esc>:edit!<CR>
nmap <C-u> :edit!<CR>

" показываем все полезные опции автокомплита сразу
"set complete=""
"set complete+=.
"set complete+=k
"set complete+=b
"set complete+=t

" Перед сохранением выразем пробелы на концах (только в .py файлах)
"autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
" В .py файлах включаем умные отступы после ключевых слов
"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Копи/паст по Ctrl+C/Ctrl+V
"vmap <C-c> "+yyi
"imap <C-V> <esc>"+gPi
" Установим статусную строку
"fun! <SID>SetStatusLine()
    "let l:s1="%-3.3n\\ %f\\ %h%m%r%w"
    "let l:s2="[%{strlen(&filetype)?&filetype:'?'},%{&encoding},%{&fileformat}]"
    "let l:s3="%=\\ 0x%-8B\\ \\ %-14.(%l,%c%V%)\\ %<%P"
    "execute "set statusline=" . l:s1 . l:s2 . l:s3
"endfun
"set laststatus=2
"call <SID>SetStatusLine()

nmap <F9> :TlistOpen<CR>
imap <F9> <ESC>:TlistOpen<CR>
nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>i
nmap <C-F10> :q!<CR>
imap <C-F10> <ESC>:q!<CR>
nmap <F3> :NERDTreeToggle<CR>

" C__________________________________________________________________

nmap <F8> :w\|!gcc -o %.out % -lm<CR>
imap <F8> <ESC>:w\|!gcc -o %.out %<CR>
nmap <F5> :!./%.out<CR>
imap <F5> <ESC>:!./%.out<CR>
nmap <F10> :qa<CR>
imap <F10> <ESC>:qa<CR>
" ___________________________________________________________________

"Walking Around Your Windows__________________________________________

" map control-backspace to delete the previous word
:imap <C-BackSpace> <C-W>

" Move the cursor to the window left of the current one
noremap  ,h :wincmd h<CR>

" Move the cursor to the window below the current one
noremap  ,j :wincmd j<CR>

" Move the cursor to the window above the current one
noremap  ,k :wincmd k<CR>

" Move the cursor to the window right of the current one
noremap  ,l :wincmd l<CR>

" Close the window below this one
noremap  ,xj :wincmd j:close<CR>

" Close the window above this one
noremap  ,xk :wincmd k:close<CR>

" Close the window to the left of this one
noremap  ,xh :wincmd h:close<CR>

" Close the window to the right of this one
noremap  ,xl :wincmd l:close<CR>

" Close the current window
noremap  ,xc :close<CR>

" Move the current window to the right of the main Vim window
noremap  ,ml L<CR>

" Move the current window to the top of the main Vim window
noremap  ,mk K<CR>

" Move the current window to the left of the main Vim window
noremap  ,mh H<CR>

" Move the current window to the bottom of the main Vim window
noremap  ,mj J<CR>

" Next tab
noremap ,n :tabn<CR>

" Previous tab
noremap ,p :tabp<CR>

" New tab
noremap ,t :tabnew<CR>
"______________________________________________________________

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
cmap w!! w !sudo tee > /dev/null %
