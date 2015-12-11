" --- vim-colorscheme -=* dunkelmagie *=- ----- --- --  -
" created 2015 by wolfger@spearwolf.de
" --------------------------------------- --- --  -

set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "dunkelmagie"

hi Normal                       gui=none       guibg=#102033 guifg=#fffff5
hi Type                         gui=none       guibg=#102033 guifg=#6080d0
hi Constant                     gui=none       guibg=#303030 guifg=#b8d65e
hi Identifier                   gui=bold       guibg=#001023 guifg=#f727a8
hi PreProc                      gui=none       guibg=#201023 guifg=#c02070
hi Statement                    gui=none       guibg=#203043 guifg=#c0ffff
hi Title                        gui=bold       guibg=#17273a guifg=#ffffff
hi Comment                      gui=italic     guibg=#001023 guifg=#607093

hi Folded                       gui=none       guibg=#304055 guifg=#a0b0c0

hi javascriptASscopeMethods     gui=underline  guibg=#102033 guifg=#ffffff
hi javascriptSFunction          gui=none       guibg=#001023 guifg=#ffffff

hi! link javascriptRTop javascriptSFunction
hi! link javascriptAServices javascriptSFunction

hi NonText                      gui=none       guibg=#203043 guifg=#607090
hi Cursor                                      guibg=#ffffff guifg=#000000
hi CursorLine                                  guibg=#172737
hi Visual                                      guibg=#405060
hi LineNr                       gui=none       guibg=#08182c guifg=#304063
hi SignColumn                   gui=none       guibg=#031326 guifg=#607093

hi VertSplit                    gui=none       guibg=#001023 guifg=#203040

hi Directory                    gui=none       guibg=#001023 guifg=#ffc030
hi NERDTreeCWD                  gui=none       guibg=#001023 guifg=#ffffcc
hi NERDTreeDirSlash             gui=none       guibg=#001023 guifg=#ffff90
hi NERDTreeOpenable             gui=none       guibg=#102033 guifg=#900040
hi NERDTreeClosable             gui=none       guibg=#102033 guifg=#c01070

hi NERDTreeHelp                 gui=none       guibg=#102033 guifg=#6080d0
hi NERDTreeHelpTitle            gui=none       guibg=#001023 guifg=#f04090
hi NERDTreeHelpKey              gui=none       guibg=#102033 guifg=#70f0ff

