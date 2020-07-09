" searchit.vim - search target in browser
"
" Copyright July 2020 by latavin243 <arvin.qguo@outlook.com>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Searchit [search_engine] [someinfo]
"

command! -nargs=+ Searchit :call Searchit(<f-args>)

function! Searchit(engine, keyword)
    echo 'search engine "'.a:engine.'" is used to search keyword "'.a:keyword.'"'
    if a:engine == 'google'
        let l:engine_url='https://www.google.com/search?q='
    elseif a:engine == 'stackoverflow'
        let l:engine_url='https://stackoverflow.com/search?q='
    elseif a:engine == 'baidu'
        let l:engine_url='https://www.baidu.com/s?wd='
    elseif a:engine == 'bing'
        let l:engine_url='https://bing.com/search?q='
    endif

    let l:url=l:engine_url.a:keyword

    " TODO currently windows not supported
    if has('mac') || has('macunix')
        exec 'silent! !open "'.l:url.'"'
    else " xdg-open for Linux
        exec 'silent! !'.'xdg-open'.' "'.l:url.'" &> /dev/null &'
    endif
endfunction

