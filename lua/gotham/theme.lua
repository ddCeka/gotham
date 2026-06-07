local colors = require('gotham.colors')
local util = require('gotham.util')

-- main gotham palette
local gotham = colors.gotham
local diagnostic = colors.diagnostic
local diff = colors.diff

-- shortcuts to common foregrounds and backgrounds
local fg  = gotham[6] -- main foreground
local bg  = gotham[0] -- main background
local bg2 = gotham[1] -- secondary background for UI elements

-- For names of highlight groups and applied coloring, see:
-- :help highlight-groups
-- :help group-name
-- :help treesitter-highlight-groups
-- :help diagnostic-highlights
-- :help lsp-highlight
-- :help lsp-semantic-highlight

local highlights = {
  Normal = { fg = fg, bg = bg },

  -- cursor and cursor lines
  Cursor       = { fg = gotham[1], bg = gotham[6] },
  CursorColumn = { bg = bg2 },
  CursorLine   = { bg = bg2 },

  -- sign column and line numbers
  ColorColumn  = { bg = bg2 },
  CursorLineNr = { fg = gotham[5], bg = bg2 },
  LineNr       = { fg = colors.blue, bg = bg2 },
  SignColumn   = { bg = bg2 },

  -- command line elements and prompts
  Error      = { fg = colors.red, bg = bg2 },
  ErrorMsg   = { fg = colors.red, bg = bg2 },
  ModeMsg    = { fg = colors.blue },
  WarningMsg = { fg = colors.red, bg = bg2 },
  Question   = { fg = colors.green },

  -- floating windows
  NormalFloat        = { link = 'Pmenu' },
  FloatBorder        = { fg = gotham[5], bg = bg },
  FloatShadow        = { bg = gotham[3], blend = 75 },
  FloatShadowThrough = { bg = gotham[3], blend = 100 },

  -- other interface elements
  Conceal      = { fg = colors.cyan },
  Directory    = { fg = colors.cyan },
  Folded       = { bg = colors.blue },
  FoldColumn   = { fg = gotham[5], bg = gotham[3] },
  NonText      = { fg = colors.blue }, -- interface tildes
  Pmenu        = { bg = gotham[2] }, -- vertical popup menu elements
  PmenuSel     = { fg = gotham[7], bg = colors.blue },
  PmenuSbar    = { link = 'Pmenu' }, -- fill menu scrollbar with same color as menu itself
  PmenuThumb   = { bg = colors.blue },
  SpecialKey   = { fg = gotham[3] }, -- non whitespace special characters in 'listchars'. See ':help listchars'. Whitespace group links to NonText for whitespace ones
  StatusLine   = { fg = gotham[5], bg = gotham[2] }, -- also sets the color of the non-active entries in the wildmenu.
  StatusLineNC = { fg = colors.blue, bg = gotham[2] }, -- non current window's status line
  TabLine      = { bg = gotham[2] }, -- non-selected tabs
  TabLineFill  = { bg = bg }, -- the rest of the tab line
  TabLineSel   = { fg = gotham[7], bg = colors.blue }, -- selected tab
  Visual       = { bg = colors.gotham[3] }, -- visual selection
  WildMenu     = { fg = gotham[7], bg = colors.cyan }, -- horizontal wildmenu (active when wildoptions doesn't contain pum, otherwise see Pmenu* groups)
  WinSeparator = { fg = colors.blue, bg = bg2 }, -- splits and window separators

  -- search
  Search     = { fg = util.tint(colors.violet, 0.5), bg = util.brighten(colors.yellow, 0.5) },
  CurSearch  = { fg = colors.violet, bg = colors.yellow },
  MatchParen = { fg = colors.neon_green, bold = true },

  -- spelling
  SpellBad   = { sp = colors.light_red, undercurl = true },
  SpellCap   = { sp = colors.light_yellow, undercurl = true },
  SpellRare  = { sp = colors.light_cyan, undercurl = true },
  SpellLocal = { sp = colors.light_green, undercurl = true },

  -- syntax elements
  ['@variable'] = { link = 'Identifier' },
  Comment    = { fg = colors.blue },
  Constant   = { fg = colors.magenta },
  Delimiter  = { fg = gotham[5] },
  Function   = { fg = colors.violet },
  Identifier = { fg = fg },
  Number     = { fg = colors.orange },
  Operator   = { link = 'Statement' },
  PreProc    = { fg = colors.red },
  Special    = { fg = colors.orange },
  Statement  = { fg = gotham[5] },
  String     = { fg = colors.green },
  Title      = { fg = colors.orange }, -- Some HTML tags like <title>, <h*>s etc.
  Todo       = { fg = colors.magenta },
  Type       = { fg = colors.orange },
  Underlined = { fg = colors.yellow, underline = true }, -- <a> tags

  -- diff mode
  DiffAdd     = { fg = 'none', bg = diff.green },
  DiffDelete  = { fg = util.brighten(colors.red, 1.025), bg = diff.red },
  DiffChange  = { fg = 'none', bg = util.brighten(colors.blue, 0.55) },
  DiffText    = { fg = 'none', bg = colors.cyan },

  -- diff filetype (diffs, patches)
  Added       = { link = 'DiffAdd' },
  Removed     = { link = 'DiffDelete' },
  Changed     = { link = 'DiffChange' },

  -- diagnostics
  DiagnosticError            = { fg = diagnostic.red },
  DiagnosticWarn             = { fg = diagnostic.yellow },
  DiagnosticInfo             = { fg = diagnostic.blue },
  DiagnosticHint             = { fg = diagnostic.green },
  DiagnosticUnnecessary      = { link = 'Comment' },
  DiagnosticVirtualTextError = { fg = diagnostic.red, bg = util.shade(diagnostic.red, 0.8) },
  DiagnosticVirtualTextWarn  = { fg = diagnostic.yellow, bg = util.shade(diagnostic.yellow, 0.8) },
  DiagnosticVirtualTextInfo  = { fg = diagnostic.blue, bg = util.shade(diagnostic.blue, 0.8)},
  DiagnosticVirtualTextHint  = { fg = diagnostic.green, bg = util.shade(diagnostic.green, 0.8) },
  DiagnosticUnderlineError   = { sp = diagnostic.red, undercurl = true },
  DiagnosticUnderlineWarn    = { sp = diagnostic.yellow, undercurl = true },
  DiagnosticUnderlineInfo    = { sp = diagnostic.blue, undercurl = true },
  DiagnosticUnderlineHint    = { sp = diagnostic.green, undercurl = true }
}

-- these table keys are not currently defined in any highlighting namespace, using only for values so far
-- bg_indexed and fg_indexed are needed to pass through colors for the terminal
local custom_highlights = {
  TerminalDefaultNormal = { fg = 'none', bg = 'none', bg_indexed = true, fg_indexed = true }
}

local terminal = {
  -- colors 0 - 7
  terminal_color_0  = gotham[0],
  terminal_color_1  = colors.red,
  terminal_color_2  = colors.green,
  terminal_color_3  = colors.yellow,
  terminal_color_4  = colors.blue,
  terminal_color_5  = colors.violet,
  terminal_color_6  = colors.cyan,
  terminal_color_7  = gotham[6],

  -- colors 8 - 15 (should be brighter versions of 0 - 7, but now just reuses the same as original gotham did)
  terminal_color_8  = gotham[0],
  terminal_color_9  = colors.red,
  terminal_color_10 = colors.green,
  terminal_color_11 = colors.yellow,
  terminal_color_12 = colors.blue,
  terminal_color_13 = colors.violet,
  terminal_color_14 = colors.cyan,
  terminal_color_15 = gotham[6]
}

local terminal_default_ns_id = vim.api.nvim_create_namespace('TerminalDefault')

local Theme = {
  highlights = highlights,
  terminal = terminal,
  terminal_colors_autocmd_id = nil,
  terminal_normal_hl_autocmd_id = nil
}

local function set_16_terminal_colors(self, buf, gotham_terminal)
  -- if gotham_terminal is false, it will set terminal colors to nil to fall back to active terminal defaults
  -- if gotham_terminal is true, it will use theme's colors
  for term_color, value in pairs(self.terminal) do
    vim.b[buf][term_color] = gotham_terminal and value or nil
  end
end

-- empty filetype will match normal terminals, not their usage from some plugins that set filetype for their buffers.
local function is_normal_terminal()
  return (vim.bo.buftype == "terminal") and (vim.bo.filetype == "")
end

local function cleanup_autocmd(id)
  if id ~= nil then
    -- clean up existing autocmd if it was already created
    vim.api.nvim_del_autocmd(id)
  end
end

function Theme:set_highlights()
  for group, value in pairs(self.highlights) do
    vim.api.nvim_set_hl(0, group, value)
  end
end

-- About built-in terminal colors, see :help terminal-config
function Theme:set_terminal_colors(gotham_terminal)
  cleanup_autocmd(self.terminal_colors_autocmd_id)
  self.terminal_colors_autocmd_id = nil

  -- Note: 16 terminal colors can only be changed on initial terminal opening.
  -- It's the limitation of neovim, so already opened terminals can't dynamically change those colors
  self.terminal_colors_autocmd_id = vim.api.nvim_create_autocmd({ 'TermOpen' }, {
    pattern = { "*" },
    callback = function(event)
      if is_normal_terminal() then
        -- for normal terminals, set colors according to gotham_terminal setting
        -- either to theme's or to terminal's defaults
        set_16_terminal_colors(self, event.buf, gotham_terminal)
      else
        -- for special terminal, force theme colors to avoid complications
        set_16_terminal_colors(self, event.buf, true)
      end
    end,
    desc = "handling of standard 16 terminal colors"
  })

  cleanup_autocmd(self.terminal_normal_hl_autocmd_id)
  self.terminal_normal_hl_autocmd_id = nil

  -- When gotham terminal colors are disabled, we have to set colors to none for Normal highlight group
  -- to fall back to default terminal colors for regular text and background.
  -- Note that it also needs bg_indexed and fg_indexed be set to true
  if not gotham_terminal then
    vim.api.nvim_set_hl(terminal_default_ns_id, 'Normal', custom_highlights['TerminalDefaultNormal'])

    -- TermOpen handles initial opening of the terminal, WinNew handles splits, BufEnter handles buffers navigation
    -- vim.schedule is used to avoid edge cases when vim.bo.buftype is not defined early enough for the event
    self.terminal_normal_hl_autocmd_id = vim.api.nvim_create_autocmd({ 'TermOpen', 'WinNew', 'BufEnter' }, {
      pattern = { "*" },
      callback = function()
        vim.schedule(function()
          local current_window_id = vim.api.nvim_get_current_win()
          local current_window_ns_id = vim.api.nvim_get_hl_ns({ winid = current_window_id })
          local is_terminal_default_ns = (current_window_ns_id == terminal_default_ns_id)

          if is_normal_terminal() then
            if not is_terminal_default_ns then
              -- for opening terminal windows and entering terminal buffers, set terminal_default_ns if it wasn't set
              vim.api.nvim_win_set_hl_ns(current_window_id, terminal_default_ns_id)
            end
          elseif is_terminal_default_ns then
            -- for non terminals, clear terminal_default_ns if detected,
            -- which can be the case with splits which inherit options or jumping to a different buffer in the same window
            vim.api.nvim_win_set_hl_ns(current_window_id, 0)
          end
        end)
      end,
      desc = "use default color for Normal in terminal windows"
    })
  end
end

return Theme