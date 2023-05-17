return {
    {
        "KadoBOT/nvim-spotify",
        dependencies = "nvim-telescope/telescope.nvim",
        config = function()
            local spotify = require("nvim-spotify")

            spotify.setup({
                status = {
                    update_interval = 10000,
                    format = "%s %t by %a"
                }
            })

            local map = vim.keymap.set
            local function opts(description)
                return { silent = true, noremap = true, desc = description }
            end

            map("n", "<leader>sn", "<Plug>(SpotifySkip)", opts("Skip the current track"))
            map("n", "<leader>sp", "<Plug>(SpotifyPause)", opts("Pause/Resume the current track"))
            map("n", "<leader>so", ":Spotify<CR>", opts("Open Spotify Search window"))
            map("n", "<leader>sd", ":SpotifyDevices<CR>", opts("Open Spotify Devices window"))
            map("n", "<leader>sb", "<Plug>(SpotifyPrev)", opts("Go back to the previous track"))
            map("n", "<leader>sh", "<Plug>(SpotifyShuffle)", opts("Toggles shuffle mode"))
        end,
        build = ":make"
    }
}
