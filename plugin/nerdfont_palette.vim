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

augroup nerdfont_palette
  autocmd! *
  if !get(g:, 'nerdfont_palette_disable_fern')
    autocmd FileType fern call nerdfont_palette#apply()
  endif
  if !get(g:, 'nerdfont_palette_disable_nerdtree')
    autocmd FileType nerdtree call nerdfont_palette#apply()
  endif
  if !get(g:, 'nerdfont_palette_disable_startify')
    autocmd FileType startify call nerdfont_palette#apply()
  endif
augroup END
