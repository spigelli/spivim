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
  vim = function()
    -- Map space to leader
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "
  end
}