function! glyph_palette#tools#palette_from(settings, glyph_map) abort
  let palette = {}
  for [group, names] in items(a:settings)
    if empty(names)
      continue
    endif
    let glyphs = uniq(sort(map(copy(names), { -> get(a:glyph_map, v:val, v:val) })))
    let palette[group] = glyphs
  endfor
  return palette
endfunction

function! glyph_palette#tools#palette_from_nerdfont(settings) abort
  let gm = {}
  call extend(gm, g:nerdfont#path#extension#defaults)
  call extend(gm, g:nerdfont#path#basename#defaults)
  return glyph_palette#tools#palette_from(a:settings, gm)
endfunction

function! glyph_palette#tools#palette_from_devicons(settings) abort
  let gm = {}
  call extend(gm, g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols)
  call extend(gm, g:WebDevIconsUnicodeDecorateFileNodesExactSymbols)
  return glyph_palette#tools#palette_from(a:settings, gm)
endfunction

function! glyph_palette#tools#print_colors(colors) abort
  new
  call append(0, split(execute('call s:print_colors(a:colors)'), '\n'))
  setlocal buftype=nofile bufhidden=wipe nobuflisted
  setlocal nomodified nomodifiable
  setlocal noswapfile nobackup
  setfiletype vim
endfunction

function! glyph_palette#tools#print_palette(palette) abort
  new
  call append(0, split(execute('call s:print_palette(a:palette)'), '\n'))
  setlocal buftype=nofile bufhidden=wipe nobuflisted
  setlocal nomodified nomodifiable
  setlocal noswapfile nobackup
  setfiletype vim
endfunction

function! glyph_palette#tools#show_palette(...) abort
  new
  let palette = a:0 ? a:1 : g:glyph_palette#palette
  call append(0, split(execute('call s:show_palette(palette)'), '\n'))
  call glyph_palette#apply(palette)
  setlocal buftype=nofile bufhidden=wipe nobuflisted
  setlocal nomodified nomodifiable
  setlocal noswapfile nobackup
  redraw
endfunction

function! s:print_colors(colors) abort
  let indent = repeat(' ', 6)
  echo 'let s:colors = {'
  echo indent . '\ ''__type__'': ['
  let ps = map(copy(a:colors), { k, v -> ['GlyphPalette' . k, k, v] })
  for color in a:colors
    echo indent . printf('\   ''%s'',', color)
  endfor
  echo indent . '\ ],'
  echo indent . '\}'
endfunction

function! s:print_palette(palette) abort
  let indent = repeat(' ', 6)
  echo 'let s:palette = {'
  for [group, glyphs] in sort(items(a:palette))
    echo indent . printf(
          \ '\ %s: [%s],',
          \ string(group),
          \ join(map(copy(glyphs), { -> string(v:val) }), ', '),
          \)
  endfor
  echo indent . '\}'
endfunction

function! s:show_palette(palette) abort
  let palette = items(map(copy(a:palette), { -> join(v:val, '  ') . ' ' }))
  call sort(map(palette, { _, v -> [printf('%s(%s)', v[0], s:get_meta(v[0])), v[1]] }))
  let longest = max(map(copy(palette), { -> len(v:val[0]) }))
  let trailing = repeat(' ', longest)
  for [prefix, glyphs] in palette
    let prefix = (prefix . trailing)[:longest]
    echo prefix . glyphs
  endfor
endfunction

function! s:get_meta(group) abort
  return matchstr(
        \ execute(printf('highlight %s', a:group)),
        \ printf('%s\s\+xxx\s\zs.*', a:group),
        \)
endfunction
