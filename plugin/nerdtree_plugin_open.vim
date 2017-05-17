if exists("g:loaded_nerdtree_plugin_open")
    finish
endif
let g:loaded_nerdtree_plugin_open = 1

function! s:callback_name()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_') . 'callback'
endfunction

function! s:callback()
    try
        let l:path = g:NERDTreeFileNode.GetSelected().path.str({'escape': 1})
    catch
        return
    endtry

	try
		call file_browser_integration#OpenFile(l:path)
	catch
		echoe 'file_browser_integration not installed (see docs for more details)'
		return
	endtry
endfunction

call NERDTreeAddKeyMap({
    \ 'callback': s:callback_name(),
    \ 'quickhelpText': 'open with external programm',
    \ 'key': 'E',
    \ })
