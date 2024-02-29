" Name:         highlightag.vim
" Description:  get highlight info from ctags command.
" Author:       MeF
" GitHub:       https://github.com/MeF0504/highlightag.vim

" {{{
let s:hitag_dict = {
            \ 'ant': {
                \'p': ['HiTagProjects', ''],
                \'t': ['HiTagTargets', ''],
                \ },
            \ 'asm': {
                \'d': ['HiTagDefines', ''],
                \'l': ['HiTagLabels', ''],
                \'m': ['HiTagMacros', ''],
                \'t': ['HiTagTypes', ''],
                \ },
            \ 'asp': {
                \'d': ['HiTagConstants', ''],
                \'c': ['HiTagClasses', ''],
                \'f': ['HiTagFunctions', ''],
                \'s': ['HiTagSubroutines', ''],
                \'v': ['HiTagVariables', ''],
                \ },
            \ 'awk': {
                \'f': ['HiTagFunctions', ''],
                \ },
            \ 'basic': {
                \'c': ['HiTagConstants', ''],
                \'f': ['HiTagFunctions', ''],
                \'l': ['HiTagLabels', ''],
                \'t': ['HiTagTypes', ''],
                \'v': ['HiTagVariables', ''],
                \'g': ['HiTagEnumerations', ''],
                \ },
            \ 'beta': {
                \'f': ['HiTagFragment_definitions', ''],
                \'p': ['HiTagAll_patterns', ''],
                \'s': ['HiTagSlots', ''],
                \'v': ['HiTagPatterns', ''],
                \ },
            \ 'c': {
                \ 'c': ['HiTagClasses', 'Type'],
                \ 'd': ['HiTagDefinitions', ''],
                \ 'e': ['HiTagEnumerators', ''],
                \ 'f': ['HiTagFunction_definitions', 'Function'],
                \ 'g': ['HiTagEnumeration_names', ''],
                \ 'l': ['HiTagLocal_variables', ''],
                \ 'm': ['HiTagMembers', ''],
                \ 'n': ['HiTagNamespaces', ''],
                \ 'p': ['HiTagPrototypes', ''],
                \ 's': ['HiTagStructure', 'Structure'],
                \ 't': ['HiTagTypedefs', 'Type'],
                \ 'u': ['HiTagUnion', ''],
                \ 'v': ['HiTagVariables', ''],
                \ 'x': ['HiTagExternal_and_forward_variable_declarations', ''],
                \ },
            \ 'cpp': {
                \ 'c': ['HiTagClasses', 'Type'],
                \ 'd': ['HiTagDefinitions', ''],
                \ 'e': ['HiTagEnumerators', ''],
                \ 'f': ['HiTagFunction_definitions', 'Function'],
                \ 'g': ['HiTagEnumeration_names', ''],
                \ 'l': ['HiTagLocal_variables', ''],
                \ 'm': ['HiTagMembers', ''],
                \ 'n': ['HiTagNamespaces', ''],
                \ 'p': ['HiTagPrototypes', ''],
                \ 's': ['HiTagStructure', 'Structure'],
                \ 't': ['HiTagTypedefs', 'Type'],
                \ 'u': ['HiTagUnion', ''],
                \ 'v': ['HiTagVariables', ''],
                \ 'x': ['HiTagExternal_and_forward_variable_declarations', ''],
                \ },
            \'cs': {
                \'c': ['HiTagClasses', ''],
                \'d': ['HiTagMacro_definitions', ''],
                \'e': ['HiTagEnumerators', ''],
                \'E': ['HiTagEvents', ''],
                \'f': ['HiTagFields', ''],
                \'g': ['HiTagEnumeration_names', ''],
                \'i': ['HiTagInterfaces', ''],
                \'l': ['HiTagLocal_variables', ''],
                \'m': ['HiTagMethods', ''],
                \'n': ['HiTagNamespaces', ''],
                \'p': ['HiTagProperties', ''],
                \'s': ['HiTagStructure', ''],
                \'t': ['HiTagTypedefs', ''],
                \ },
            \'cobol': {
                \'d': ['HiTagData_items', ''],
                \'f': ['HiTagFile_descriptions', ''],
                \'g': ['HiTagGroup_items', ''],
                \'p': ['HiTagParagraphs', ''],
                \'P': ['HiTagProgram_ids', ''],
                \'s': ['HiTagSections', ''],
                \ },
            \'dosbatch':{
                \'l': ['HiTagLabels', ''],
                \'v': ['HiTagVariables', ''],
                \ },
            \'eiffel': {
                \'c': ['HiTagClasses', ''],
                \'f': ['HiTagFeatures', ''],
                \'l': ['HiTagLocal_entities', ''],
                \ },
            \'erlang': {
                \'d': ['HiTagMacro_definitions', ''],
                \'f': ['HiTagFunctions', ''],
                \'m': ['HiTagModules', ''],
                \'r': ['HiTagRecord_definitions', ''],
                \ },
            \'flex': {
                \'f': ['HiTagFunctions', ''],
                \'c': ['HiTagClasses', ''],
                \'m': ['HiTagMethods', ''],
                \'p': ['HiTagProperties', ''],
                \'v': ['HiTagGlobal_variables', ''],
                \'x': ['HiTagMxtags', ''],
                \ },
            \'fortran': {
                \'b': ['HiTagBlock_data', ''],
                \'c': ['HiTagCommon_blocks', ''],
                \'e': ['HiTagEntry_points', ''],
                \'f': ['HiTagFunctions', ''],
                \'i': ['HiTagInterface_contents', ''],
                \'k': ['HiTagType_structure', ''],
                \'l': ['HiTagLabels', ''],
                \'L': ['HiTagLocal_block_namelist_variables', ''],
                \'m': ['HiTagModules', ''],
                \'n': ['HiTagNamelists', ''],
                \'p': ['HiTagPrograms', ''],
                \'s': ['HiTagSubroutines', ''],
                \'t': ['HiTagDerived_types_and_structures', ''],
                \'v': ['HiTagProgram_and_module_variables', ''],
                \ },
            \'html': {
                \'a': ['HiTagNamed_anchors', ''],
                \'f': ['HiTagJavaScript_functions', ''],
                \ },
            \'java': {
                \'c': ['HiTagClasses', ''],
                \'e': ['HiTagEnum_constants', ''],
                \'f': ['HiTagFields', ''],
                \'g': ['HiTagEnum_types', ''],
                \'i': ['HiTagInterfaces', ''],
                \'l': ['HiTagLocal_variables', ''],
                \'m': ['HiTagMethods', ''],
                \'p': ['HiTagPackages', ''],
                \ },
            \'javascript': {
                \'f': ['HiTagFunctions', ''],
                \'c': ['HiTagClasses', ''],
                \'m': ['HiTagMethods', ''],
                \'p': ['HiTagProperties', ''],
                \'v': ['HiTagGlobal_variables', ''],
                \ },
            \'lisp': {
                \'f': ['HiTagFunctions', ''],
                \ },
            \'lua': {
                \'f': ['HiTagFunctions', ''],
                \ },
            \'make': {
                \'m': ['HiTagMacros', ''],
                \ },
            \'matlab': {
                \'f': ['HiTagFunction', ''],
                \ },
            \'ocaml': {
                \'c': ['HiTagClasses', ''],
                \'m': ['HiTagObjects_method', ''],
                \'M': ['HiTagModule_functor', ''],
                \'v': ['HiTagGlobal_variable', ''],
                \'t': ['HiTagTypes', ''],
                \'f': ['HiTagFunction', ''],
                \'C': ['HiTagConstructor', ''],
                \'r': ['HiTagStructure_field', ''],
                \'e': ['HiTagException', ''],
                \ },
            \'pascal': {
                \'f': ['HiTagFunctions', ''],
                \'p': ['HiTagProcedures', ''],
                \ },
            \'perl': {
                \'c': ['HiTagConstants', ''],
                \'f': ['HiTagFormats', ''],
                \'l': ['HiTagLabels', ''],
                \'p': ['HiTagPackages', ''],
                \'s': ['HiTagSubroutines', ''],
                \'d': ['HiTagSubroutine_declarations', ''],
                \ },
            \'php': {
                \'c': ['HiTagClasses', ''],
                \'i': ['HiTagInterfaces', ''],
                \'d': ['HiTagConstant_definitions', ''],
                \'f': ['HiTagFunctions', ''],
                \'v': ['HiTagVariables', ''],
                \'j': ['HiTagJavascript_functions', ''],
                \ },
            \ 'python': {
                \ 'c': ['HiTagClasses', ''],
                \ 'f': ['HiTagFunctions', 'Function'],
                \ 'm': ['HiTagMembers', ''],
                \ 'v': ['HiTagVariables', ''],
                \ 'i': ['HiTagImports', ''],
                \ },
            \'rexx': {
                \'s': ['HiTagSubroutines', ''],
                \ },
            \'ruby': {
                \'c': ['HiTagClasses', ''],
                \'f': ['HiTagMethods', ''],
                \'m': ['HiTagModules', ''],
                \'F': ['HiTagSingleton methods', ''],
                \ },
            \'scheme': {
                \'f': ['HiTagFunctions', ''],
                \'s': ['HiTagSets', ''],
                \ },
            \ 'sh': {
                \ 'f': ['HiTagFunctions', 'Function'],
                \ },
            \'slang': {
                \'f': ['HiTagFunctions', ''],
                \'n': ['HiTagNamespaces', ''],
                \ },
            \'sml': {
                \'e': ['HiTagException_declarations', ''],
                \'f': ['HiTagFunction_definitions', ''],
                \'c': ['HiTagFunctor_definitions', ''],
                \'s': ['HiTagSignature_declarations', ''],
                \'r': ['HiTagStructure_declarations', ''],
                \'t': ['HiTagType_definitions', ''],
                \'v': ['HiTagValue_bindings', ''],
                \ },
            \'sql': {
                \'c': ['HiTagCursors', ''],
                \'d': ['HiTagPrototypes', ''],
                \'f': ['HiTagFunctions', ''],
                \'F': ['HiTagRecord_fields', ''],
                \'l': ['HiTagLocal_variables', ''],
                \'L': ['HiTagBlock_label', ''],
                \'P': ['HiTagPackages', ''],
                \'p': ['HiTagProcedures', ''],
                \'r': ['HiTagRecords', ''],
                \'s': ['HiTagSubtypes', ''],
                \'t': ['HiTagTables', ''],
                \'T': ['HiTagTriggers', ''],
                \'v': ['HiTagVariables', ''],
                \'i': ['HiTagIndexes', ''],
                \'e': ['HiTagEvents', ''],
                \'U': ['HiTagPublications', ''],
                \'R': ['HiTagServices', ''],
                \'D': ['HiTagDomains', ''],
                \'V': ['HiTagViews', ''],
                \'n': ['HiTagSynonyms', ''],
                \'x': ['HiTagMobiLink_Table_Scripts', ''],
                \'y': ['HiTagMobiLink_Conn_Scripts', ''],
                \ },
            \'tcl': {
                \'c': ['HiTagClasses', ''],
                \'m': ['HiTagMethods', ''],
                \'p': ['HiTagProcedures', ''],
                \ },
            \'tex': {
                \'c': ['HiTagChapters', ''],
                \'s': ['HiTagSections', ''],
                \'u': ['HiTagSubsections', ''],
                \'b': ['HiTagSubsubsections', ''],
                \'p': ['HiTagParts', ''],
                \'P': ['HiTagParagraphs', ''],
                \'G': ['HiTagSubparagraphs', ''],
                \ },
            \'vera': {
                \'c': ['HiTagClasses', ''],
                \'d': ['HiTagMacro_definitions', ''],
                \'e': ['HiTagEnumerators', ''],
                \'f': ['HiTagFunction_definitions', ''],
                \'g': ['HiTagEnumeration_names', ''],
                \'l': ['HiTagLocal_variables', ''],
                \'m': ['HiTagClass_struct_union_members', ''],
                \'p': ['HiTagPrograms', ''],
                \'P': ['HiTagFunction_prototypes', ''],
                \'t': ['HiTagTasks', ''],
                \'T': ['HiTagTypedefs', ''],
                \'v': ['HiTagVariable_definitions', ''],
                \'x': ['HiTagExternal_variable_declarations', ''],
                \ },
            \'verilog': {
                \'c': ['HiTagConstants', ''],
                \'e': ['HiTagEvents', ''],
                \'f': ['HiTagFunctions', ''],
                \'m': ['HiTagModules', ''],
                \'n': ['HiTagNet_data_types', ''],
                \'p': ['HiTagPorts', ''],
                \'r': ['HiTagRegister_data_types', ''],
                \'t': ['HiTagTasks', ''],
                \ },
            \'vhdl': {
                \'c': ['HiTagConstant_declarations', ''],
                \'t': ['HiTagType_definitions', ''],
                \'T': ['HiTagSubtype_definitions', ''],
                \'r': ['HiTagRecord_names', ''],
                \'e': ['HiTagEntity_declarations', ''],
                \'C': ['HiTagComponent_declarations', ''],
                \'d': ['HiTagPrototypes', ''],
                \'f': ['HiTagFunction_prototypes_declarations', ''],
                \'p': ['HiTagProcedure_prototypes_declarations', ''],
                \'P': ['HiTagPackage_definitions', ''],
                \'l': ['HiTagLocal_definitions', ''],
                \ },
            \ 'vim': {
                \ 'a': ['HiTagAutocommand_groups', ''],
                \ 'c': ['HiTagUser_defined_commands', 'Identifier'],
                \ 'f': ['HiTagFunction_definitions', 'Function'],
                \ 'm': ['HiTagMaps', 'Special'],
                \ 'v': ['HiTagVariables', ''],
                \ },
            \'yacc': {
                \'l': ['HiTagLabels', ''],
                \ },
            \ }
