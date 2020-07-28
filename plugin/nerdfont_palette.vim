if exists('g:loaded_nerdfont_palette')
  finish
endif
let g:loaded_nerdfont_palette = 1

if !get(g:, 'nerdfont_palette_disable_update_colors')
  call timer_start(0, { -> nerdfont_palette#update_colors() })
endif

if !get(g:, 'nerdfont_palette_disable_update_palette')
  call timer_start(0, { -> nerdfont_palette#update_palette() })
endif
