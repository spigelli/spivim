return {
	-- https://github.com/soulis-1256/eagle.nvim/tree/main
	-- For mouse hover
	{ "soulis-1256/eagle.nvim" },
	-- https://github.com/Fildo7525/pretty_hover/tree/main
	-- For hover documentation on key
	{
		"Fildo7525/pretty_hover",
		event = "LspAttach",
		keys = {
			{ "gh", function() require("pretty_hover").hover() end, desc = "Show Hover Documentation" },
		},
		opts = {
			-- Style headers to match theme
			header = {
				detect = { "[\\@]class", "[\\@]module", "[\\@]interface" },
				styler = "###",
			},

			-- Use theme colors for highlights
			hl = {
				error = {
					color = "#f85149", -- github theme error color
					detect = { "[\\@]error", "[\\@]bug", "[\\@]deprecated" },
					line = true,
				},
				warning = {
					color = "#d29922", -- github theme warning color
					detect = { "[\\@]warning", "[\\@]thread_safety", "[\\@]throw" },
					line = true,
				},
				info = {
					color = "#58a6ff", -- github theme info/link color
					detect = { "[\\@]remark", "[\\@]note", "[\\@]notes", "[\\@]see" },
					line = false,
				},
				param = {
					color = "#bc8cff", -- github theme purple for parameters
					detect = { "[\\@]param", "[\\@]tparam" },
					line = false,
				},
			},

			-- Styling configuration
			border = "rounded", -- Match your UI style
			wrap = true,
			max_width = 80, -- Keep hover windows reasonably sized
			max_height = 40,
			toggle = true, -- Allow toggling the window

			-- Grouping configuration
			group = {
				detect = {
					["Parameters"] = { "[\\@]param", "[\\@]*param*" },
					["Returns"] = { "[\\@]return", "[\\@]returns" },
					["Throws"] = { "[\\@]throws", "[\\@]exception" },
					["See Also"] = { "[\\@]see", "[\\@]seealso" },
				},
				styler = "`",
			},

			-- Other documentation markers
			line = {
				detect = { "[\\@]brief", "[\\@]details", "[\\@]description" },
				styler = "**",
			},
			
			references = {
				detect = { "[\\@]ref", "[\\@]link", "[\\@]see" },
				styler = { "**", "`" },
			},

			-- Auto-dismiss settings
			auto_dismiss = true, -- Automatically close hover window on cursor move
		},
	}
}
