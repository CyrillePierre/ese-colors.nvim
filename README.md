## Prerequisites

* a recent version of Neovim
* a terminal that supports truecolor (16 millions colors)

## Installation

Use your favorite plugin manager. Example with `lazy.nvim`:
```lua
{
    'CyrillePierre/ese-colors.nvim',
    opts = {  -- add this if you want to change the default configuration
        ...
    },
}
```

## Usage

The default `ese` scheme switches between dark or light themes depending of the state of the
`background` variable.
You can use it with:
```vim
colorscheme ese
```

If you want to select a particuliar one, you can use one of the following command:
```vim
colorscheme ese-dark
colorscheme ese-light
```

## Configuration

```lua
require('ese-colors').setup {
  theme = "auto",  -- values: [auto, dark, light]. If "auto": use background configuration
  background = {  -- use a specific theme depending of the value of vim.o.background
    dark = "dark",
    light = "light",
  },
  configure_lualine = false,  -- use the custom configuration for lualine
  set_default_background = true,  -- if false, it does not set the 'Normal' background color
}

vim.cmd.colorscheme('ese')
```
