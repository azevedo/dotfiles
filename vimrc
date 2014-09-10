set nocompatible              " be iMproved

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Determine what I have
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:OS = 'linux'
let os = substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  let s:OS = 'osx'
endif

let s:plugins=isdirectory(expand("~/.vim/bundle/Vundle.vim", 1))


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Global settings (set, let)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to auto read when a file is changed from the outside
" Automatically re-read the file if it has changed
set autoread

"Write the old file out when switching between files.
set autowrite

"set spell
set spelllang=en_us,pt

" Search is not case sensitive
set ignorecase

" Necessary to show Unicode glyphs
set encoding=utf-8
set fileencoding=utf-8

set pastetoggle=<F2>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Enable syntax highlighting
syntax enable
syntax on

" set wildmenu
set wildmode=list:longest,list:full
set complete=.,w,t

"Always show current position
set ruler

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

"Show Line Numbers
set number
set numberwidth=4

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Persistent undo
" allows to undo even after closing vim or even
" shutting down the computer
set undofile
set undodir=~/.vim/undo

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set formatoptions="tcqn"

" Linebreak on 80 characters
set lbr
set tw=80

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Automatically inserts one extra level of indentation
set smartindent

" Copy the indentation from the previous line
set autoindent

" Allows the backspace to delete indenting, end of lines, and over the start
" of insert
set backspace=indent,eol,start

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always display the statusline in all windows
set laststatus=2

" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode

" Show command in bottom right portion of the screen
set showcmd

" Off on start
set nofoldenable

" Indent seems to work the best
set foldmethod=syntax

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Abbreviations
iab instituition institution
iab teh the
iab proejct project


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Global bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Find word under cursor
  nnoremap <leader>f :Ag! "\b<C-R><C-W>\b"<CR>

  " Bind <C-f> to ag shortcut
  command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap <C-f> :Ag!<SPACE>
endif

" When pushing j/k on a line that is wrapped, it navigates to the same line,
" just to the expected location rather than to the next line
nnoremap j gj
nnoremap k gk

" set cursorline
nnoremap <Leader>h :set cursorcolumn! cursorline!<CR>

" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

" Unhighlight the last search pattern on Enter
nn <silent> <cr> :nohlsearch<cr><cr>

" Shortcut for indentation
map <leader>i gg=G

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Close the current buffer
map <leader>bd :bdelete<cr>

" Close all buffers
map <leader>ba :bufdo :bd<cr>

" Better Navigation
map <A-j> <ESC>:tabnext<CR>
map <A-k> <ESC>:tabprevious<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Save
nmap :W :w
map <leader>ww :w<CR>
map <leader>wq :wq<CR>

" Quit
nmap :Q :q
map <leader>qq :q<CR>
map <leader>qa :qa<CR>

" Search and replace
noremap <leader>sa :%s:::g<Left><Left>
noremap <leader>sv :s:::g<Left><Left><Left>
noremap <leader>s. :.s:::g<Left><Left><Left>

" Remove trailing whitespace
nnoremap <leader>tw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:w<CR>

" Inserts magic mode at the begginging of the search command
noremap / /\v

" Disable ex mode, ick, remap it to Q instead.
" More info:
" http://blog.sanctum.geek.nz/vim-command-window/
nmap Q q


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""
" -> Vundle
""""""""""""""""""""""""""""""""
if s:plugins
  if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
  endif
else
  " Bootstrap Vundle on new systems
  fun! InstallVundle()
      silent call mkdir(expand('~/.vim/bundle', 1), 'p')
      silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  endfun

  " Instead of install packages, install Vundle
  nmap <leader>vi :call InstallVundle()<cr>
endif

" Load plugins and indent for the filtype
" **Must be last for Vundle**
filetype plugin indent on     " required!

"""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""
set t_Co=16
set background=dark
colorscheme base16-default

""""""""""""""""""""""""""""""
" => Rails
""""""""""""""""""""""""""""""
function! GrepPartial(partial)
  if (a:partial)
    let pattern = ".*" . partial
  else
    let path = substitute(expand("%:h"), "app/views/", "", "")
    let action = substitute(expand("%:t:r:r"), "^_", "", "")
    let pattern = ".*" . path . "/" . action
  endif

  if (exists('g:loaded_fugitive'))
    execute "Ggrep -P " . '"' . pattern . '\b" app/views'
  elseif (executable('ag'))
    execute "Ag! " . '"' . pattern . '\b" app/views'
  elseif (exists('g:ackprg'))
    execute "Ack " . '"' . pattern . '\b" app/views'
  else
    " seriously? use git grep or ack!
    execute "vimgrep " . '"' . pattern . '\>" app/views/*/**'
  endif
endfunction
command! -nargs=? GrepPartial
      \ call GrepPartial(<q-args>)

""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""
" Escape Insert mode immediately
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Function to hide all the text except for the text selected in visual mode.
" This is great for highlighting parts of the code. Just call the function
" again to deselect everything.
function! ToggleSelected(visual) range
  highlight HideSelected ctermfg=bg ctermbg=bg
                       \ guifg=bg guibg=bg gui=none term=none cterm=none

  if exists('g:toggle_selected_hide')
    call matchdelete(g:toggle_selected_hide)

    unlet g:toggle_selected_hide
    redraw

    if !a:visual
      return
    endif
  endif

  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]

  let pattern = '\%^\|\%<'.lnum1.'l\|\%<'.col1.'v\|\%>'.lnum2.'l\|\%>'.col2.'v'
  letsg:toggle_selected_hide = matchadd('HideSelected', pattern, 1000)

  redraw
endfunction
" Show only selected in Visual Mode
nmap <silent> <leader>th :cal ToggleSelected(0)<cr>
vmap <silent> <leader>th :cal ToggleSelected(1)<cr>

""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""
" Tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>

""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""
augroup vimrcEx
  autocmd!

  " Return to last edit position when opening files
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END
