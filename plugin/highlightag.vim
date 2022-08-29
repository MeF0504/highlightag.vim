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

command! -nargs=? HiTagRun <mods> call highlightag#run_hitag(<f-args>)
command! -nargs=? HiTagJob <mods> call highlightag#run_hitag_job(<f-args>)
command! -nargs=? HiTagFile <mods> call highlightag#run_hitag_file(<f-args>)
command! -nargs=? HiTagJobFile <mods> call highlightag#run_hitag_job_file(<f-args>)

