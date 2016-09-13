runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()

runtime! plugin/sensible.vim

let g:glsl_file_extensions = '*.glsl,*.vsh,*.fsh,*.frag,*.vert'
let g:glsl_default_version = 'glsl450'

scriptencoding utf-8
set encoding=utf-8
set termencoding=utf-8

let mapleader = "´"

syntax on
filetype plugin indent on

set foldmethod=marker

set hlsearch
set incsearch

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set cindent
"set autoindent

" Text display settings
set formatoptions-=tcr
set textwidth=0  "120
set linebreak
set nowrap
set whichwrap+=h,l,<,>,[,]
set nolist

" Better redrawing for large files
set ttyfast
"set lazyredraw

" Fillchars
set fillchars+=vert:◦
"║│░•◆▲▫︎◦


" Move complete block one line down or up with <M-Down> and <M-Up> keys
vmap <silent> <M-Up> :m'<-2<CR>gv
vmap <silent> <M-Down> :m'>+1<CR>gv

" Javascript folding
"autocmd FileType javascript call JavaScriptFold()

" Zen-coding: emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css,erb,jsx EmmetInstall

" NERD_Commenter
map <silent> <C-x> <Leader>ci

map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Jump into tags (and <Alt-Left> to go back)
"map <silent> <M-Down> <C-]>
map <silent> <M-Left> <C-T>

" Textmate(ruby) like insert '=>'
imap <silent> <C-l> =>
imap <silent> <C-k> ->

" Ack
map <silent> <Leader>f <Esc>*:Ack<CR>

" remove trailing whitespaces
func! RemoveTrailingWhitespaces()
    let save_cursor = getpos(".")
    :%s/\s*$//ge
    call setpos('.', save_cursor)
endf
"map <silent> <Leader>w :call RemoveTrailingWhitespaces()<CR>
"autocmd BufWrite *.c,*.cpp,*.js,*.coffee,*.rb,*.html,*.jade,*.css,*.less,*.sass,*.scss,*.json call RemoveTrailingWhitespaces()
"autocmd BufWritePost *.c,*.cpp,*.js,*.coffee,*.rb,*.html,*.jade,*.css,*.less,*.sass,*.scss,*.json call RemoveTrailingWhitespaces()

" abbreviations
iabbr <%- <%- -%><Esc>hhhi
iabbr <%= <%= %><Esc>hhi
iabbr <%# <%= %><Esc>hhi

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" Tabular
"if exists(":Tabularize")
    "vmap <Leader-a>: :'<,'>:Tabularize /:/l0c1r0<CR>
"endif

" will cause the quickfix window to open after any grep invocation
autocmd QuickFixCmdPost *grep* cwindow

" <F1>
"map <silent> <F1> <Esc>:MBEToggle<CR>
"map <silent> <F1> <Esc>:ToggleBufExplorer<CR>
"map <silent> <F1> <Esc>:BufExplorerHorizontalSplit<CR>
"map <silent> <F1> <Esc>:BufExplorerVerticalSplit<CR>
"map <silent> <F1> <Esc>:CommandT<CR>
"map <silent> <F1> <Esc>:Goyo<CR>
"map <slient> <F1> <Esc><C-P>
map <silent> <F1> <Esc>:IndentGuidesToggle<CR>

let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" MiniBufExpl
map <silent> <C-Tab> <Esc>:MBEFocus<CR>
let g:miniBufExplorerAutoStart=1
let g:miniBufExplUseSingleClick=1

" BufExplorer
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowDirectories=0   " Do not show directories.
let g:bufExplorerShowTabBuffer=0
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSplitVertSize=30    " New split windows size set by Vim.
let g:bufExplorerSplitHorzSize=8     " New split window is n rows high.
let g:bufExplorerShowNoName=1        " Show "No Name" buffers.
let g:bufExplorerSplitBelow=0        " Split new window below current.
let g:bufExplorerSortBy='number'     " Sort by the buffer's number.
let g:bufExplorerSplitOutPathName=0  " Don't split the path and file
                                     " name.

" <F2>: NERD tree
map <silent> <F2> <Esc>:NERDTreeToggle<CR>

