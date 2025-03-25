--@type LazySpec
return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	opts = {
		options = {
			transparent = false,
			darken = {
				floats = false,
			},
		},
		groups = {
			github_dark_default = {
				WinSeparator = { fg = "#30363D" },
				-- FloatBorder = { fg = "#9198A1" },
				FloatBorder = { fg = "#363C45" },
				NormalFloat = { fg = "fg1", bg = "bg1" },
			},
		},
	},

	config = function(_, opts)
		require("github-theme").setup(opts)
		vim.cmd("colorscheme github_dark_default")
	end,
}
