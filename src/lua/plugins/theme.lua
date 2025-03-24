return {
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      groups = {
        all = {
          NvimTreeOpenedFolderName = { fg = 'fg1', style='' },
        },
      },
    },
    config = function(opts)
      require('github-theme').setup(opts)
      vim.cmd('colorscheme github_dark_default')
    end,
  }
}