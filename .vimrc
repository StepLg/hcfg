"Вырубаем режим совместимости с VI:
set nocompatible

"Включаем распознавание типов файлов и типо-специфичные плагины:
filetype on
filetype plugin on

"Настройки табов для Python, согласно рекоммендациям
set tabstop=4 
set shiftwidth=4
set smarttab
set expandtab "Ставим табы пробелами
set softtabstop=4 "4 пробела в табе
"Автоотступ
set autoindent
"Подсвечиваем все что можно подсвечивать
let python_highlight_all = 1
"Включаем 256 цветов в терминале, мы ведь работаем из иксов?
"Нужно во многих терминалах, например в gnome-terminal
set t_Co=256

"Настройка omnicomletion для Python (а так же для js, html и css)
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
"В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"Вызываем SnippletsEmu по ctrl-j
let g:snippetsEmu_key = "<C-j>"

" Копи/паст по Ctrl+C/Ctrl+V
vmap <C-C> "+yi
imap <C-V> "+gPi

colorscheme xoria256 "Цветовая схема
syntax on "Включить подсветку синтаксиса
set nu "Включаем нумерацию строк
set mousehide "Спрятать курсор мыши когда набираем текст
"set mouse=a "Включить поддержку мыши
set termencoding=utf-8 "Кодировка терминала
set novisualbell "Не мигать 
set t_vb= "Не пищать! (Опции 'не портить текст', к сожалению, нету)
"Удобное поведение backspace
set backspace=indent,eol,start whichwrap+=<,>,[,]
"Вырубаем черточки на табах
set showtabline=0
"Колоночка, чтобы показывать плюсики для скрытия блоков кода:
set foldcolumn=1
" highlight matching braces
set showmatch

" Show invisible characters but no end of line, show trailing spaces as '.'
set list
set listchars=trail:.

"Переносим на другую строчку, разрываем строки
set wrap
set linebreak

"Вырубаем .swp и ~ (резервные) файлы
set nobackup
set noswapfile
set encoding=utf-8 " Кодировка файлов по умолчанию
set fileencodings=utf8,cp1251 " Возможные кодировки файлов, если файл не в unicode кодировке,
" то будет использоваться cp1251

let g:pydiction_location="/home/steplg/.vim/ftplugin/complete-dict"
set wildmenu
set wildmode=list:longest
set completeopt=menu,longest

autocmd FileType python set complete+=k/home/steplg/.vim/ftplugin/complete-dict isk+=.,(
autocmd FileType cpp set foldmethod=syntax

set hlsearch
set incsearch
set showtabline=1
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %l,%c%V\ %P
set laststatus=2

" Open and close NERDTree on F4
map <F4> :NERDTreeToggle<CR>
map! <F4> <ESC>:NERDTreeToggle<CR>
" Change NERDTree root when opening file in new tab
autocmd BufEnter * lcd %:p:h

" Switch between tabs on F7 and F8
map <F8> :tabnext<CR>
map! <F8> <ESC>:tabnext<CR>i
map <F7> :tabprevious<CR>
map! <F7> <ESC>:tabprevious<CR>i


" Move between windows on Ctrl+arrow
map ^[[D <C-w><left>
map! ^[[D <ESC><C-w><left>i
map ^[[C <C-w><right>
map! ^[[C  <ESC><C-w><right>i
map ^[[A <C-w><up>
map! ^[[A <ESC><C-w><up>i
map ^[[B <C-w><down>
map! ^[[B <ESC><C-w><down>i

" Always show tab bar
set showtabline=2

" F2 to save file in command mode
map <F2> :w<CR>
" F2 to save file in insert mode and do not move cursor
map! <F2> <ESC>:w<CR>i<right>

" Switch between .h and .cpp files using a.vim on F3
map <F3> :w<CR>:A<CR>
map! <F3> <ESC>:w<CR>:A<CR>

