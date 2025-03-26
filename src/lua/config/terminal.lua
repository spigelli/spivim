local M = {}

-- Function to restart Neovim
local function restart_neovim()
  -- Kill the foreground process in kitty
  vim.cmd("!kill -SIGUSR1 $(pgrep -f 'kitty.*nvim')")
end

-- Setup file watcher for config changes
local function setup_config_watcher()
  -- Create an augroup for our config watcher
  local group = vim.api.nvim_create_augroup("ConfigWatcher", { clear = true })
  
  -- Watch for any changes to files in the config directory
  vim.api.nvim_create_autocmd({ "FileChangedShellPost", "FocusGained" }, {
    group = group,
    pattern = vim.fn.expand("$XDG_CONFIG_HOME/src/**/*"),
    callback = function()
      -- Check if any files have been modified
      vim.cmd("checktime")
      -- Small delay to ensure all changes are detected
      vim.defer_fn(restart_neovim, 100)
    end,
  })
end

M.setup = function()
  setup_config_watcher()
end

return M 