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

The following command sets highlights got from ctags output.
```vim
call highlightag#run_hitag()
```

The following command sets to run highlightag#run_hitag every when opening files.
```vim
call highlightag#auto_run()
```

## Options

- `g:highlightag#ctags_opts` set the options of ctags command. default: `-n`.
- `g:highlightag#startup` If it is set 1, highlightag runs automatically. default: 0
- `g:highlightag#type` set the type for running ctags. default: 'normal'
    - `normal`: run ctags command use `system()`
    - `job`: run ctags command use `job_start()`

- Highlights set in this plugin start from HiTag. You can check each highlight by `:filter HiTag highlight`. You can set highlights like `:hi HiTag~~ ctermfg=#` or `:hi link HiTag~~ Identifier`. Some highlights are already linked.
