let s:settings = {}

function! devicons_palette#settings(settings) abort
  let ss = {}
  let ss = extend(ss, g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols)
  let ss = extend(ss, g:WebDevIconsUnicodeDecorateFileNodesExactSymbols)
  let s:settings = {}
  for [group, icons] in items(a:settings)
    let icons = map(copy(icons), { -> get(ss, v:val, v:val)})
    let icons = uniq(sort(icons))
    let s:settings[group] = icons
  endfor
endfunction

function! devicons_palette#show() abort
  new
  for [group, icons] in items(s:settings)
    for icon in icons
      call append('$', icon . ' ' . "\t" . group)
    endfor
  endfor
  call s:apply()
  setlocal nolist noswapfile nobackup
  setlocal buftype=nofile bufhidden=wipe
  setlocal nomodifiable nomodified
endfunction

function! devicons_palette#apply() abort
  for [group, icons] in items(s:settings)
    if !empty(icons)
      execute printf(
            \ 'syntax match %s /\v%s./ containedin=ALL',
            \ group,
            \ join(icons, '|'),
            \)
    endif
  endfor
endfunction

function! devicons_palette#delay_apply() abort
  let winid = win_getid()
  call timer_start(0, { -> s:apply_on_window(winid) })
endfunction

function! s:apply_on_window(winid) abort
  let winid_saved = win_getid()
  if winid_saved isnot# a:winid
    call win_gotoid(a:winid)
  endif
  call devicons_palette#apply()
  if winid_saved isnot# a:winid
    call win_gotoid(winid_saved)
  endif
endfunction

function! s:highlight() abort
  highlight default DevIconsPaletteRed guifg=Red
  highlight default DevIconsPaletteLightRed guifg=LightRed
  highlight default DevIconsPaletteDarkRed guifg=DarkRed
  highlight default DevIconsPaletteGreen guifg=Green
  highlight default DevIconsPaletteLightGreen guifg=LightGreen
  highlight default DevIconsPaletteDarkGreen guifg=DarkGreen
  highlight default DevIconsPaletteSeaGreen guifg=SeaGreen
  highlight default DevIconsPaletteBlue guifg=Blue
  highlight default DevIconsPaletteLightBlue guifg=LightBlue
  highlight default DevIconsPaletteDarkBlue guifg=DarkBlue
  highlight default DevIconsPaletteSlateBlue guifg=SlateBlue
  highlight default DevIconsPaletteCyan guifg=Cyan
  highlight default DevIconsPaletteLightCyan guifg=LightCyan
  highlight default DevIconsPaletteDarkCyan guifg=DarkCyan
  highlight default DevIconsPaletteMagenta guifg=Magenta
  highlight default DevIconsPaletteLightMagenta guifg=LightMagenta
  highlight default DevIconsPaletteDarkMagenta guifg=DarkMagenta
  highlight default DevIconsPaletteYellow guifg=Yellow
  highlight default DevIconsPaletteLightYellow guifg=LightYellow
  highlight default DevIconsPaletteBrown guifg=Brown
  highlight default DevIconsPaletteDarkYellow guifg=DarkYellow
  highlight default DevIconsPaletteGray guifg=Gray
  highlight default DevIconsPaletteLightGray guifg=LightGray
  highlight default DevIconsPaletteDarkGray guifg=DarkGray
  highlight default DevIconsPaletteBlack guifg=Black
  highlight default DevIconsPaletteWhite guifg=White
  highlight default DevIconsPaletteOrange guifg=Orange
  highlight default DevIconsPalettePurple guifg=Purple
  highlight default DevIconsPaletteViolet guifg=Violet
endfunction
call s:highlight()

augroup devicons_palette_internal
  autocmd! *
  autocmd ColorScheme * call s:highlight()
augroup END
