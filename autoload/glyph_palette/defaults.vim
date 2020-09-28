" The following palette has constructed based on defx-icons
" REF: https://github.com/kristijanhusak/defx-icons
" MIT: Copyright (c) 2018 Kristijan Husak
"
" NOTE:
" Use glyph_palette#tools#print_palette(palette) function to modify the following variable
let g:glyph_palette#defaults#palette = {
      \ 'GlyphPalette1': ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
      \ 'GlyphPalette2': ['', '', '', '', '', '', '﵂', '', '', '', '', '', ''],
      \ 'GlyphPalette3': ['λ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
      \ 'GlyphPalette4': ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
      \ 'GlyphPalette6': ['', '', '', '', '', '', '', '', '', '', '', '', '', ''],
      \ 'GlyphPalette7': ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''] ,
      \ 'GlyphPalette9': ['', '', '', '', '', '', '', '', '', '', '', ''],
      \ 'GlyphPaletteDirectory': ['', '', '', '', '', ''],
      \}

function! glyph_palette#defaults#highlight() abort
  call s:highlight()
  augroup glyph_palette_defaults_highlight_internal
    autocmd!
    autocmd ColorScheme * ++once call glyph_palette#defaults#highlight()
  augroup END
endfunction

if exists('g:terminal_ansi_colors')
  function! s:highlight() abort
    highlight default link GlyphPaletteDirectory Directory
    for i in range(16)
      execute printf(
            \ 'highlight default GlyphPalette%d ctermfg=%d guifg=%s',
            \ i, i, g:terminal_ansi_colors[i],
            \)
    endfor
  endfunction
elseif exists('g:terminal_color_0')
  function! s:highlight() abort
    highlight default link GlyphPaletteDirectory Directory
    for i in range(16)
      execute printf(
            \ 'highlight default GlyphPalette%d ctermfg=%d guifg=%s',
            \ i, i, eval(printf('g:terminal_color_%d', i)),
            \)
    endfor
  endfunction
else
  " The following default colors are copied from iceberg.vim
  " REF: https://github.com/cocopon/iceberg.vim
  " MIT: Copyright (c) 2014 cocopon <cocopon@me.com>
  "
  " NOTE:
  " Use glyph_palette#tools#print_colors(colors) function to modify the following variable
  function! s:highlight() abort
    highlight default link GlyphPaletteDirectory Directory
    if &background ==# 'light'
      highlight default GlyphPalette0  ctermfg=0  guifg=#dcdfe7
      highlight default GlyphPalette1  ctermfg=1  guifg=#cc517a
      highlight default GlyphPalette2  ctermfg=2  guifg=#668e3d
      highlight default GlyphPalette3  ctermfg=3  guifg=#c57339
      highlight default GlyphPalette4  ctermfg=4  guifg=#2d539e
      highlight default GlyphPalette5  ctermfg=5  guifg=#7759b4
      highlight default GlyphPalette6  ctermfg=6  guifg=#3f83a6
      highlight default GlyphPalette7  ctermfg=7  guifg=#33374c
      highlight default GlyphPalette8  ctermfg=8  guifg=#8389a3
      highlight default GlyphPalette9  ctermfg=9  guifg=#cc3768
      highlight default GlyphPalette10 ctermfg=10 guifg=#598030
      highlight default GlyphPalette11 ctermfg=11 guifg=#b6662d
      highlight default GlyphPalette12 ctermfg=12 guifg=#22478e
      highlight default GlyphPalette13 ctermfg=13 guifg=#6845ad
      highlight default GlyphPalette14 ctermfg=14 guifg=#327698
      highlight default GlyphPalette15 ctermfg=15 guifg=#262a3f
    else
      highlight default GlyphPalette0  ctermfg=0  guifg=#1e2132
      highlight default GlyphPalette1  ctermfg=1  guifg=#e27878
      highlight default GlyphPalette2  ctermfg=2  guifg=#b4be82
      highlight default GlyphPalette3  ctermfg=3  guifg=#e2a478
      highlight default GlyphPalette4  ctermfg=4  guifg=#84a0c6
      highlight default GlyphPalette5  ctermfg=5  guifg=#a093c7
      highlight default GlyphPalette6  ctermfg=6  guifg=#89b8c2
      highlight default GlyphPalette7  ctermfg=7  guifg=#c6c8d1
      highlight default GlyphPalette8  ctermfg=8  guifg=#6b7089
      highlight default GlyphPalette9  ctermfg=9  guifg=#e98989
      highlight default GlyphPalette10 ctermfg=10 guifg=#c0ca8e
      highlight default GlyphPalette11 ctermfg=11 guifg=#e9b189
      highlight default GlyphPalette12 ctermfg=12 guifg=#91acd1
      highlight default GlyphPalette13 ctermfg=13 guifg=#ada0d3
      highlight default GlyphPalette14 ctermfg=14 guifg=#95c4ce
      highlight default GlyphPalette15 ctermfg=15 guifg=#d2d4de
    endif
  endfunction
endif
