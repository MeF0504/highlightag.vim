" Name:         highlightag.vim
" Description:  get highlight info from ctags command.
" Author:       MeF
" GitHub:       https://github.com/MeF0504/highlightag.vim

if exists('g:loaded_highlightag')
    finish
endif

let g:loaded_highlightag = 1

if !executable('ctags')
    echohl ErrorMsg
    echomsg 'ctags is not executable. highlightag is not available.'
    echohl None
endif

let g:highlightag#startup = get(g:, 'highlightag#startup', 0)

if g:highlightag#startup
    call highlightag#auto_run()
endif