" }}}

let s:sid = expand('<SID>')
if empty(s:sid)
    function! s:SID_PREFIX() " tentative
        return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
    endfunction
    let s:sid = s:SID_PREFIX()
endif

function! highlightag#update_hi_setting(highlight_setting) abort
    if type(a:highlight_setting) != type({})
        call s:echo_err('argument is not a correct format.')
        return
    endif
    for ft in keys(a:highlight_setting)
        if type(a:highlight_setting[ft]) != type({})
            call s:echo_err('argument is not a correct format.')
            return
        endif
        for kind in keys(a:highlight_setting[ft])
            let hi_info = a:highlight_setting[ft][kind]
            if !(type(hi_info) == type([]) && len(hi_info) == 2)
                call s:echo_err('argument is not a correct format.')
                return
            endif
            if !(type(hi_info[0]) == type('') && type(hi_info[1]) == type(''))
                call s:echo_err('argument is not a correct format.')
                return
            endif
        endfor
    endfor
    call extend(s:hitag_dict, a:highlight_setting, 'force')
endfunction

function! highlightag#show_highlight_info(...) abort
    if a:0 == 0
        let ft_list = sort(keys(s:hitag_dict))
    else
        let ft_list = a:000
    endif
    for ft in ft_list
        if !s:chk_ft(ft)
            call s:echo_war(ft..' is not supported.')
            continue
        endif
        echo printf('file type: %s', ft)
        for kind in sort(keys(s:hitag_dict[ft]))
            echo printf("    kind: '%s' highlight: ", kind)
            let hi_info = s:hitag_dict[ft][kind]
            if empty(hi_info[1])
                execute 'echohl '..hi_info[0]
                echon printf("%s", hi_info[0])
            else
                execute 'echohl '..hi_info[1]
                echon printf("%s => %s", hi_info[0], hi_info[1])
            endif
            echohl None
        endfor
    endfor