" <F3>: Vimfiler explorer
"let g:vimfiler_as_default_explorer = 1
"let g:vimfiler_tree_leaf_icon = ' '
"let g:vimfiler_tree_opened_icon = '▾'
"let g:vimfiler_tree_closed_icon = '▸'
"let g:vimfiler_marked_file_icon = '✓'
"let g:my_vimfiler_explorer_name = 'explorer'
"let g:my_vimfiler_winwidth = 30
"let g:vimfiler_safe_mode_by_default = 0
"map <silent> <F3> <Esc>:VimFilerExplorer<CR>

" F10
map <silent> <F10> <Esc>:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" NERDTree options
let g:NERDTreeWinPos        = "right"
let g:NERDTreeShowBookmarks = 0
let g:NERDTreeStatusLine    = 1

" <F4>: RemoveTrailingWhitespaces
nnoremap <F5> :call RemoveTrailingWhitespaces()<CR>

" tagbar
"nmap <F8> :TagbarToggle<CR>

" ctrlp
nnoremap <C-P> :cd %:p:h<cr>:CtrlPMixed<cr>

" ctrl+space: buffer switching
"nnoremap <C-space> :Unite -quick-match buffer<CR>

" Leader:gs Gstatus
nnoremap <Leader>gs :Gstatus<CR>

" Turn on the mouse, since it doesn't play well with tmux anyway. This way I can
" scroll in the terminal
set mouse=a

" Give one virtual space at end of line
"set virtualedit=onemore

" Always splits to the right and below
set splitright
set splitbelow

" 256bit terminal
set t_Co=256
"colorscheme 256_noir
"colorscheme seoul256
"colorscheme setting can be found at the end of this _vimrc file

" Sets how many lines of history vim has to remember
set history=10000

" Set to auto read when a file is changed from the outside
set autoread

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=3
set sidescrolloff=5

" No need to show mode
set noshowmode

" translate-shell
set keywordprg=trans\ :de

set wildmode=list:longest,full
set wildmenu "turn on wild menu

