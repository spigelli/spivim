-- Disable autogroup "wrap_spell"
-- vim.api.nvim_command("autocmd! wrap_spell")

-- Function to restart Neovim
local function restart_neovim()
  -- Executes :cq<CR>
  vim.schedule(function()
    vim.cmd('cq')
  end)
end

-- Watches the config directory for changes and restarts Neovim
local function watch_config()
  local handle = nil
  handle = vim.uv.new_fs_event()
  local stop_watch = function()
    vim.uv.fs_event_stop(handle)
  end
  local source_path = vim.fn.expand("$XDG_CONFIG_HOME/src")
  vim.uv.fs_event_start(handle, source_path, { recursive = true }, function(err, filename, events)
      if err then
        vim.notify("Error: " .. err, vim.log.levels.ERROR)
        stop_watch()
        return
      end
      stop_watch()
      restart_neovim()
  end)
end

watch_config()