endfunction

function! s:get_ft(arg) abort
    if a:arg[0] == 0
        return &filetype
    else
        return a:arg[1]
    endif
endfunction

function! s:chk_ft(filetype) abort
    if empty(a:filetype)
        return 0
    endif
    if index(keys(s:hitag_dict), a:filetype) == -1
        return 0
    else
        return 1
    endif
endfunction

function! highlightag#check_filetype(filetype) abort
    return s:chk_ft(a:filetype)
endfunction

function! s:echo_war(str) abort
    echohl WarningMsg
    echomsg '(highlightag) '..a:str
    echohl None
endfunction

function! s:echo_err(str) abort
    echohl ErrorMsg
    echomsg '(highlightag) '..a:str
    echohl None
endfunction

function! s:get_tag_info(job, filetype) abort
    if !executable('ctags')
        if !a:job
            call s:echo_err('ctags is not executable.')
        endif
        return []
    endif
    let ctags_cmd = get(g:, 'highlightag#ctags_cmd', 'ctags')
    let ctags_opts = get(g:, 'highlightag#ctags_opts', '-n')
    let ctags_cmds = printf('%s -f - --language-force=%s %s %s',
                \ ctags_cmd, a:filetype, ctags_opts, fnameescape(expand('%')))

    if a:job
        " let ctags_cmds = split(ctags_cmds)
        call s:run_job(ctags_cmds, [a:filetype, win_getid()])
    else
        silent let ctags_res = systemlist(ctags_cmds)
        return ctags_res
    endif
    return []
