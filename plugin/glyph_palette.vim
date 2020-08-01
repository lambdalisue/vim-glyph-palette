if exists('g:loaded_glyph_palette')
  finish
endif
let g:loaded_glyph_palette = 1

if !get(g:, 'glyph_palette_disable_default_colors')
  call glyph_palette#defaults#highlight()
endif
