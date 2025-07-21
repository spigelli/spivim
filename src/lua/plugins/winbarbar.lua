-- return {
--   "mrjones2014/winbarbar.nvim",
--   dependencies = "nvim-web-devicons",
--   event = "VeryLazy",
--   init = function()
--     -- Set up keymaps
--     local map = vim.keymap.set
--     local opts = { noremap = true, silent = true }

--     -- Buffer navigation
--     map("n", "<A-,>", "<cmd>BufferPrevious<cr>", opts)
--     map("n", "<A-.>", "<cmd>BufferNext<cr>", opts)
    
--     -- Buffer reordering
--     map("n", "<A-<>", "<cmd>BufferMovePrevious<cr>", opts)
--     map("n", "<A->>", "<cmd>BufferMoveNext<cr>", opts)
    
--     -- Quick buffer switching
--     map("n", "<leader>bp", "<cmd>BufferPick<cr>", { desc = "Pick Buffer" })
    
--     -- Buffer operations
--     map("n", "<leader>bx", "<cmd>BufferClose<cr>", { desc = "Close Buffer" })
--     map("n", "<leader>bX", "<cmd>BufferCloseAllButCurrent<cr>", { desc = "Close Other Buffers" })
--     map("n", "<leader>bp", "<cmd>BufferPin<cr>", { desc = "Pin Buffer" })
    
--     -- Buffer sorting
--     map("n", "<leader>bod", "<cmd>BufferOrderByDirectory<cr>", { desc = "Sort by Directory" })
--     map("n", "<leader>bol", "<cmd>BufferOrderByLanguage<cr>", { desc = "Sort by Language" })
--     map("n", "<leader>bon", "<cmd>BufferOrderByBufferNumber<cr>", { desc = "Sort by Number" })
--   end,
--   opts = {
--     -- Appearance
--     icons = "both", -- Show both numbers and icons
--     icon_custom_colors = false, -- Use github theme colors
--     maximum_padding = 1,
--     minimum_padding = 1,
--     maximum_length = 30,
    
--     -- Icons matching github theme
--     icon_separator_active = "▎",
--     icon_separator_inactive = "▎",
--     icon_modified = "●",
--     icon_pinned = "",
    
--     -- Behavior
--     auto_hide = false,
--     tabpages = true,
--     semantic_letters = true,
    
--     -- Exclude certain filetypes/buftypes
--     disabled_filetypes = {
--       "neo-tree",
--       "Outline",
--       "Trouble",
--       "help",
--       "qf",
--     },
--     disabled_buftypes = {
--       "terminal",
--       "nofile",
--       "prompt",
--     },
    
--     -- Letter order for buffer picking
--     letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
--   },
--   config = function(_, opts)
--     require("bufferline").setup(opts)
    
--     -- Set up highlights to match github theme
--     local spec = require("github-theme.spec").load("github_dark_default")
--     local p = spec.palette
    
--     local groups = {
--       -- Current buffer
--       BufferCurrent = { fg = spec.fg1, bg = spec.bg1 },
--       BufferCurrentIndex = { fg = p.accent.fg, bg = spec.bg1 },
--       BufferCurrentMod = { fg = p.attention.fg, bg = spec.bg1 },
--       BufferCurrentSign = { fg = p.accent.fg, bg = spec.bg1 },
--       BufferCurrentTarget = { fg = p.danger.fg, bg = spec.bg1, bold = true },
      
--       -- Visible but not current buffers
--       BufferVisible = { fg = spec.fg2, bg = spec.bg2 },
--       BufferVisibleIndex = { fg = p.accent.muted, bg = spec.bg2 },
--       BufferVisibleMod = { fg = p.attention.muted, bg = spec.bg2 },
--       BufferVisibleSign = { fg = p.accent.muted, bg = spec.bg2 },
--       BufferVisibleTarget = { fg = p.danger.muted, bg = spec.bg2, bold = true },
      
--       -- Inactive buffers
--       BufferInactive = { fg = spec.fg3, bg = spec.bg0 },
--       BufferInactiveIndex = { fg = spec.fg3, bg = spec.bg0 },
--       BufferInactiveMod = { fg = p.attention.subtle, bg = spec.bg0 },
--       BufferInactiveSign = { fg = spec.fg3, bg = spec.bg0 },
--       BufferInactiveTarget = { fg = p.danger.subtle, bg = spec.bg0, bold = true },
      
--       -- Special elements
--       BufferTabpages = { fg = p.accent.fg, bg = spec.bg0, bold = true },
--       BufferTabpageFill = { fg = spec.fg3, bg = spec.bg0 },
--     }

--     -- Set all highlight groups
--     for group, colors in pairs(groups) do
--       vim.api.nvim_set_hl(0, group, colors)
--     end

--     -- Link icon groups to their respective main groups
--     local links = {
--       BufferCurrentIcon = "BufferCurrent",
--       BufferVisibleIcon = "BufferVisible", 
--       BufferInactiveIcon = "BufferInactive",
--       BufferOffset = "BufferTabpageFill",
--     }

--     for from, to in pairs(links) do
--       vim.api.nvim_set_hl(0, from, { link = to })
--     end
--   end
-- } 

-- return {
--   {
--     "ramilito/winbar.nvim",
--     event = "VimEnter", -- Alternatively, BufReadPre if we don't care about the empty file when starting with 'nvim'
--     dependencies = { "nvim-tree/nvim-web-devicons" },
--     config = function()
--       require("winbar").setup({
--         -- your configuration comes here, for example:
--         icons = true,
--         diagnostics = true,
--         buf_modified = true,
--         buf_modified_symbol = "M",
--         -- or use an icon
--         -- buf_modified_symbol = "●"
--         dim_inactive = {
--             enabled = false,
--             highlight = "WinBarNC",
--             icons = true, -- whether to dim the icons
--             name = true, -- whether to dim the name
--         }
--       })
--     end
--   },
-- }

return {
  "fgheng/winbar.nvim",
  lazy = false, 
  opts = {
    enabled = true,

    show_file_path = true,
    show_symbols = true,

    colors = {
      path = '',   -- You can customize colors like #c946fd
      file_name = '',
      symbols = '',
    },

    icons = {
      file_icon_default = '',
      seperator = '>',
      editor_state = '●',
      lock_icon = '',
    },

    exclude_filetype = {
      'help',
      'startify',
      'dashboard',
      'packer',
      'neogitstatus',
      'NvimTree',
      'Trouble',
      'alpha',
      'lir',
      'Outline',
      'spectre_panel',
      'toggleterm',
      'qf',
    }
  }
}