set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app
set wildignore+=*/tmp/**,*.so,*.swp,*.zip,*.tar,*.bz2,*.gz
set wildignore+=*/node_modules/**,*/.git/**

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Allow changing buffer without saving it first
set hidden

" Set backspace config
set backspace=eol,start,indent

" Case insensitive search
"set ignorecase
set smartcase

" Make regex a little easier to type
set magic

" Show incomplete commands
set showcmd

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Always show the statusline
set laststatus=2

" Column width indicator
"set colorcolumn=+1

" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
"if has ('unnamedplus')
  "set clipboard=unnamedplus
"else
  "set clipboard=unnamed
"endif

" <Leader>cd: Switch to the directory of the open buffer
nnoremap <Leader>cd :cd %:p:h<cr>:pwd<cr>

" U: Redos since 'u' undos
nnoremap U :redo<cr>

" --- javascript-libraries-syntax ------- --- --  -

"let g:used_javascript_libs = 'jquery,underscore,angularjs,angularui,angularuirouter,react,requirejs,sugar,jasmine,chai,handlebars'
let g:used_javascript_libs = 'requirejs,jasmine'

" -- see http://amix.dk/blog/post/19548
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile

    " max changes that can be undone
    set undolevels=1000

    " max lines to save for undo on buffer reload
    set undoreload=10000
endif

" --- conceal // vim-javascript -------------------- --- --  -

set conceallevel=2
au FileType json setlocal conceallevel=0

let g:javascript_enable_domhtmlcss = 1

"let g:javascript_conceal_function  = "ƒ"
"let g:javascript_conceal_function  = "λ"
"let g:javascript_conceal_null      = "ø"
"let g:javascript_conceal_this      = "@"
"let g:javascript_conceal_return    = "⇚"
"let g:javascript_conceal_undefined = "¿"
"let g:javascript_conceal_NaN       = "ℕ"
"let g:javascript_conceal_prototype = "¶"
"let g:javascript_conceal_static    = "•"
"let g:javascript_conceal_super     = "Ω"
"П
"λ

" --- YouCompleteMe -------------------- --- --  -

let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_invoke_completion = '<C-Space>'
"let g:ycm_cache_omnifunc = 0
"let g:ycm_use_ultisnips_completer = 1

" supertab
let g:SuperTabDefaultCompletionType = "<C-p>"
let g:SuperTabContextDefaultCompletionType = "context"

" Auto complete setting
"set completeopt=longest,menuone,preview
set completeopt=menuone,preview
set completeopt=menu

" --- Goyo ------------------ --- --  -

let g:goyo_width = 120
map <silent> <F3> <Esc>:Goyo<CR>

" --- SyntasticToggle --------------------- --- --  -

nmap <silent> <F4> :SyntasticToggleMode<CR>

" --- vim-jsx -------------------- --- --  -

let g:jsx_ext_required = 0
let g:jsx_pragma_required = 0


" --- lightline -------------------- --- --  -

if has("gui_running")

          "\ 'colorscheme': 'powerline',
          "\ 'colorscheme': 'jellybeans',
          "\ 'colorscheme': 'Tomorrow',
          "\ 'colorscheme': 'Tomorrow_Night',
          "\ 'colorscheme': 'Tomorrow_Night_Blue',
          "\ 'colorscheme': 'Tomorrow_Night_Bright',
          "\ 'colorscheme': 'Tomorrow_Night_Eighties',
          "\ 'colorscheme': 'solarized',
          "\ 'colorscheme': 'solarized_dark',
          "\ 'colorscheme': 'solarized_light',
          "\ 'colorscheme': 'landscape',
          "\ 'colorscheme': 'wombat',
          "\ 'colorscheme': '16color',

    let g:lightline = {
          \ 'colorscheme': 'powerline',
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
          \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
          \ },
          \ 'component_function': {
          \   'fugitive':  'MyFugitive',
          \   'readonly':  'MyReadonly',
          \   'modified':  'MyModified',
          \   'mode':      'MyMode',
          \   'ctrlpmark': 'CtrlPMark',
          \   'filename':  'MyFilename'
          \ },
          \ 'component_expand': {
          \   'syntastic': 'SyntasticStatuslineFlag',
          \ },
          \ 'component_type': {
          \   'syntastic': 'error',
          \ },
          \ 'separator': { 'left': '', 'right': '' },
          \ 'subseparator': { 'left': '', 'right': '' }
          \ }
else
    let g:lightline = {
          \ 'colorscheme': 'solarized',
          \ 'active': {
          \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
          \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
          \ },
          \ 'component_function': {
          \   'fugitive':  'MyFugitive',
          \   'readonly':  'MyReadonly',
          \   'modified':  'MyModified',
          \   'mode':      'MyMode',
          \   'ctrlpmark': 'CtrlPMark',
          \   'filename':  'MyFilename'
          \ },
          \ 'component_expand': {
          \   'syntastic': 'SyntasticStatuslineFlag',
          \ },
          \ 'component_type': {
          \   'syntastic': 'error',
          \ }
          \ }
endif

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    if has("gui_running")
        return ""
    else
        return "RO"
    endif
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    if has("gui_running")
        return strlen(_) ? ' '._ : ''
    else
        return strlen(_) ? '| '._ : ''
    endif
  endif
  return ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp,*.js,*.coffee,*.rb,*.html,*.jade,*.css,*.less,*.sass,*.scss,*.json call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

" --- syntastic -------- --  -

let g:syntastic_error_symbol = '💀'
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_error_symbol = ''
let g:syntastic_warning_symbol = '😧'
"let g:syntastic_warning_symbol = '➤'
"let g:syntastic_warning_symbol = ''

" Check on buffer open
let g:syntastic_check_on_open = 0
let g:syntastic_stl_format = '!%w ✗%e'
"let g:syntastic_stl_format = 'w%w E%e'

let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_checkers = ['jscs']

let g:syntastic_css_checkers = ['']

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker."

" -- autoformat --------- --  -

noremap <A-C-f> :Autoformat<CR>
vnoremap <A-C-f> :Autoformat<CR>

"let g:formatters_javascript = ['jscs']

"let g:formatdef_eslint = '"eslint-formatter"'
"let g:formatters_javascript = ['eslint']

" --  vim-jsbeautify --------- --  -

"autocmd FileType javascript noremap <buffer> <s-c-f> :call JsBeautify()<cr>
"autocmd FileType html noremap <buffer> <s-c-f> :call HtmlBeautify()<cr>
"autocmd FileType css noremap <buffer> <s-c-f> :call CSSBeautify()<cr>

"autocmd FileType javascript vnoremap <buffer>  <s-c-f> :call RangeJsBeautify()<cr>
"autocmd FileType html vnoremap <buffer> <s-c-f> :call RangeHtmlBeautify()<cr>
"autocmd FileType css vnoremap <buffer> <s-c-f> :call RangeCSSBeautify()<cr>

" editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" --- ex commands ------- --  -
:command Wd write|bdelete

" vim-tabber
"set tabline=%!tabber#TabLine()

set showtabline=1

" --- gui -------------- --- --  -

hi clear

if has("gui_running")

    "set number
    set nonumber

    "set guioptions=egmrL
    "set guioptions=egm
    set guioptions=heagm

    set nocursorline
    "set cursorline

    " -- dark ---------- --- --  -
    "colorscheme macvim
    "colorscheme mango
    "colorscheme hybrid
    "colorscheme jellybeans
    "colorscheme seoul256
    "colorscheme solarized
    "colorscheme obsidian
    "colorscheme obsidian2
    "colorscheme manuscript
    "colorscheme doorhinge
    "colorscheme void
    "colorscheme sexy-railscasts
    "colorscheme nerv-ous
    "colorscheme gruvbox
    "colorscheme iceberg
    "colorscheme eclm_wombat
    "colorscheme mustang
    "colorscheme Revolution
    "colorscheme Benokai
    "colorscheme heroku
    "colorscheme sprinkles
    "colorscheme gotham256
    "colorscheme flattown
    "colorscheme coffee
    "colorscheme abra
    "colorscheme bluedrake
    "colorscheme bubblegum
    "colorscheme beekai
    "colorscheme shades-of-teal
    "colorscheme mushroom
    "colorscheme Spink
    "colorscheme ecostation
    "colorscheme mustang
    "colorscheme scheakur
    "colorscheme CodeFactoryv3

    "colorscheme whitebox
    "colorscheme eclipse
    "colorscheme seoul256-light
    "colorscheme sweater
    "colorscheme distinguished
    "colorscheme PaperColor

    "colorscheme nerv-ous
    "colorscheme bubblegum
    "colorscheme sweater
    "colorscheme flattown
    "colorscheme hemisu
    "colorscheme Revolution
    "colorscheme mango
    "colorscheme github

    "colorscheme sorcerer
    "colorscheme frozen
    "colorscheme material
    "colorscheme deepsea
    "colorscheme anderson
    "colorscheme onedark
    "colorscheme mango
    "colorscheme badwolf
    "colorscheme adventurous

    "colorscheme hybrid_reverse
    "colorscheme hybrid_material

    "colorscheme Tomorrow
    "colorscheme Tomorrow-Night
    "colorscheme pencil
    "colorscheme pyte
    "colorscheme base16-atelierdune

    "hi! link Conceal Function
    "hi Conceal guifg=#4281d0 guibg=#ffffff gui=bold
    "hi Conceal guifg=#4281d0 guibg=#000000 gui=bold
    "hi Conceal guifg=#a01040 guibg=#1a1a43 gui=bold
    "hi Conceal guifg=#a01040 guibg=#ffffff gui=bold

    "hi SignColumn            guifg=#615882 guibg=#262626
    "hi VertSplit             guifg=#262626 guibg=#262626
    "hi SyntasticWarningSign  guifg=#ffff00 guibg=#262626

    "hi TabLineSel            guibg=#FFFFFF guifg=#0A5F5F
    "hi TabLineFill           guibg=#262626 guifg=#585858
    "hi TabLine               guibg=#1488ad guifg=#ffffff

    "Normal ctermfg=234 ctermbg=255 guifg=#2e2e2e guibg=#f0f0e5
    "hi CursorLine guibg=#ebebe0

    "hi clear

    " --- light colorschemes ------- --  -

    "set background=light
    "colorscheme snowcrystal
    "colorscheme scheakur
    "colorscheme hemisu
    "colorscheme lucius
    "colorscheme pencil

    "colorscheme PaperColor
    "colorscheme proton
    "colorscheme bayQua

    "hi Normal           guifg=#333333 guibg=#fffff8
    "hi CursorLine                     guibg=#fafaf3

    "hi SignColumn       guibg=#EFE9D7 guifg=#586E75
    "hi NonText          guifg=#d6d6d0 guibg=#f7f7f0

    "hi! link VertSplit  NonText
    "hi! link LineNr     NonText

    "set background=dark
    "colorscheme darktango
    "colorscheme corporation

    "hi SignColumn       guibg=#1e2426 guifg=#586E75
    "hi NonText          guibg=#1e2426 guifg=#3e4446

    "hi! link VertSplit  NonText
    "hi! link LineNr     NonText

    "colorscheme pencil
    "colorscheme lucius
    "colorscheme Tomorrow-Night
    "colorscheme colorsbox-material
    "colorscheme colorsbox-greenish
    "colorscheme tango-desert

    "colorscheme colorsbox-faff
    "colorscheme adventurous
    "colorscheme buddy
    "colorscheme VIvid
    "colorscheme holokai
    "colorscheme dunkelmagie

    " --- new colorschemes ------- --  -

    "set background=light
    "colorscheme OceanicNext
    "colorscheme Ubaryd
    "colorscheme Laederon
    "colorscheme scheakur

    " #==--- new dark colorschemes ------- --  -

    " Day is default
    "let g:sierra_Twilight = 1 " Twilight
    "let g:sierra_Midnight = 1 " Midnight
    let g:sierra_Pitch = 1    " Darkest: Pitch
    "colorscheme sierra

    "colorscheme Kafka
    "colorscheme hilal
    "colorscheme eva
    "colorscheme scooby
    "colorscheme twilight

    "colorscheme hybrid
    "colorscheme distill
    "colorscheme zeroOne  "off
    "colorscheme birds-of-paradise  "off

    " #==--- --  -

    "hi CursorLine guibg=#100217
    "hi VertSplit guibg=#201227 guifg=#000000


    " --- gui_linux -------------- --- --  -

    if has("gui_gtk2")

        " Navigate between tabs: ctrl+alt+(left|right)
        map <silent> <C-M-Left> gT
        map <silent> <C-M-Right> gt
        "map <D-A-Right> :tabnext<CR>
        "imap <D-A-Right> :tabnext<CR>
        "map <D-A-Left> :tabprevious<CR>
        "imap <D-A-Left> :tabprevious<CR>

        " ======================================
        " guifont
        " --------------------------------------

        "set guifont=Knack:h14
        set guifont=Fura\ Mono\ for\ Powerline\ 11

        "set linespace=2
        "set linespace=1
        "set linespace=0

        let g:enable_bold_font = 1

        "set lines=37 columns=140
        set lines=32 columns=135
        "set lines=36 columns=130

        "set background=dark
        "colorscheme breeze
        set background=light
        "colorscheme scheakur
        "colorscheme zeroOne
        colorscheme Tomorrow

    endif

    " --- gui_macvim -------------- --- --  -

    if has("gui_macvim")

        set macligatures

        let macvim_skip_cmd_opt_movement=1

        " Navigate between tabs: ctrl+alt+(left|right)
        map <silent> <C-M-Left> gT
        map <silent> <C-M-Right> gt
        "map <D-A-Right> :tabnext<CR>
        "imap <D-A-Right> :tabnext<CR>
        "map <D-A-Left> :tabprevious<CR>
        "imap <D-A-Left> :tabprevious<CR>

        " ======================================
        " guifont
        " --------------------------------------

        "set guifont=Knack:h14
        "set guifont=Literation\ Mono\ Powerline\ Nerd\ Font\ Complete:h14
        set guifont=Fura\ Mono\ Medium\ for\ Powerline:h14

        "set linespace=2
        set linespace=1
        "set linespace=0

        let g:enable_bold_font = 1

        set transparency=2
        "set blurradius=4

        "set lines=37 columns=140
        "set lines=42 columns=128
        set lines=33 columns=142
        "set lines=36 columns=130

        " #==--- newest light colorschemes ------- --  -

        set background=light
        "colorscheme Tomorrow
        "colorscheme zeroOne-Light
        colorscheme zeroOne-LightComic

        let g:two_firewatch_italics=1
        "colorscheme two-firewatch

        " #==--- newest light colorschemes ------- --  -

        "set background=dark
        "colorscheme two-firewatch
        "colorscheme spacegray
        "colorscheme moriarty
        "colorscheme srcery
        "colorscheme deep-space


    endif

    " MiniBufExpl Colors
    "hi MBENormal               guifg=#808080 guibg=fg
    "hi MBEChanged              guifg=#CD5907 guibg=fg
    "hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
    "hi MBEVisibleChanged       guifg=#F1266F guibg=fg
    "hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
    "hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

else  " gui_running

    "colorscheme twilight256
    "colorscheme seoul256
    "colorscheme xoria256
    "colorscheme 256-grayvim
    colorscheme 256_noir

endif  " gui_running

hi SpellCap term=reverse ctermbg=9 gui=undercurl guisp=Red
