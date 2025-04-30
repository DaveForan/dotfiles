return {
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		opts = function()
			return {
				transparent = false,
			}
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		priority = 1250,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1500,
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
	},
}
