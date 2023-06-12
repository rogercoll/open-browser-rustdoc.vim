" vim:foldmethod=marker:fen:
scriptencoding utf-8

" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}

function! openbrowser#rustdoc#load() abort
  " dummy function to load this script.
endfunction

function! openbrowser#rustdoc#file(args) abort
    let file = s:resolve(expand(get(a:args, 0, '%')))
    echo 'file:' . file
    let url = s:getstdurl(file)
    echo 'url:' . url
    return openbrowser#open(url)
endfunction

function! s:getstdurl(rustFilePath)
  " Get latest std filepath part
  let stdPart = substitute(a:rustFilePath, '.*\(std\/.*\)', '\1', '')
  " Remove src directory from path
  let stdPart = substitute(stdPart, '\/src\/', '/', '')
  " Remove .rs extension
  let stdPart = substitute(stdPart, '\.rs$', '', '')
  " Generate std docs url
  return 'https://doc.rust-lang.org/' .. stdPart
endfunction

function! s:resolve(path) abort
  return exists('*resolve') ? resolve(a:path) : a:path
endfunction



" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
