set nocompatible              " be iMproved

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on     " required!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to auto read when a file is changed from the outside
set autoread

"Write the old file out when switching between files.
set autowrite

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"set spell
set spelllang=en_us,pt

" Source the vimrc file after saving it
"if has("autocmd")
"	autocmd bufwritepost .vimrc source $MYVIMRC
"endif

" Hide NERDTree
let NERDTreeShowHidden=1

" Search is not case sensitive
set ignorecase

set encoding=utf-8
set fileencoding=utf-8

set pastetoggle=<F2>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
" set wildmenu
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

"Always show current position
set ruler

" Highlight search results
set hlsearch

" Highlight the current line only in the current window
" augroup CursorLine
"   au!
"   au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"   au WinLeave * setlocal nocursorline
" augroup END

" Speeding cursorline highlighting
" let g:boostmove=0
" set updatetime=50
" au CursorMoved * call BoostMoveON()
" au CursorMovedI * call BoostMoveON()
" au CursorHold * call BoostMoveOFF()
" au CursorHoldI * call BoostMoveOFF()
" function BoostMoveON()
"   if (g:boostmove == 0)
"     let g:boostmove=1
"     setlocal nocursorline
"   endif
" endfunction
" function BoostMoveOFF()
"   if g:boostmove==1
"     let g:boostmove=0
"     setlocal cursorline
"   endif
" endfunction

" set cursorline
nnoremap <Leader>ch :set cursorcolumn! cursorline!<CR>

" Press F4 to toggle highlighting on/off, and show current value.
noremap <leader>. :set hlsearch! hlsearch?<CR>

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

"Show Line Numbers
set number
set numberwidth=4

" Escape Insert mode immediately
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set t_Co=256
set background=dark
colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Persistent undo
" allows to undo even after closing vim or even
" shutting down the computer
set undofile
set undodir=~/.vim/undo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set formatoptions="tcqn"

" Linebreak on 500 characters
set lbr
set tw=80

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Automatically inserts one extra level of indentation
set smartindent

" Copy the indentation from the previous line
set autoindent

" Shortcut for indentation
map <leader>i gg=G

" Tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all buffers
map <leader>ba :bufdo :bd<cr>

augroup vimrcEx
  autocmd!

  " Return to last edit position when opening files
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif

  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" Remember info about open buffers on close
set viminfo^=%

" Better Navigation
map <C-right> <ESC>:bp<CR>
map <C-left> <ESC>:bn<CR>
map <C-down> <ESC>:tabnext<CR>
map <C-up> <ESC>:tabprevious<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Switch between the last two files
nnoremap <leader><leader> <c-^>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always display the statusline in all windows
set laststatus=2

set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
" set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [POS=%01l,%01v]\ [%p%%]\ [LEN=%L]

" Show command in bottom right portion of the screen
set showcmd

" Necessary to show Unicode glyphs
set encoding=utf-8

""""""""""""""""""""""""""""""
" => General Shortcuts
""""""""""""""""""""""""""""""
"Faster shortcut for commenting. Requires T-Comment plugin
"control + c
map <leader>c <c-_><c-_>

" Toggle NERDTree
nmap <leader>n :NERDTreeToggle<cr>

map <leader>nc :NERDTreeFind<cr>

" Save
nmap :W :w

" Quit
nmap :Q :q

" Read external command
" map <C-t> <ESC>:r!

" Search and replace
noremap ;; :%s:::g<Left><Left>
noremap ;' :s:::g<Left><Left><Left>
" noremap ;. :.s:::g<Left><Left><Left>

nnoremap ;, :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

noremap / /\v

""""""""""""""""""""""""""""""
" => Ctags
""""""""""""""""""""""""""""""
" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Use the current file and ctags when finding keywords
set complete=.,t

" To open tag in preview window: C-w }

""""""""""""""""""""""""""""""
" => CtrlP Configurations
""""""""""""""""""""""""""""""
" Shortcut
map <C-p> <ESC>:CtrlP

" Local working directory
let g:ctrlp_working_path_mode = 'ra'

" Ignore files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/fixtures/*,*/functional/*  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" Enable opening at most 4 files with <c-z> and <c-o> in a new tab
let g:ctrlp_open_multiple_files = '4t'

" if the file’s already opened somewhere CtrlP will try to jump to it instead of opening a new instance
let g:ctrlp_switch_buffer = 2

" the newly created file is opened in a new tab when pressing <c-y>
let g:ctrlp_open_new_file = 't'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " Bind K to grep word under cursor
  nnoremap <leader>f :Ag! "\b<C-R><C-W>\b"<CR>

  " Bind <C-f> to grep shortcut
  command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap <C-f> :Ag!<SPACE>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab instituition institution
iab teh the
iab proejct project

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rails custom commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => RSpec.vim mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Populates the argument list with all of the files listed in the quickfix list
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction

" Substitutes in all args and saves the changes
" noremap ,r :Qargs | argdo %s///g | update

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-conflicted
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set stl+=%{ConflictedVersion()}


" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
