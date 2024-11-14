# 🎨 glyph-palette

![Support Vim 8.1 or above](https://img.shields.io/badge/support-Vim%208.1%20or%20above-yellowgreen.svg)
![Support Neovim 0.4 or above](https://img.shields.io/badge/support-Neovim%200.4%20or%20above-yellowgreen.svg)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Doc](https://img.shields.io/badge/doc-%3Ah%20glyph--palette-orange.svg)](doc/glyph-palette.txt)

![glyph-palette](https://user-images.githubusercontent.com/546312/89098136-c442ac80-d41f-11ea-90ce-68f2df7ccb25.png)

glyph-palette (Glyph palette) is a plugin to universally apply colors on [Nerd Fonts][].

With this plugin, the following (and potentially more) Nerd Fonts integrations will be nicely highlighted.

- [vim-devicons][]
- [vim-nerdfont][]
- [vim-fern-renderer-nerdfont][]
- [fall.vim][]

[nerd fonts]: https://github.com/ryanoasis/nerd-fonts
[vim-devicons]: https://github.com/ryanoasis/vim-devicons
[vim-nerdfont]: https://github.com/lambdalisue/vim-nerdfont
[vim-fern-renderer-nerdfont]: https://github.com/lambdalisue/vim-fern-renderer-nerdfont
[fall.vim]: https://github.com/vim-fall/fall.vim

## Usage

First of all, make sure that you are using one of [Nerd Fonts][] patched fonts (e.g. Fonts in [Patched Fonts](https://github.com/ryanoasis/nerd-fonts#patched-fonts) or [Cica][] for Japanese).
Visit [Nerd Fonts][] homepage for more detail.

[cica]: https://github.com/miiton/Cica

After that, call `glyph_palette#apply()` function on a target buffer like:

```vim
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType fall-list call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
```

Then glyphs in `g:glyph_palette#palette` on the buffer will be highlighted by predefined highlight groups.

See `:help glyph-palette-usage` for more details

## Screenshots

#### With nerdfont.vim + fern.vim + fern-renderer-nerdfont.vim

![With nerdfont.vim + fern.vim + fern-renderer-nerdfont.vim](https://user-images.githubusercontent.com/546312/88701008-6c1c5980-d144-11ea-8d6b-d4f4290274a6.png)

#### With fall.vim

![With fall.vim](https://github.com/user-attachments/assets/00e57422-23af-4877-9dc1-362abe11076a)

Provide us your nice screenshots!

## Special thanks

An initial implementation has written by @zeorin at https://github.com/ryanoasis/vim-devicons/issues/158
