" vim:foldmethod=marker:fen:
scriptencoding utf-8

" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}

function! openbrowser#rustdoc#load() abort
  " dummy function to load this script.
endfunction

function! openbrowser#rustdoc#crate(args) abort
    " TODO: custom docs instance with args
    let crate = get(a:args, 0)
    if empty(crate)
        call s:error('crate name must be provided')
        return
    endif
    let cargo_version = get(a:args, 1, 'latest')
    return openbrowser#open('https://docs.rs/'.. crate .. '/' .. cargo_version .. '/' .. crate)
endfunction

function! openbrowser#rustdoc#std() abort
    return openbrowser#open('https://doc.rust-lang.org/std/')
endfunction

function! openbrowser#rustdoc#releases() abort
    return openbrowser#open('https://releases.rs/docs/')
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

" Helpers

function! s:resolve(path) abort
  return exists('*resolve') ? resolve(a:path) : a:path
endfunction

function! s:echomsg(msg, hl) abort
  execute 'echohl' a:hl
  try
    echomsg '[openbrowser-rustdoc]' a:msg
  finally
    echohl None
  endtry
endfunction

function! s:warn(msg) abort
  call s:echomsg(a:msg, 'WarningMsg')
endfunction

function! s:error(msg) abort
  call s:echomsg(a:msg, 'ErrorMsg')
endfunction



" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
