--@type LazySpec
return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	opts = {
		groups = {
			github_dark_default = {
				WinSeparator = { fg = "#30363D" },
			},
		},
	},

	config = function(_, opts)
		require("github-theme").setup(opts)
		vim.cmd("colorscheme github_dark_default")
	end,
}
