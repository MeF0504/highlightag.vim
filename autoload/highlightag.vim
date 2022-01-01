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
                \ 'f': ['HiTagFunction_definitions', 'Identifier'],
                \ 'g': ['HiTagEnumeration_names', ''],
                \ 'l': ['HiTagLocal_variables', ''],
                \ 'm': ['HiTagMembers', ''],
                \ 'n': ['HiTagNamespaces', ''],
                \ 'p': ['HiTagPrototypes', ''],
                \ 's': ['HiTagStructure', 'PreProc'],
                \ 't': ['HiTagTypedefs', 'Type'],
                \ 'u': ['HiTagUnion', ''],
                \ 'v': ['HiTagVariables', ''],
                \ 'x': ['HiTagExternal_and_forward_variable_declarations', ''],
                \ },
            \ 'cpp': {
                \ 'c': ['HiTagClasses', 'Type'],
                \ 'd': ['HiTagDefinitions', ''],
                \ 'e': ['HiTagEnumerators', ''],
                \ 'f': ['HiTagFunction_definitions', 'Identifier'],
                \ 'g': ['HiTagEnumeration_names', ''],
                \ 'l': ['HiTagLocal_variables', ''],
                \ 'm': ['HiTagMembers', ''],
                \ 'n': ['HiTagNamespaces', ''],
                \ 'p': ['HiTagPrototypes', ''],
                \ 's': ['HiTagStructure', 'PreProc'],
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
            \'javascripthitag': {
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
                \ 'f': ['HiTagFunctions', 'Identifier'],
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
                \ 'f': ['HiTagFunctions', 'Identifier'],
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
                \ 'f': ['HiTagFunction_definitions', 'Identifier'],
                \ 'm': ['HiTagMaps', 'Special'],
                \ 'v': ['HiTagVariables', ''],
                \ },
            \'yacc': {
                \'l': ['HiTagLabels', ''],
                \ },
            \ }
" }}}

function! highlightag#support_filetype(filetype) abort
    if empty(a:filetype)
        return 0
    endif
    if match(keys(s:hitag_dict), &filetype) == -1
        return 0
    else
        return 1
    endif
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

function! s:get_tag_info() abort
    let ctags_opts = get(g:, 'highlightag#ctags_opts', '-n')
    let ctags_cmd = printf('ctags -f - %s %s', ctags_opts, expand('%'))
    silent let ctags_res = system(ctags_cmd)

    return split(ctags_res, '\n')
endfunction

function! s:get_tag_info_job() abort
    let ctags_opts = get(g:, 'highlightag#ctags_opts', '-n')
    let ctags_cmd = printf('ctags -f - %s %s', ctags_opts, expand('%'))

    let job = job_start(split(ctags_cmd, ' '), {'callback':expand('<SID>')..'job_cb'})
endfunction

function! s:get_tag_info_file(file) abort
    if has('win32') || has('win64')
        let show_cmd = 'type'
    else
        let show_cmd = 'cat'
    endif
    if !executable(show_cmd)
        call s:echo_err(printf('this command requires %s.', show_cmd))
        return
    endif

    if filereadable(a:file)
        silent let ctags_info = system(printf('%s %s', show_cmd, a:file))
        return split(ctags_info, '\n')
    endif
    return []
endfunction

function! s:get_tag_info_job_file(file) abort
    if has('win32') || has('win64')
        let show_cmd = 'type'
    else
        let show_cmd = 'cat'
    endif
    if !executable(show_cmd)
        call s:echo_err(printf('this command requires %s.', show_cmd))
        return
    endif

    if filereadable(a:file)
        let job = job_start([show_cmd, a:file], {'callback':expand('<SID>')..'job_cb'})
    endif
endfunction

function! <SID>job_cb(ch, message) abort
    call s:set_keywards([a:message])
endfunction

function! s:set_keywards(tag_info) abort
    for line in a:tag_info
        if line[0] == '!'
            continue
        endif
        let type = split(line, "\t")[0]
        let idx = match(line, ';"')+3
        let kind = line[idx:idx]
        if match(keys(s:hitag_dict[&filetype]), kind) != -1
            let exe_cmd = printf('syntax keyword %s %s', s:hitag_dict[&filetype][kind][0], type)
            execute exe_cmd
            " echomsg exe_cmd
        endif
    endfor
endfunction

let s:fts_set_his = []
function! s:set_highlights() abort
    if match(s:fts_set_his, &filetype) != -1
        return
    endif

    let hi_settings = s:hitag_dict[&filetype]
    for key in keys(hi_settings)
        if !empty(hi_settings[key][1])
            let hi_cmd = printf('highlight default link %s %s', hi_settings[key][0], hi_settings[key][1])
        else
            let hi_cmd = printf('highlight default %s ctermfg=None', hi_settings[key][0])
        endif
        execute hi_cmd
        " echomsg hi_cmd
    endfor
    call add(s:fts_set_his, &filetype)
endfunction

function! highlightag#run_hitag() abort
    if !executable('ctags')
        call s:echo_err('ctags is not executable.')
        return
    endif
    if !highlightag#support_filetype(&filetype)
        call s:echo_err(printf('%s is not supported.', &filetype))
        return
    endif
    let tag_info = s:get_tag_info()
    call s:set_keywards(tag_info)
    call s:set_highlights()
endfunction

function! highlightag#run_hitag_job() abort
    if !executable('ctags')
        call s:echo_err('ctags is not executable.')
        return
    endif
    if !highlightag#support_filetype(&filetype)
        call s:echo_err(printf('%s is not supported.', &filetype))
        return
    endif
    if !has('job')
        call s:echo_err('job is not supported in this Vim.')
        return
    endif

    call s:set_highlights()
    call s:get_tag_info_job()
endfunction

function! highlightag#run_hitag_file() abort
    if !highlightag#support_filetype(&filetype)
        return
    endif

    for tfile in tagfiles()
        let tag_info = s:get_tag_info_file(tfile)
        call s:set_keywards(tag_info)
    endfor
    call s:set_highlights()
endfunction

function! highlightag#run_hitag_job_file() abort
    if !highlightag#support_filetype(&filetype)
        return
    endif
    if !has('job')
        call s:echo_err('(highlightag) job is not supported in this Vim.')
        return
    endif

    call s:set_highlights()
    for tfile in tagfiles()
        call s:get_tag_info_job_file(tfile)
    endfor
endfunction

