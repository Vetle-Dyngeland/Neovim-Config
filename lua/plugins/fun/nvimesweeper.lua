return {
    {
        "seandewar/nvimesweeper",
        config = function()
            local map = vim.keymap.set

            map("n", "<leader>fms", "<cmd>Nvimesweeper<cr>", { desc = "Play nvimesweeper" })
        end
    }
}
