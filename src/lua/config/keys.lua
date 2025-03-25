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

    -- Navigation and Root Changes
    { "<C-]>", function() require("nvim-tree.api").tree.change_root_to_node() end, desc = "CD to Node" },
    { "-", function() require("nvim-tree.api").tree.change_root_to_parent() end, desc = "Up to Parent Directory" },

    -- Open Actions
    { "<C-e>", function() require("nvim-tree.api").node.open.replace_tree_buffer() end, desc = "Open: In Place" },
    { "<C-t>", function() require("nvim-tree.api").node.open.tab() end, desc = "Open: New Tab" },
    { "<C-v>", function() require("nvim-tree.api").node.open.vertical() end, desc = "Open: Vertical Split" },
    { "<C-x>", function() require("nvim-tree.api").node.open.horizontal() end, desc = "Open: Horizontal Split" },
    { "<CR>", function() require("nvim-tree.api").node.open.edit() end, desc = "Open" },
    { "o", function() require("nvim-tree.api").node.open.edit() end, desc = "Open" },
    { "O", function() require("nvim-tree.api").node.open.no_window_picker() end, desc = "Open: No Window Picker" },
    { "<Tab>", function() require("nvim-tree.api").node.open.preview() end, desc = "Open Preview" },

    -- File System Operations
    { "a", function() require("nvim-tree.api").fs.create() end, desc = "Create File Or Directory" },
    { "c", function() require("nvim-tree.api").fs.copy.node() end, desc = "Copy" },
    { "x", function() require("nvim-tree.api").fs.cut() end, desc = "Cut" },
    { "p", function() require("nvim-tree.api").fs.paste() end, desc = "Paste" },
    { "d", function() require("nvim-tree.api").fs.remove() end, desc = "Delete" },
    { "D", function() require("nvim-tree.api").fs.trash() end, desc = "Trash" },

    -- Renaming
    { "r", function() require("nvim-tree.api").fs.rename() end, desc = "Rename" },
    { "e", function() require("nvim-tree.api").fs.rename_basename() end, desc = "Rename: Basename" },
    { "u", function() require("nvim-tree.api").fs.rename_full() end, desc = "Rename: Full Path" },
    { "<C-r>", function() require("nvim-tree.api").fs.rename_sub() end, desc = "Rename: Omit Filename" },

    -- Copy Actions
    { "y", function() require("nvim-tree.api").fs.copy.filename() end, desc = "Copy Name" },
    { "Y", function() require("nvim-tree.api").fs.copy.relative_path() end, desc = "Copy Relative Path" },
    { "gy", function() require("nvim-tree.api").fs.copy.absolute_path() end, desc = "Copy Absolute Path" },
    { "ge", function() require("nvim-tree.api").fs.copy.basename() end, desc = "Copy Basename" },

    -- Navigation
    { ">", function() require("nvim-tree.api").node.navigate.sibling.next() end, desc = "Next Sibling" },
    { "<", function() require("nvim-tree.api").node.navigate.sibling.prev() end, desc = "Previous Sibling" },
    { "J", function() require("nvim-tree.api").node.navigate.sibling.last() end, desc = "Last Sibling" },
    { "K", function() require("nvim-tree.api").node.navigate.sibling.first() end, desc = "First Sibling" },
    { "P", function() require("nvim-tree.api").node.navigate.parent() end, desc = "Parent Directory" },

    -- Git Navigation
    { "[c", function() require("nvim-tree.api").node.navigate.git.prev() end, desc = "Prev Git" },
    { "]c", function() require("nvim-tree.api").node.navigate.git.next() end, desc = "Next Git" },

    -- Diagnostic Navigation
    { "]e", function() require("nvim-tree.api").node.navigate.diagnostics.next() end, desc = "Next Diagnostic" },
    { "[e", function() require("nvim-tree.api").node.navigate.diagnostics.prev() end, desc = "Prev Diagnostic" },

    -- Filtering and Toggles
    { "H", function() require("nvim-tree.api").tree.toggle_hidden_filter() end, desc = "Toggle Filter: Dotfiles" },
    { "I", function() require("nvim-tree.api").tree.toggle_gitignore_filter() end, desc = "Toggle Filter: Git Ignore" },
    { "B", function() require("nvim-tree.api").tree.toggle_no_buffer_filter() end, desc = "Toggle Filter: No Buffer" },
    { "C", function() require("nvim-tree.api").tree.toggle_git_clean_filter() end, desc = "Toggle Filter: Git Clean" },
    { "U", function() require("nvim-tree.api").tree.toggle_custom_filter() end, desc = "Toggle Filter: Hidden" },
    { "f", function() require("nvim-tree.api").live_filter.start() end, desc = "Live Filter: Start" },
    { "F", function() require("nvim-tree.api").live_filter.clear() end, desc = "Live Filter: Clear" },

    -- Tree Actions
    { "R", function() require("nvim-tree.api").tree.reload() end, desc = "Refresh" },
    { "q", function() require("nvim-tree.api").tree.close() end, desc = "Close" },
    { "E", function() require("nvim-tree.api").tree.expand_all() end, desc = "Expand All" },
    { "W", function() require("nvim-tree.api").tree.collapse_all() end, desc = "Collapse" },
    { "S", function() require("nvim-tree.api").tree.search_node() end, desc = "Search" },
    { "g?", function() require("nvim-tree.api").tree.toggle_help() end, desc = "Help" },

    -- Bookmarks
    { "m", function() require("nvim-tree.api").marks.toggle() end, desc = "Toggle Bookmark" },
    { "bd", function() require("nvim-tree.api").marks.bulk.delete() end, desc = "Delete Bookmarked" },
    { "bt", function() require("nvim-tree.api").marks.bulk.trash() end, desc = "Trash Bookmarked" },
    { "bmv", function() require("nvim-tree.api").marks.bulk.move() end, desc = "Move Bookmarked" },
    { "M", function() require("nvim-tree.api").tree.toggle_no_bookmark_filter() end, desc = "Toggle Filter: No Bookmark" },

    -- Miscellaneous
    { "<C-k>", function() require("nvim-tree.api").node.show_info_popup() end, desc = "Info" },
    { ".", function() require("nvim-tree.api").node.run.cmd() end, desc = "Run Command" },
    { "s", function() require("nvim-tree.api").node.run.system() end, desc = "Run System" },
    { "L", function() require("nvim-tree.api").node.open.toggle_group_empty() end, desc = "Toggle Group Empty" },

    -- Double-Click Mappings
    { "<2-LeftMouse>", function() require("nvim-tree.api").node.open.edit() end, desc = "Open" },
    { "<2-RightMouse>", function() require("nvim-tree.api").tree.change_root_to_node() end, desc = "CD" },
  },
  vim = function()
    -- Map space to leader
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "
  end
}
