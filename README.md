# nerdfont-palette

![Support Vim 8.1 or above](https://img.shields.io/badge/support-Vim%208.1%20or%20above-yellowgreen.svg)
![Support Neovim 0.4 or above](https://img.shields.io/badge/support-Neovim%200.4%20or%20above-yellowgreen.svg)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Doc](https://img.shields.io/badge/doc-%3Ah%20nerdfont--palette-orange.svg)](doc/nerdfont-palette.txt)

<center>

![nerdfont-palette with fern.vim](https://user-images.githubusercontent.com/546312/88701008-6c1c5980-d144-11ea-8d6b-d4f4290274a6.png)
**nerdfont-palette with fern.vim + fern-renderer-nerdfont.vim + nerdfont.vim**

</center>

nerdfont-palette is a plugin to provide an universal palette for [nerdfont.vim][] or [vim-devicons][].

Once the `nerdfont_palette#apply()` has called on a buffer, any glyphs of nerdfont (devicons) in the applied buffer are highlighted by the (customizable) pre-defined palette.

[nerdfont.vim]: https://github.com/lambdalisue/nerdfont.vim
[vim-devicons]: https://github.com/ryanoasis/vim-devicons

## Usage

First of all, make sure nerdfont.vim or vim-devicons has installed. Then
set `g:nerdfont_palette#source` properly like:

```vim
" For nerdfont.vim
let g:nerdfont_palette#source = 'nerdfont'

" For vim-devicons
let g:nerdfont_palette#source = 'devicons'
```

After that, call `nerdfont_palette#apply()` function on a target buffer like:

```vim
augroup my-nerdfont-palette
  autocmd! *
  autocmd FileType fern call nerdfont_palette#apply()
  autocmd FileType nerdtree call nerdfont_palette#apply()
  autocmd FileType startify call nerdfont_palette#apply()
augroup END
```

To customize colors or palette, see `:help nerdfont-palette-variable`.

## Special thanks

An initial implementation has written by @zeorin at https://github.com/ryanoasis/vim-devicons/issues/158
