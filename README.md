# highlightag.vim

Vim plugin to get highlight information from ctags command.

## Requirements

- [ctags](http://ctags.sourceforge.net/) command
    - ([for Japanese](https://hp.vector.co.jp/authors/VA025040/ctags/ctags_j.html))

## Installation

if you use dein,
```vim
call dein#add('MeF0504/highlightag.vim')
```
or do something like this.

## Usage

This plugin doesn't work automatically. If you want to run it every when opening files, please add sentence like following.
```vim
augroup HiTags
    autocmd!
    autocmd Syntax * silent call highlightag#run_hitag()
augroup END
```

#### Available commands

```vim
HiTagRun
" or
call highlightag#run_hitag()
```
 sets highlights got from ctags output (run ctags command by using `system()`).

```vim
HiTagJob
" or
call highlightag#run_hitag_job()
```
 sets highlights got from ctags output (run ctags command by using `job_start()`).

```vim
HiTagFile
" or
call highlightag#run_hitag_file()
```
 sets highlights from tag files already made. (run `cat` command in macOS/Linux or `type` command in Windows, using `system()`.)

```vim
HiTagJobFile
" or
call highlightag#run_hitag_job_file()
```
 sets highlights from tag files already made. (run `cat` command in macOS/Linux or `type` command in Windows, using `job_start()`.)


## Options

- `g:highlightag#ctags_opts` set the options of ctags command executed in this plugin. default: `-n`.

- Highlights set in this plugin start from HiTag. You can check each highlight by `:filter HiTag highlight`. You can set highlights like `:hi HiTag~~ ctermfg=#` or `:hi link HiTag~~ Identifier`. Some highlights are already linked.

- You can append an additional highlight settings by calling `highlightag#update_hi_setting({highlight_setting})`. The argument should be a dictionary containing file types, kinds, and highlight names like
``` vim
{ 
    \ filetype1: {
        \ kind1: [highlight_name, linked_highlight_name],
        \ kind2: [highlight_name, ''],
        \ ...
    \ },
    \ filetype2: {
        \ kind3: [highlight_name, linked_highlight_name],
    \ },
}
```
    - It is possible to set the linked highlight name as `''`, and then the highlight name is linked nothing.
    - You can check current highlight settings by `:call highlightag#show_highlight_info()`(all information) or `:call highlightag#show_highlight_info(&filetype)`(show highlight information of current file type).
    - sample:
``` vim
let s:hitag_info = {
        \ 'typescript': {
            \ 'f': ['HiTagFunctions', 'Identifier'],
            \ 'c': ['HiTagClasses', ''],
            \ 'm': ['HiTagModules', ''],
        \ },
    \ }
call highlightag#update_hi_setting(s:hitag_info)
```

