let s:ESCAPE_PATTERN = '^$~.*[]\'

function! glyph_palette#apply(...) abort
  let palette = a:0 > 0 ? a:1 : g:glyph_palette#palette
  let force = a:0 > 1 ? a:2 : 0
  if !force && exists('b:glyph_palette_applied')
    return
  endif
  let b:glyph_palette_applied = 1
  for [group, glyphs] in sort(items(palette))
    let pattern = join(map(copy(glyphs), { -> escape(v:val, s:ESCAPE_PATTERN) }), '\|')
    let pattern = printf('\%%(%s\)', pattern)
    execute printf('syntax match %s /%s./ containedin=ALL', group, pattern)
  endfor
endfunction

let g:glyph_palette#palette = get(g:, 'glyph_palette#palette', copy(g:glyph_palette#defaults#palette))
