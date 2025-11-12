return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
		"nvim-lua/plenary.nvim",
		-- Test with blink.cmp
		{
			"saghen/blink.cmp",
			lazy = false,
			version = "*",
			opts = {
				keymap = {
					preset = "enter",
					["<S-Tab>"] = { "select_prev", "fallback" },
					["<Tab>"] = { "select_next", "fallback" },
				},
				cmdline = { sources = { "cmdline" } },
				sources = {
					default = { "lsp", "path", "buffer", "codecompanion" },
				},
			},
		},
	},
	opts = {
		--Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
		adapters = {
			qwen = function()
				return require("codecompanion.adapters").extend("ollama", {
					name = "qwen", -- Give this adapter a different name to differentiate it from the default ollama adapter
					env = {
						endpoint = "http://127.0.0.1:11434",
					},
					schema = {
						model = {
							default = "qwen2.5-coder:14b",
						},
					},
				})
			end,
		},
		opts = {
			log_level = "DEBUG",
		},
		strategies = {
			-- Change the defautl chat adapter
			chat = {
				adapter = "qwen",
				inline = "qwen",
			},
		},
		display = {
			diff = {
				enabled = true,
				layout = "vertical",
				opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
				provider = "default", -- default | mini_diff
			},
		},
		-- extensions = {
		-- 	mcphub = {
		-- 		callback = "mcphub.extensions.codecompanion",
		-- 		opts = {
		-- 			make_vars = true,
		-- 			make_slash_commands = true,
		-- 			show_result_in_chat = true,
		-- 		},
		-- 	},
		-- },
	},
}
