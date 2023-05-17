return {
    {
        "folke/persistence.nvim",
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
            require("persistence").setup()
            local map = vim.keymap.set
            map("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], { desc = "Restore previous session in current directory" })
            map("n", "<leader>ql", [[<cmd>lua require("persistence").load({last = true})<cr>]], { desc = "Restore previous session" })
        end
    }
}
