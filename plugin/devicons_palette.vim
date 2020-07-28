if exists('g:loaded_devicons_palette')
  finish
endif
let g:loaded_devicons_palette = 1

if !get(g:, 'devicons_palette_disable_default_settings')
  " TODO: Provide more default palette
  call devicons_palette#settings({
        \ 'DevIconsPaletteRed': ['rb', 'scala', 'd'],
        \ 'DevIconsPaletteLightRed': [],
        \ 'DevIconsPaletteDarkRed': [],
        \ 'DevIconsPaletteGreen': ['styl', 'twig', 'clj', 'cljc', 'cljs', 'edn', 'vim', 'vue'],
        \ 'DevIconsPaletteLightGreen': [],
        \ 'DevIconsPaletteDarkGreen': [],
        \ 'DevIconsPaletteSeaGreen': [],
        \ 'DevIconsPaletteBlue': ['css', 'jsx', 'cpp', 'cxx', 'cc', 'cp', 'c', 'sql', 'pl', 'pm', 't', 'fsscript', 'fsx', 'fs', 'fsi', 'psd', 'psb', 'ts', 'tsx'],
        \ 'DevIconsPaletteLightBlue': [],
        \ 'DevIconsPaletteDarkBlue': [],
        \ 'DevIconsPaletteSlateBlue': [],
        \ 'DevIconsPaletteCyan': ['jpg', 'jpeg', 'bmp', 'png', 'gif', 'ico'],
        \ 'DevIconsPaletteLightCyan': [],
        \ 'DevIconsPaletteDarkCyan': [],
        \ 'DevIconsPaletteMagenta': ['scss', 'php', 'lua', 'java', 'sh', 'sln', 'suo', 'erl', 'ex', 'exs', 'eex', 'jl'],
        \ 'DevIconsPaletteLightMagenta': [],
        \ 'DevIconsPaletteDarkMagenta': [],
        \ 'DevIconsPaletteYellow': ['html', 'md', 'json', 'js', 'mjs', 'py', 'pyc', 'pyo', 'pyd', 'hs', 'lhs', 'ml', 'mli', 'go', 'xul', 'rss', 'rs', 'rlib', 'ai'],
        \ 'DevIconsPaletteLightYellow': [],
        \ 'DevIconsPaletteBrown': [],
        \ 'DevIconsPaletteDarkYellow': [],
        \ 'DevIconsPaletteGray': [],
        \ 'DevIconsPaletteLightGray': [],
        \ 'DevIconsPaletteDarkGray': [],
        \ 'DevIconsPaletteBlack': [],
        \ 'DevIconsPaletteWhite': ['conf', 'ini', 'yml', 'yaml', 'bat', 'toml', 'h', 'hpp', 'hxx', 'diff', 'dart', 'pp'],
        \ 'DevIconsPaletteOrange': [],
        \ 'DevIconsPalettePurple': [],
        \ 'DevIconsPaletteViolet': [],
        \})
endif

if !get(g:, 'devicons_palette_disable')
  augroup devicons_palette
    autocmd! *
    autocmd FileType nerdtree call devicons_palette#apply()
    autocmd FileType startify call devicons_palette#apply()
    autocmd FileType fern call devicons_palette#delay_apply()
  augroup END
endif