endfunction

function! s:get_tag_info_file(file, job, filetype) abort
    if has('win32') || has('win64')
        let show_cmd = 'type'
    else
        let show_cmd = 'cat'
    endif
    if !executable(show_cmd)
        if !a:job
            call s:echo_err(printf('failed to exexute %s.', show_cmd))
        endif
        return []
    endif

    if filereadable(a:file)
        if a:job
            call s:run_job([show_cmd, a:file], [a:filetype, win_getid()])
        else
            silent let ctags_info = systemlist(printf('%s %s', show_cmd, a:file))
            return ctags_info
        endif
    endif
    return []
endfunction

function! s:run_job(cmd, args) abort
    if has('job')
        let job = job_start(a:cmd, {'callback': function(s:sid..'job_cb', a:args)})
    elseif exists('*jobstart')
        let job = jobstart(a:cmd, {'on_stdout': function(s:sid..'job_neocb', a:args)})
    endif
endfunction

function! <SID>job_cb(filetype, winid, ch, message) abort
    call s:set_keywards([a:message], a:filetype, a:winid)
endfunction

function! <SID>job_neocb(filetype, winid, jobid, data, event) abort
    call s:set_keywards(a:data, a:filetype, a:winid)
endfunction

function! s:set_keywards(tag_info, filetype, winid) abort
    for line in a:tag_info
        if line[0] == '!'
            continue
        endif
        if match(line, "\t") == -1
            continue
        endif
        let type = split(line, "\t")[0]
        let idx = match(line, ';"')+3
        let kind = line[idx:idx]
        if s:chk_ft(a:filetype) && (index(keys(s:hitag_dict[a:filetype]), kind) != -1)
            let exe_cmd = printf('syntax keyword %s %s', s:hitag_dict[a:filetype][kind][0], type)
            call win_execute(a:winid, exe_cmd)
            " echomsg exe_cmd
        endif
    endfor
