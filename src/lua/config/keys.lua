local function getNvimTree()
  return require("nvim-tree.api")
end

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
        getNvimTree().tree.toggle()
      end,
      desc = "Explorer NvimTree (cwd)",
    },
  },
  nvim_tree_on_attach = function(bufnr)
    local api = getNvimTree()
    local function map(key, fn, desc)
      vim.keymap.set("n", key, fn, { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true })
    end

    -- Navigation and Root Changes
    map("<C-]>", api.tree.change_root_to_node, "CD to Node")
    map("-", api.tree.change_root_to_parent, "Up to Parent Directory")

    -- Open Actions
    map("<C-e>", api.node.open.replace_tree_buffer, "Open: In Place")
    map("<C-t>", api.node.open.tab, "Open: New Tab")
    map("<C-v>", api.node.open.vertical, "Open: Vertical Split")
    map("<C-x>", api.node.open.horizontal, "Open: Horizontal Split")
    map("<CR>", api.node.open.edit, "Open")
    map("o", api.node.open.edit, "Open")
    map("O", api.node.open.no_window_picker, "Open: No Window Picker")
    map("<Tab>", api.node.open.preview, "Open Preview")

    -- File System Operations
    map("a", api.fs.create, "Create File Or Directory")
    map("c", api.fs.copy.node, "Copy")
    map("x", api.fs.cut, "Cut")
    map("p", api.fs.paste, "Paste")
    map("d", api.fs.remove, "Delete")
    map("D", api.fs.trash, "Trash")

    -- Renaming
    map("r", api.fs.rename, "Rename")
    map("e", api.fs.rename_basename, "Rename: Basename")
    map("u", api.fs.rename_full, "Rename: Full Path")
    map("<C-r>", api.fs.rename_sub, "Rename: Omit Filename")

    -- Copy Actions
    map("y", api.fs.copy.filename, "Copy Name")
    map("Y", api.fs.copy.relative_path, "Copy Relative Path")
    map("gy", api.fs.copy.absolute_path, "Copy Absolute Path")
    map("ge", api.fs.copy.basename, "Copy Basename")

    -- Navigation
    map(">", api.node.navigate.sibling.next, "Next Sibling")
    map("<", api.node.navigate.sibling.prev, "Previous Sibling")
    map("J", api.node.navigate.sibling.last, "Last Sibling")
    map("K", api.node.navigate.sibling.first, "First Sibling")
    map("P", api.node.navigate.parent, "Parent Directory")

    -- Git Navigation
    map("[c", api.node.navigate.git.prev, "Prev Git")
    map("]c", api.node.navigate.git.next, "Next Git")

    -- Diagnostic Navigation
    map("]e", api.node.navigate.diagnostics.next, "Next Diagnostic")
    map("[e", api.node.navigate.diagnostics.prev, "Prev Diagnostic")

    -- Filtering and Toggles
    map("H", api.tree.toggle_hidden_filter, "Toggle Filter: Dotfiles")
    map("I", api.tree.toggle_gitignore_filter, "Toggle Filter: Git Ignore")
    map("B", api.tree.toggle_no_buffer_filter, "Toggle Filter: No Buffer")
    map("C", api.tree.toggle_git_clean_filter, "Toggle Filter: Git Clean")
    map("U", api.tree.toggle_custom_filter, "Toggle Filter: Hidden")
    map("f", api.live_filter.start, "Live Filter: Start")
    map("F", api.live_filter.clear, "Live Filter: Clear")

    -- Tree Actions
    map("R", api.tree.reload, "Refresh")
    map("q", api.tree.close, "Close")
    map("E", api.tree.expand_all, "Expand All")
    map("W", api.tree.collapse_all, "Collapse")
    map("S", api.tree.search_node, "Search")
    map("g?", api.tree.toggle_help, "Help")

    -- Bookmarks
    map("m", api.marks.toggle, "Toggle Bookmark")
    map("bd", api.marks.bulk.delete, "Delete Bookmarked")
    map("bt", api.marks.bulk.trash, "Trash Bookmarked")
    map("bmv", api.marks.bulk.move, "Move Bookmarked")
    map("M", api.tree.toggle_no_bookmark_filter, "Toggle Filter: No Bookmark")

    -- Miscellaneous
    map("<C-k>", api.node.show_info_popup, "Info")
    map(".", api.node.run.cmd, "Run Command")
    map("s", api.node.run.system, "Run System")
    map("L", api.node.open.toggle_group_empty, "Toggle Group Empty")

    -- Double-Click Mappings
    map("<2-LeftMouse>", api.node.open.edit, "Open")
    map("<2-RightMouse>", api.tree.change_root_to_node, "CD")
  end,
  vim = function()
    -- Map space to leader
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "
  end
}
