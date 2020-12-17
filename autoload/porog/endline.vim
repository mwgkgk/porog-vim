" Thu Dec 17 08:56:09 UTC 2020

function! porog#endline#replace_on_current_line(pattern, substitution)
    let cur_line = getline('.')
    if match(cur_line, a:pattern)
        let cur_line_substitute = substitute(cur_line, a:pattern, a:substitution, '')
        call setline('.', cur_line_substitute)
        return 0
    else
        return 1
    endif
endfunction

" TODO Account for whitespace at the end just in case
function! porog#endline#set(endline_str)
    if porog#endline#replace_on_current_line('\.$', a:endline_str)
        return 0
    elseif porog#endline#replace_on_current_line('\,$', a:endline_str)
        return 0
    elseif porog#endline#replace_on_current_line('\ :-$', a:endline_str)
        return 0
    else
        return 1
    endif
endfunction
