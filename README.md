## Prerequisites

* a recent version of Neovim
* a terminal that supports truecolor (16 millions colors)

## Installation

Use your favorite plugin manager. Example with `lazy.nvim`:
```lua
{
    'CyrillePierre/ese-colors.nvim',
    config = true,
    opts = {
        ...
    },
}
```

## Usage

The default `ese` scheme switches between dark or light themes depending of the state of the
`background` variable.
You can use it with:
```
colorscheme ese
```

If you want to select a particuliar one, you can use one the followin command:
```
colorscheme ese-dark
colorscheme ese-light
```
