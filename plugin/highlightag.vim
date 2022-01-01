" Name:         highlightag.vim
" Description:  get highlight info from ctags command.
" Author:       MeF
" GitHub:       https://github.com/MeF0504/highlightag.vim

if exists('g:loaded_highlightag')
    finish
endif

let g:loaded_highlightag = 1

if !executable('ctags')
    echohl WarningMsg
    echomsg 'ctags is not executable. Some functions in highlightag are not available.'
    echohl None
endif

command! HiTagRun <mods> call highlightag#run_hitag()
command! HiTagJob <mods> call highlightag#run_hitag_job()
command! HiTagFile <mods> call highlightag#run_hitag_file()
command! HiTagJobFile <mods> call highlightag#run_hitag_job_file()

