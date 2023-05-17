return {
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
            local dashboard = require("dashboard")

			dashboard.setup({
				theme = "doom",
				config = {
					header = {
                        "",
                        "",
						" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
						" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
						" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
						" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
						" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
						" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
                        "",
                        ""
					},
					center = {
						{
							icon = " ",
							desc = "Recent Projects",
							key = "p",
							action = "Telescope projects",
						},
						{
							icon = " ",
							desc = "Recent files",
							key = "r",
							action = "Telescope oldfiles",
						},
						{
							icon = "󰮗 ",
							desc = "Find file",
							key = "f",
							action = "Telescope find_files",
						},
						{
							icon = "󰮳 ",
							desc = "Previous Session",
							key = "s",
							action = 'lua require("persistence").load()',
						},
						{
							icon = "󰢻 ",
							desc = "Config",
							key = "c",
							action = "e $MYVIMRC",
						},
						{
							icon = "󰒲 ",
							desc = "Lazy",
							key = "l",
							action = "Lazy",
						},
                        {
                            icon = "󰩈 ",
                            desc = "Nevermind...",
                            key = "q",
                            action = "qa!"
                        }
					},
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
