set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'gmarik/Vundle.vim'

if filereadable(expand('~/.vimrc_at_google'))
	source ~/.vimrc_at_google
else
	Bundle 'Valloric/YouCompleteMe'
	set ts=4
	set sw=4
	set softtabstop=4 "4 пробела в табе
	autocmd filetype py set expandtab "Ставим табы пробелами
	autocmd filetype cpp,c,h,hpp set syntax=cpp.doxygen
endif

Bundle 'scrooloose/syntastic'
Bundle 'vim-jp/cpp-vim'
call vundle#end()

filetype plugin indent on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=light
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
"if has("autocmd")
"  filetype indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set ttymouse=xterm2
set mouse=a		" Enable mouse usage (all modes) in terminals

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif
set cindent
"set noexpandtab
"set ts=4
"set sw=4
"if has("filetype")
"	filetype on
"	filetype plugin indent on
"	autocmd filetype cpp,c,h,hpp set syntax=cpp.doxygen
"endif
"runtime! ftplugin/man.vim
set visualbell

"Настройки табов для Python, согласно рекоммендациям
set smarttab
"Автоотступ
"autocmd filetype py set autoindent
"Подсвечиваем все что можно подсвечивать
let python_highlight_all = 1
"Включаем 256 цветов в терминале, мы ведь работаем из иксов?
"Нужно во многих терминалах, например в gnome-terminal
"set t_Co=256

"Настройка omnicomletion для Python (а так же для js, html и css)
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS

set wrap
set linebreak

set encoding=utf-8 " Кодировка файлов по умолчанию
set fileencodings=utf8,cp1251 " Возможные кодировки файлов, если файл не в unicode кодировке,
												    " то будет использоваться cp1251
set colorcolumn=81
set foldcolumn=1
set backspace=indent,eol,start whichwrap+=<,>,[,]
set termencoding=utf-8 "Кодировка терминала
set nu "Включаем нумерацию строк
set mousehide "Спрятать курсор мыши когда набираем текст
set completeopt-=preview

set hlsearch

"write with sudo
cmap w!! w !sudo tee > /dev/null %

syntax on

colorscheme elflord

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

"Make code completion menu readable
hi Pmenu      ctermbg=142
hi PmenuSel   ctermbg=118 ctermfg=0
hi PmenuSbar  ctermbg=248
hi PmenuThumb ctermbg=160

let g:ycm_always_populate_location_list = 1
let g:ycm_extra_conf_globlist = ['~/.ycm_extra_conf.py']

"Select the item by Enter in completion menu, but don't insert newline
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
