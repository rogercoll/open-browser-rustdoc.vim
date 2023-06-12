" Title:        Open Rustdoc in browser
" Description:  A plugin to open the current Rust tab in rustdoc.
" Maintainer:   Roger Coll <https://github.com/rogercoll>

scriptencoding utf-8

" Load Once {{{
if get(g:, 'loaded_openbrowser_rustdoc', 0) || &cp
  finish
endif
let g:loaded_openbrowser_rustdoc = 1
" }}}
" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}


function! s:error(msg) abort
  echohl ErrorMsg
  echomsg a:msg
  echohl None
endfunction


if globpath(&rtp, 'plugin/openbrowser.vim') ==# ''
  call s:error('open-browser-github.vim depends on open-browser.vim. Please install open-browser.vim')
  finish
endif

command! -range=0 -bar -nargs=*
\ OpenRustDoc
\ call openbrowser#rustdoc#file([<f-args>])

command! -range=0 -bar -nargs=*
\ OpenRustDocCrate
\ call openbrowser#rustdoc#crate([<f-args>])

command! -range=0 -bar -nargs=0
\ OpenRustDocStd
\ call openbrowser#rustdoc#std()


" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
