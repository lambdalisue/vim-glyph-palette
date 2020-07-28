if exists('g:loaded_devicons_palette')
  finish
endif
let g:loaded_devicons_palette = 1

if !get(g:, 'devicons_palette_disable')
  augroup devicons_palette
    autocmd! *
    autocmd FileType nerdtree call devicons_palette#apply()
    autocmd FileType startify call devicons_palette#apply()
    autocmd FileType fern call devicons_palette#delay_apply()
  augroup END
endif

