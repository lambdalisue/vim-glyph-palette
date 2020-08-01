let s:ESCAPE_PATTERN = '^$~.*[]\'

function! glyph_palette#apply(...) abort
  let palette = a:0 ? a:1 : g:glyph_palette#palette
  let matches = []
  for [group, glyphs] in sort(items(palette))
    if empty(glyphs)
      continue
    endif
    let pattern = join(map(copy(glyphs), { -> escape(v:val, s:ESCAPE_PATTERN) }), '\|')
    let pattern = printf('\%%(%s\)', pattern)
    call add(matches, matchadd(group, pattern))
  endfor
  return { -> map(matches, { -> matchdelete(v:val) })}
endfunction

let g:glyph_palette#palette = get(g:, 'glyph_palette#palette', copy(g:glyph_palette#defaults#palette))
