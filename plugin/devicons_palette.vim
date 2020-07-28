if exists('g:loaded_devicons_palette')
  finish
endif
let g:loaded_devicons_palette = 1

if !get(g:, 'devicons_palette_disable_update_colors')
  call timer_start(0, { -> devicons_palette#update_colors() })
endif

if !get(g:, 'devicons_palette_disable_update_palette')
  call timer_start(0, { -> devicons_palette#update_palette() })
endif

augroup devicons_palette
  autocmd! *
  if !get(g:, 'devicons_palette_disable_fern')
    autocmd FileType fern call devicons_palette#apply()
  endif
  if !get(g:, 'devicons_palette_disable_nerdtree')
    autocmd FileType nerdtree call devicons_palette#apply()
  endif
  if !get(g:, 'devicons_palette_disable_startify')
    autocmd FileType startify call devicons_palette#apply()
  endif
augroup END

