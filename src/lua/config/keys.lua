return {
  neotree = {
    {
      "<D-E>",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
  },
  nvim_tree = {
    {
      "<D-E>",
      function()
        require("nvim-tree.api").tree.toggle()
      end,
      desc = "Explorer NvimTree (cwd)",
    },
  },
  vim = function()
    -- Map space to leader
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "
  end
}