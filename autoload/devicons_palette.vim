let s:palette = {}

function! devicons_palette#show() abort
  new
  for [group, icons] in items(s:palette)
    for icon in icons
      call append('$', icon . ' ' . "\t" . group)
    endfor
  endfor
  call devicons_palette#apply(v:true)
  setlocal nolist noswapfile nobackup
  setlocal buftype=nofile bufhidden=wipe
  setlocal nomodifiable nomodified
endfunction

function! devicons_palette#apply(...) abort
  let immediate = a:0 ? a:1 : 0
  let winid = win_getid()
  if immediate
    call s:apply(winid)
  else
    call timer_start(0, { -> s:apply(winid) })
  endif
endfunction

function! devicons_palette#update_colors() abort
  let colors = s:find_colors()
  let ps = map(copy(colors), { k, v -> ['DevIconsPalette' . k, v, k] })
  let es = map(ps, { _, v -> printf('hi default %s guifg=%s ctermfg=%s', v[0], v[1], v[2]) })
  silent execute join(es, ' | ')
  augroup devicons_palette_colors_internal
    autocmd! *
    autocmd ColorScheme * ++once call devicons_palette#update_colors()
  augroup END
endfunction

function! devicons_palette#update_palette() abort
  let palette = s:find_palette()
  let ss = {}
  let ss = extend(ss, g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols)
  let ss = extend(ss, g:WebDevIconsUnicodeDecorateFileNodesExactSymbols)
  let s:palette = {}
  for [group, icons] in items(palette)
    let icons = map(copy(icons), { -> get(ss, v:val, v:val)})
    let icons = uniq(sort(icons))
    let s:palette[group] = icons
  endfor
endfunction

function! s:find_palette() abort
  if exists('g:devicons_palette_palette')
    return g:devicons_palette_palette
  endif
  return g:devicons_palette#defaults#palette
endfunction

function! s:find_colors() abort
  if exists('g:devicons_palette_colors')
    return g:devicons_palette_colors
  elseif exists('g:terminal_ansi_colors') " vim
    return g:terminal_ansi_colors
  elseif exists('g:terminal_color_0') " nvim
    return map(range(0, 15), { -> eval('g:terminal_color_' . v:val) })
  endif
  return g:devicons_palette#defaults#colors[&background]
endfunction

function! s:apply(winid) abort
  let winid_saved = win_getid()
  try
    noautocmd keepjumps call win_gotoid(a:winid)
    for [group, icons] in items(s:palette)
      if !empty(icons)
        execute printf(
              \ 'syntax match %s /\v%s./ containedin=ALL',
              \ group,
              \ join(icons, '|'),
              \)
      endif
    endfor
  finally
    noautocmd keepjumps call win_gotoid(winid_saved)
  endtry
endfunction