endfunction

let s:fts_set_his = []
function! s:set_highlights(filetype) abort
    if !s:chk_ft(a:filetype)
        return
    endif
    if index(s:fts_set_his, a:filetype) != -1
        return
    endif

    let hi_settings = s:hitag_dict[a:filetype]
    for key in keys(hi_settings)
        if !empty(hi_settings[key][1])
            let hi_cmd = printf('highlight default link %s %s', hi_settings[key][0], hi_settings[key][1])
        else
            let hi_cmd = printf('highlight default %s ctermfg=None', hi_settings[key][0])
        endif
        execute hi_cmd
        " echomsg hi_cmd
    endfor
    call add(s:fts_set_his, a:filetype)
endfunction

function! highlightag#run_hitag(...) abort
    let filetype = s:get_ft(a:)
    if !s:chk_ft(filetype)
        call s:echo_err(printf('%s is not supported.', filetype))
        return
    endif
    let tag_info = s:get_tag_info(0, filetype)
    call s:set_keywards(tag_info, filetype, win_getid())
    call s:set_highlights(filetype)
endfunction

function! highlightag#run_hitag_job(...) abort
    let filetype = s:get_ft(a:)
    if !s:chk_ft(filetype)
        call s:echo_err(printf('%s is not supported.', filetype))
        return
    endif

    if has('job') || exists('*jobstart')
        call s:set_highlights(filetype)
        call s:get_tag_info(1, filetype)
    else
        call s:echo_err('job is not supported in this Vim.')
        return
    endif
endfunction

function! highlightag#run_hitag_file(...) abort
    let filetype = s:get_ft(a:)
    if !s:chk_ft(filetype)
        return
    endif

    for tfile in tagfiles()
        let tag_info = s:get_tag_info_file(tfile, 0, filetype)
        call s:set_keywards(tag_info, filetype, win_getid())
    endfor
    call s:set_highlights(filetype)
endfunction

function! highlightag#run_hitag_job_file(...) abort
    let filetype = s:get_ft(a:)
    if !s:chk_ft(filetype)
        return
    endif

    if has('job') || exists('*jobstart')
        call s:set_highlights(filetype)
        for tfile in tagfiles()
            call s:get_tag_info_file(tfile, 1, filetype)
        endfor
    else
        call s:echo_err('job is not supported in this Vim.')
        return
    endif
endfunction

