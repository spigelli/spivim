local LazyVim = require("lazy.util")

local M = {}

local load = function(mod)
  if require("lazy.core.cache").find(mod)[1] then
    LazyVim.try(function()
      require(mod)
    end, { msg = "Failed loading " .. mod })
  end
end

-- Returns a new autocmd group with that will fire on the given event very lazily
local _create_very_lazy_autocmd = function(event, callback)
  local group = vim.api.nvim_create_augroup("LazyVim", { clear = true })
  vim.api.nvim_create_autocmd(event, {
    pattern = "VeryLazy",
    group = group,
    callback = callback,
  })
end

-- A simple map function to apply a function to each element of an array
local _map = function(array, func)
  local result = {}
  for i, v in ipairs(array) do
    result[i] = func(v)
  end
  return result
end

-- Creates functions to call load on each module
local _get_loaders = function()
  local standard_modules = { "autocmds", "keymaps", "options" }
  return unpack(
    _map(
      standard_modules,
      function(mod)
        return function()
          load(mod)
        end
      end
    )
  )
end

M.setup = function(opts)
  local load_autocmds, load_keymaps, load_options = _get_loaders()

  -- Load autocmds immediately when opened with a file
  local opened_with_file = vim.fn.argc(-1) ~= 0
  if opened_with_file then
    load_autocmds()
  end

  _create_very_lazy_autocmd(
    "User",
    function()
      -- Load the autocmds when the user is ready
      if not opened_with_file then
        load_autocmds()
      end

      -- Load lazy.nvim defaults
      -- LazyVim.format.setup()
      -- LazyVim.news.setup()
      -- LazyVim.root.setup()

      -- Create a command to load all plugins and run :checkhealth
      vim.api.nvim_create_user_command("LazyHealth", function()
        vim.cmd([[Lazy! load all]])
        vim.cmd([[checkhealth]])
      end, { desc = "Load all plugins and run :checkhealth" })
    end
  )

  load_options()

  -- Make sure to setup `mapleader` and `maplocalleader` before
  -- loading lazy.nvim so that mappings are correct.
  -- This is also a good place to setup other settings (vim.opt)

  -- Require the options.lua which is in same directory
  -- as this file. This is where you can set your options.
  require("config.options")

end

return M