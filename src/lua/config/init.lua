local M = {}

-- Returns a new autocmd group with that will fire on the given event very lazily
local _create_very_lazy_autocmd = function(event, callback)
  local group = vim.api.nvim_create_augroup("LazyVim", { clear = true })
  vim.api.nvim_create_autocmd(event, {
    pattern = "VeryLazy",
    group = group,
    callback = callback,
  })
end

M.setup = function(opts)
  local l = function(m) vim.notify(m, vim.log.levels.INFO) end
  -- Load autocmds immediately when opened with a file
  -- local opened_with_file = vim.fn.argc(-1) ~= 0
  -- if opened_with_file then
  --   require("config.autocmds")
  -- end

  l("Creating very lazy autocmd")
  _create_very_lazy_autocmd(
    "User",
    function()
      l("User event triggered")
      -- Load the autocmds when the user is ready
      if not false then
        require("config.autocmds")
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

  -- Make sure to setup `mapleader` and `maplocalleader` before
  -- loading lazy.nvim so that mappings are correct.
  -- This is also a good place to setup other settings (vim.opt)

  -- Require the options.lua which is in same directory
  -- as this file. This is where you can set your options.
  require("config.options")

end

return M