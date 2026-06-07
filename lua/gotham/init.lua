local theme = require("gotham.theme")

local Neogotham = {
  name = 'gotham',
  config = {
    gotham_terminal = true
  }
}

-- called every time when theme is selected
function Neogotham:load()
  vim.cmd.highlight('clear')
  vim.o.background = 'dark'
  vim.o.termguicolors = true
  vim.g.colors_name = self.name

  self:set_colors()
end

local function process_config_boolean(self, config, key)
  -- not setting if key name is not provided
  if config[key] == nil then
    return
  end

  if type(config[key]) ~= "boolean" then
    error(("Invalid type %s used in setup for config.%s! Expected type: boolean"):format(type(config[key]), key))
  end

  self.config[key] = config[key]
end

-- for explicit configuration by the user, called for example from lazy.nvim spec if specified
function Neogotham:setup(config)
  if config == nil then
    return
  end

  if (type(config) ~= "table") then
    error(("Invalid call of setup with config of type %s! config must be a table"):format(type(config)))
  end

  process_config_boolean(self, config, "gotham_terminal")
end

function Neogotham:set_colors()
  theme:set_highlights()

  -- TODO: revisit terminal colors setting
  theme:set_terminal_colors(self.config.gotham_terminal)
end

return Neogotham