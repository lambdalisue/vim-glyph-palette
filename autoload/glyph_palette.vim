let s:ESCAPE_PATTERN = '^$~.*[]\'

function! glyph_palette#apply(...) abort
  let palette = a:0 ? a:1 : g:glyph_palette#palette
  let immediate = a:0 ? a:1 : 0
  if immediate
    call s:apply(palette)
  else
    let winid = win_getid()
    call timer_start(0, { -> s:apply_on(winid, palette)})
  endif
endfunction

function! s:apply_on(winid, palette) abort
  let winid_saved = win_getid()
  try
    noautocmd keepjumps call win_gotoid(a:winid)
    call s:apply(a:palette)
  finally
    noautocmd keepjumps call win_gotoid(winid_saved)
  endtry
endfunction

function! s:apply(palette) abort
  for [group, glyphs] in sort(items(a:palette))
    let pattern = join(map(copy(glyphs), { -> escape(v:val, s:ESCAPE_PATTERN) }), '\|')
    let pattern = printf('\%%(%s\)', pattern)
    execute printf('syntax match %s /%s./ contained', group, pattern)
  endfor
endfunction

let g:glyph_palette#palette = get(g:, 'glyph_palette#palette', copy(g:glyph_palette#defaults#palette))
