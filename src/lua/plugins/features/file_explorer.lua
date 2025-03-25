return {
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		opts = {
			override_by_filename = {
				[".gitignore"] = {
					icon = "",
					color = "#f1502f",
					name = "Gitignore",
				},
				["exe"] = {
					icon = "",
					color = "#7aa2f7",
					name = "Exe",
				},
				["readme"] = {
					icon = "",
					color = "#ededed",
					cterm_color = "255",
					name = "Readme",
				},
				["readme.md"] = {
					icon = "",
					color = "#ededed",
					cterm_color = "255",
					name = "Readme",
				},
			},
		},
	},
	keys = require("config.keys").nvim_tree,
	opts = {
		update_focused_file = {
			enable = true,
			update_cwd = true,
			update_root = false,
		},
		view = {
			width = {
				min = 30,
				max = 50,
			},
			preserve_window_proportions = true,
			signcolumn = "yes",
			side = "left",
			float = {
				enable = false,
				quit_on_focus_loss = false,
				open_win_config = {
					relative = "editor",
					border = "rounded",
					width = 30,
					height = 30,
					row = 2,
					col = 1,
				},
			},
		},
		filesystem_watchers = {
			enable = true,
		},
		renderer = {
			root_folder_label = ":t",
			indent_markers = {
				enable = true,
				inline_arrows = true,
				icons = {
					corner = "└",
					edge = "│",
					item = "│",
					bottom = "─",
					none = " ",
				},
			},
			icons = {
				web_devicons = {
					file = {
						enable = true,
						color = true,
					},
					folder = {
						enable = false,
						color = true,
					},
				},
				git_placement = "before",
				modified_placement = "after",
				hidden_placement = "after",
				diagnostics_placement = "after",
				bookmarks_placement = "after",
				padding = "  ",
				symlink_arrow = " ➛ ",
				show = {
					file = true,
					folder = false,
					folder_arrow = true,
					git = false,
					modified = false,
					hidden = false,
					diagnostics = true,
					bookmarks = true,
				},
				glyphs = {
					default = "",
					symlink = "",
					bookmark = "󰆤",
					modified = "●",
					hidden = "󰜌",
					folder = {
						arrow_closed = "",
						arrow_open = "",
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
						symlink_open = "",
					},
					git = {
						unstaged = "✗",
						staged = "✓",
						unmerged = "",
						renamed = "➜",
						untracked = "★",
						deleted = "",
						ignored = "◌",
					},
				},
			},
			highlight_git = "name",
			highlight_modified = "name",
		},
		actions = {
			open_file = {
				resize_window = true,
				window_picker = {
					enable = false,
				},
			},
		},
		disable_netrw = true,
		hijack_netrw = true,
		hijack_cursor = true,
		auto_reload_on_write = true,
		hijack_unnamed_buffer_when_opening = false,
		sync_root_with_cwd = true,
	},
	init = function()
		-- This ensures nvim-tree loads early when starting with a directory
		local function open_nvim_tree_with_empty_buffer(data)
			-- buffer is a directory
			local directory = vim.fn.isdirectory(data.file) == 1
			if not directory then
				return
			end
			-- Change to the directory
			vim.cmd.cd(data.file)
			-- Open an empty buffer first
			vim.cmd("enew")
			-- Open the tree in a split
			require("nvim-tree.api").tree.open()
			-- Focus back to the empty buffer
			vim.cmd("wincmd p")
		end
		vim.api.nvim_create_autocmd({ "VimEnter" }, {
			callback = open_nvim_tree_with_empty_buffer,
		})
	end,
	config = function(_, opts)
		local nvimtree = require("nvim-tree")
		-- Explicitly set the tree to open on the left
		opts.view.side = "left"
		nvimtree.setup(opts)
		-- For handling opening tree on empty buffers after startup
		local function open_tree_on_empty_buffer()
			local buf_name = vim.api.nvim_buf_get_name(0)
			local is_no_name_buffer = buf_name == "" and vim.bo.filetype == "" and vim.bo.buftype == ""

			if is_no_name_buffer and #vim.api.nvim_list_wins() == 1 then
				-- Create a vsplit with an empty buffer
				vim.cmd("vsplit")

				-- Open tree in the left window
				vim.cmd("wincmd h")
				require("nvim-tree.api").tree.open()

				-- Move focus to the empty buffer on the right
				vim.cmd("wincmd l")
			end
		end
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("nvim-tree-empty", { clear = true }),
			callback = open_tree_on_empty_buffer,
			nested = true,
		})

		local function setup_highlights()
			local current_hl = vim.api.nvim_get_hl(0, { name = "NvimTreeOpenedFolderName" })
			local new_hl = vim.deepcopy(current_hl)
			new_hl.bold = false
			vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", new_hl)
		end

		setup_highlights()
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				vim.defer_fn(setup_highlights, 100)
			end,
		})

		-- Also set up an autocmd to ensure foldcolumn is set if the on_attach doesn't catch it
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "NvimTree",
			callback = function()
				vim.wo.foldcolumn = "2"
			end,
		})
	end,
}
