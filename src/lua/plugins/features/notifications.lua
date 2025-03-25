return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			cmdline = {
				view = "cmdline",
			},
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
			presets = {
				bottom_search = true,
				command_palette = false,
				long_message_to_split = true,
			},
		},
		config = function(_, opts)
			-- HACK: noice shows messages from before it was enabled,
			-- but this is not ideal when Lazy is installing plugins,
			-- so clear the messages in this case.
			if vim.o.filetype == "lazy" then
				vim.cmd([[messages clear]])
			end
			require("noice").setup(opts)
		end,
	},
	{
		"folke/snacks.nvim",
		---@type snacks.Config
		opts = {
			notifier = {
				timeout = 10000, -- default timeout in ms
				width = { min = 40, max = 0.4 },
				height = { min = 1, max = 0.6 },
				-- editor margin to keep free. tabline and statusline are taken into account automatically
				margin = { top = 0, right = 1, bottom = 0 },
				padding = true, -- add 1 cell of left/right padding to the notification window
				sort = { "level", "added" }, -- sort by level and time
				-- minimum log level to display. TRACE is the lowest
				-- all notifications are stored in history
				level = vim.log.levels.TRACE,
				icons = {
					error = " ",
					warn = " ",
					info = " ",
					debug = " ",
					trace = " ",
				},
				keep = function(notif)
					return vim.fn.getcmdpos() > 0
				end,
				---@type snacks.notifier.style
				style = "compact",
				top_down = false, -- place notifications from top to bottom
				date_format = "%R", -- time format for notifications
				-- format for footer when more lines are available
				-- `%d` is replaced with the number of lines.
				-- only works for styles with a border
				---@type string|boolean
				more_format = " ↓ %d lines ",
				refresh = 50, -- refresh at most every 50ms
			},
		},
	},
}
