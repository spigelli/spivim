return {
	"kosayoda/nvim-lightbulb",
	event = { "LspAttach" },
	dependencies = { "neovim/nvim-lspconfig" },
	opts = {
		-- Closely mimic VS Code's code action lightbulb
		priority = 10,
		hide_in_unfocused_buffer = true,

		-- Enable sign column for VS Code-like experience
		sign = {
			enabled = true,
			text = "💡", -- VS Code-like lightbulb
			hl = "DiagnosticSignInfo", -- Match VS Code's info color
		},

		-- Ignore certain clients or scenarios
		ignore = {
			clients = { "null-ls" }, -- Often generates noisy code actions
			actions_without_kind = true, -- Ignore vague actions
		},

		-- Code action kinds to focus on (similar to VS Code)
		action_kinds = {
			"quickfix",
			"refactor",
			"source.organizeImports",
		},

		-- Autocmd configuration
		autocmd = {
			enabled = true,
			updatetime = 200, -- Responsive but not too aggressive
			events = { "CursorHold", "CursorHoldI" },
		},

		-- Optional: Enable code lens for additional VS Code-like functionality
		code_lenses = true,

		-- Optional: Virtual text for additional visibility
		virtual_text = {
			enabled = false, -- Can be enabled if you prefer
			text = "💡",
			pos = "eol",
		},

		-- Optional: Floating window for code actions
		float = {
			enabled = false, -- Set to true if you want floating preview
			text = "💡",
			win_opts = {
				focusable = false,
				border = "rounded", -- VS Code-like border
			},
		},
	},
	config = function(_, opts)
		require("nvim-lightbulb").setup(opts)

		-- Use Command + Period for code actions
		vim.keymap.set("n", "<D-.>", function()
			vim.lsp.buf.code_action()
		end, { desc = "Code Actions" })
	end,
}
