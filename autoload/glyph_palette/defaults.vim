" The following palette has constructed based on defx-icons
" REF: https://github.com/kristijanhusak/defx-icons
" MIT: Copyright (c) 2018 Kristijan Husak
"
" NOTE:
" Use glyph_palette#tools#print_palette(palette) function to modify the following variable
let g:glyph_palette#defaults#palette = {
      \ 'GlyphPalette1': ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
      \ 'GlyphPalette2': ['', '', '', '', '', '', '󰡄', '', '', '', '', '', ''],
      \ 'GlyphPalette3': ['λ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
      \ 'GlyphPalette4': ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
      \ 'GlyphPalette6': ['', '', '', '', '', '', '', '', '', '', '', '', '', ''],
      \ 'GlyphPalette7': ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''] ,
      \ 'GlyphPalette9': ['', '', '', '', '', '', '', '', '', '', '', ''],
      \ 'GlyphPaletteDirectory': ['', '', '', '', '', ''],
      \}

" The following default colors are copied from iceberg.vim
" REF: https://github.com/cocopon/iceberg.vim
" MIT: Copyright (c) 2014 cocopon <cocopon@me.com>
"
" NOTE:
" Use glyph_palette#tools#print_colors(colors) function to modify the following variable
let g:glyph_palette#defaults#colors = {
      \ 'light': [
      \   '#dcdfe7',
      \   '#cc517a',
      \   '#668e3d',
      \   '#c57339',
      \   '#2d539e',
      \   '#7759b4',
      \   '#3f83a6',
      \   '#33374c',
      \   '#8389a3',
      \   '#cc3768',
      \   '#598030',
      \   '#b6662d',
      \   '#22478e',
      \   '#6845ad',
      \   '#327698',
      \   '#262a3f',
      \ ],
      \ 'dark': [
      \   '#1e2132',
      \   '#e27878',
      \   '#b4be82',
      \   '#e2a478',
      \   '#84a0c6',
      \   '#a093c7',
      \   '#89b8c2',
      \   '#c6c8d1',
      \   '#6b7089',
      \   '#e98989',
      \   '#c0ca8e',
      \   '#e9b189',
      \   '#91acd1',
      \   '#ada0d3',
      \   '#95c4ce',
      \   '#d2d4de',
      \ ],
      \}

function! glyph_palette#defaults#highlight() abort
  if exists('g:terminal_ansi_colors')
    call s:highlight(g:terminal_ansi_colors)
  elseif exists('g:terminal_color_0')
    call s:highlight(map(range(16), { i -> g:terminal_color_{i} }))
  else
    call s:highlight(g:glyph_palette#defaults#colors[&background])
  endif
  augroup glyph_palette_defaults_highlight_internal
    autocmd!
    autocmd ColorScheme * ++once call glyph_palette#defaults#highlight()
  augroup END
endfunction

function! s:highlight(colors) abort
  highlight default link GlyphPaletteDirectory Directory
  call map(range(len(a:colors)), { i -> execute(printf(
        \ 'highlight default GlyphPalette%d ctermfg=%d guifg=%s',
        \ i, i, a:colors[i],
        \)) })
endfunction
