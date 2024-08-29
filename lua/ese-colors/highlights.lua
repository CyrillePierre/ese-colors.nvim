local M = {}

function M.get(c)
  return {
    Normal = { fg = c.fg, bg = c.bg },
    NormalFloat = { bg = c.bg2 },
    Search = { fg = c.bg2, bg = c.search },
    CurSearch = { fg = c.bg2, bg = c.curSearch },
    Folded = { fg = c.fg3, bg = c.bg2 },
    CursorLine = { bg = c.cursor },
    SpellBad = { bg = c.discreteError },
    SpellCap = { bg = c.bg2 },
    Visual = { bg = c.visual },
    Error = { fg = c.fg2, bg = c.discreteError },
    Pmenu = { fg = c.fg3, bg = c.menu },
    Pmenusel = { fg = c.fg2, bg = c.menuSel },
    SpecialKey = { fg = c.specialKey },
    Directory = { fg = c.specialKey },
    Todo = { fg = c.bg2, bg = c.special },
    WildMenu = { bg = c.visual },
    OverLength = { bg = c.discreteWarn },
    ColorColumn = { bg = c.bg3 },
    MatchParen = { fg = c.constant, bold = true },
    Title = { fg = c.preProc },
    CursorColumn = { bg = c.cursor },
    VertSplit = { fg = c.number },
    SignColumn = {},  -- empty to remove default bg
    LineNr = { fg = c.number },
    CursorLineNr = { fg = c.cursorNumber },
    NonText = { fg = c.nonText },
    WinSeparator = { fg = c.number },

    -- Code
    Comment = { fg = c.comment },
    Type = { fg = c.type },
    cppStructure = { fg = c.structure, bold = true },
    Function = { fg = c.func },
    Identifier = { fg = c.identifier },
    ["@variable"] = { fg = c.variable },
    Statement = { fg = c.statement, bold = true },
    PreProc = { fg = c.preProc },
    Special = { fg = c.special },
    Operator = { fg = c.operator },
    Constant = { fg = c.constant },
    String = { fg = c.string },

    -- diagnostics
    DiagnosticError = { fg = c.error },
    DiagnosticWarn  = { fg = c.warn  },
    DiagnosticInfo  = { fg = c.info  },
    DiagnosticHint  = { fg = c.hint  },
    DiagnosticOk    = { fg = c.ok    },
    DiagnosticUnderlineError = { sp = c.error, undercurl = true },
    DiagnosticUnderlineWarn  = { sp = c.warn,  undercurl = true },
    DiagnosticUnderlineInfo  = { sp = c.info,  underline = true },
    DiagnosticUnderlineHint  = { sp = c.hint,  underline = true },
    DiagnosticUnderlineOk    = {},

    -- lsp
    ["@lsp.type.namespace"] = { fg = c.namespace },

    DiffAdd    = { fg = c.bg2, bg = c.add    },
    DiffDelete = { fg = c.bg2, bg = c.delete },
    DiffChange = { fg = c.bg2, bg = c.change },

    -- git gutter
    GitGutterAdd    = { fg = c.add    },
    GitGutterChange = { fg = c.change },
    GitGutterDelete = { fg = c.delete },

    -- doxygen
    doxygenComment   = { fg = c.commentKey },
    doxygenBrief     = { fg = c.commentKey },
    doxygenParamName = { fg = c.commentKey },

    -- neotree
    NeoTreeGitIgnored = { fg = c.inactive },
  }
end

return M
