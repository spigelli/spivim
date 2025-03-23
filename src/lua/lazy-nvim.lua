local M = {}

local function bootstrap_lazy()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
    end
  end
  vim.opt.rtp:prepend(lazypath)
end

local function bootstrap_lazyvim()
  local lazyvim_path = vim.fn.stdpath("data") .. "/lazy/lazyvim"
  if not (vim.uv or vim.loop).fs_stat(lazyvim_path) then
    local lazyrepo = "https://github.com/LazyVim/LazyVim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazyvim_path })
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { "Failed to clone lazyvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
    end
  end
  vim.opt.rtp:prepend(lazyvim_path)
end

local function setup_lazy_plugins()
  require("lazy").setup({
    spec = {
      -- Import the plugins
      { import = "plugins" },
    },
    defaults = {
      lazy = true, -- lazy load plugins by default
      version = false, -- always use the latest git commit
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = {
      -- colorscheme = {
      --   { 'github-theme' }
      -- }
    },
    checker = {
      enabled = true, -- check for plugin updates periodically
      notify = true, -- notify on update
    },
  })
end

function M.init()
  -- Bootstrap lazy.nvim if not installed
  bootstrap_lazy()

  -- Bootstrap lazyvim if not installed
  bootstrap_lazyvim()

  -- Load the rest of the configuration
  require("config").setup()

  -- Load lazy.nvim
  setup_lazy_plugins()
end

return M