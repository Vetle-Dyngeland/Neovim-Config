return {
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        lazy = false,
        module = "persistence",
        opts = {
            options = {
                "buffers",
                "curdir",
                "tabpages",
                "winsize",
                "help",
                "globals"
            }
        },
        config = function()
            vim.keymap.set("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]],
            { desc = "Restore previous session in current directory" })
            vim.keymap.set("n", "<leader>ql", [[<cmd>lua require("persistence").load({last = true})<cr>]],
            { desc = "Restore previous session" })
        end
    }
}
