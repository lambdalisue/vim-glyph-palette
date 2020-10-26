let s:ESCAPE_PATTERN = '^$~.*[]\'

function! glyph_palette#apply(...) abort
  let palette = copy(a:0 ? a:1 : g:glyph_palette#palette)

  " Optimize palette
  call filter(palette, { -> !empty(v:val) })
  call map(palette, { -> map(v:val, { -> escape(v:val, s:ESCAPE_PATTERN) }) })
  call map(palette, { -> printf('\%%(%s\)', join(v:val, '\|')) })

  " Init the buffer
  let b:glyph_palette_palette = palette
  augroup glyph-palette-internal
    autocmd! * <buffer>
    autocmd BufEnter,WinEnter <buffer> call s:apply()
  augroup END

  call s:clear()
  call s:apply()

  " Backword compatibility
  let bufnr = bufnr('%')
  return { -> s:deprecated_clear(bufnr) }
endfunction

function! glyph_palette#clear() abort
  " Clear existing windows
  call s:clear()
  " Clear the buffer
  silent! unlet! b:glyph_palette_palette
  augroup glyph-palette-internal
    autocmd! * <buffer>
  augroup END
endfunction

function! s:apply() abort
  if !exists('b:glyph_palette_palette')
    call glyph_palette#clear()
    return
  endif
  if exists('w:glyph_palette_matches')
    silent! call map(w:glyph_palette_matches, { -> matchdelete(v:val) })
  endif
  let w:glyph_palette_matches = map(
        \ copy(b:glyph_palette_palette),
        \ { -> matchadd(v:key, v:val) },
        \)
endfunction

function! s:clear() abort
  let winid_saved = win_getid()
  let winids = win_findbuf(bufnr('%'))
  for winid in winids
    noautocmd keepjumps call win_gotoid(winid)
    silent! call map(w:glyph_palette_matches, { -> matchdelete(v:val) })
    silent! unlet! w:b:glyph_palette_palette
  endfor
  noautocmd keepjumps call win_gotoid(winid_saved)
endfunction

function! s:deprecated_clear(bufnr) abort
  echohl WarningMsg
  echomsg '[glyph-palette] Function returned from glyph_palette#apply() has deprecated.'
  echomsg '[glyph-palette] Use glyph_palette#clear() on the buffer instead to clear highlights.'
  echohl None
  let bufnr_saved = bufnr('%')
  let bufhidden_saved = &bufhidden
  try
    setlocal bufhidden=hide
    execute printf('noautocmd keepjumps keepalt %dbuffer', a:bufnr)
    call glyph_palette#clear()
  finally
    execute printf('noautocmd keepjumps keepalt %dbuffer', bufnr_saved)
    let &bufhidden = bufhidden_saved
  endtry
endfunction

let g:glyph_palette#palette = get(g:, 'glyph_palette#palette', copy(g:glyph_palette#defaults#palette))
