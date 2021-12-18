set nocompatible
set directory=$HOME/.vim/swaps//

call plug#begin()
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'

if filereadable(expand('~/.vimrc_at_google'))
  source ~/.vimrc_at_google
else
  Plug 'Valloric/YouCompleteMe'
  Plug 'rhysd/vim-clang-format'
  Plug 'Chiel92/vim-autoformat'
  set ts=4
  set sw=4
  set softtabstop=4 "4 пробела в табе
  autocmd filetype py set expandtab "Ставим табы пробелами
  autocmd filetype cpp,c,h,hpp set syntax=cpp.doxygen
endif

"Plug 'scrooloose/syntastic'
Plug 'vim-jp/cpp-vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'vim-scripts/SWIG-syntax'
Plug 'stephpy/vim-yaml'
Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'mhinz/vim-signify'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-sensible'
Plug 'posva/vim-vue'
Plug 'pearofducks/ansible-vim'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
let g:vimspector_enable_mappings = 'HUMAN'
Plug 'puremourning/vimspector'

if &diff
else
"  Plug 'bogado/file-line'
endif

call plug#end()

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set ttymouse=sgr
set mouse=a		" Enable mouse usage (all modes) in terminals

set cindent
"set noexpandtab
"if has("filetype")
"	filetype on
"	filetype plugin indent on
"	autocmd filetype cpp,c,h,hpp set syntax=cpp.doxygen
"endif
"runtime! ftplugin/man.vim
set visualbell

"Подсвечиваем все что можно подсвечивать
"let python_highlight_all = 1
"Включаем 256 цветов в терминале, мы ведь работаем из иксов?
"Нужно во многих терминалах, например в gnome-terminal
"set t_Co=256

" these 3 lines should turn on 24bit+italics color
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

set wrap
set linebreak

set encoding=utf-8 " Кодировка файлов по умолчанию
set fileencodings=utf8,cp1251 " Возможные кодировки файлов, если файл не в unicode кодировке, то будет использоваться cp1251
set colorcolumn=+1
set foldcolumn=1
set backspace=indent,eol,start
set whichwrap+=<,>,[,]
set termencoding=utf-8 "Кодировка терминала
set number relativenumber "Включаем нумерацию строк
set mousehide "Спрятать курсор мыши когда набираем текст
set scrolloff=5
set completeopt-=preview

set list
set listchars=tab:▸\ 

set hlsearch

"write with sudo
"cmap w!! w !sudo tee > /dev/null %
command W w !sudo tee > /dev/null %

let g:onedark_terminal_italics = 1
augroup colorset
	autocmd!
		let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
	autocmd!
		let s:yellow = { "gui": "#E5C07B", "cterm": "180", "cterm16": "3" }
	autocmd ColorScheme * call onedark#set_highlight("TabLine", { "fg": s:white })
	autocmd ColorScheme * call onedark#set_highlight("TabLineSel", { "fg": s:yellow, "cterm": "bold" })
augroup END
let g:onedark_color_overrides = {
	\"black": {"gui": "#000000", "cterm": "235", "cterm16": "0" },
	\"comment_grey": { "gui": "#2ac0c9", "cterm": "59", "cterm16": "15" },
	\}
colorscheme onedark

"if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
"    execute "set <xUp>=\e[1;*A"
"    execute "set <xDown>=\e[1;*B"
"    execute "set <xRight>=\e[1;*C"
"    execute "set <xLeft>=\e[1;*D"
"endif

"hi Search     ctermbg=141
"hi Todo       ctermbg=214
"hi DiffText   ctermbg=240
"hi DiffChange ctermbg=235
"hi DiffAdd    ctermbg=17
"hi DiffDelete ctermbg=0   ctermfg=88
"Make code completion menu readable
"hi Pmenu      ctermbg=142
"hi PmenuSel   ctermbg=118 ctermfg=0
"hi PmenuSbar  ctermbg=248
"hi PmenuThumb ctermbg=160
"C++ syntax error
"hi SpellBad ctermbg=52
"hi Comment cterm=italic
"hi Todo cterm=italic

let g:ycm_always_populate_location_list = 1

"Select the item by Enter in completion menu, but don't insert newline
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:AutoPairsCenterLine = 0
let g:rust_recommended_style = 0

let g:closetag_filetypes = 'html,xhtml,phtml,vue'

noremap <F3> :Autoformat<CR>
inoremap <F3> <C-O>:Autoformat<CR>

nnoremap <C-K> :<C-u>ClangFormat<CR>
vnoremap <C-K> :ClangFormat<CR>

let g:rustfmt_autosave = 1
let g:airline_powerline_fonts = 1

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
