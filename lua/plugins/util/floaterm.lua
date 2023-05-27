return {
    {
        "voldikss/vim-floaterm",
        config = function()
            local default_options = "--width=0.3 --height=0.35 --position=topright"
            local map = vim.keymap.set

            map("n", "<leader>tm", "<cmd>FloatermNew " .. default_options .."<cr>", { desc = "Open a new floaterm with default options" })
            map("n", "<leader>tn", "<cmd>FloatermNew<cr>", { desc = "Open a new floaterm" })

            map("n", "<leader>ta", function()
                local input = vim.fn.input("Floaterm arguments > ")
                vim.cmd([[FloatermNew]] .. input)
            end, { desc = "Open new floaterm with the given arguments" })

            map("n", "<leader>tt", "<cmd>FloatermToggle<cr>", { desc = "Toggle floaterm" })
            map("t", "<leader>tt", "<cmd>FloatermToggle<cr>", { desc = "Toggle floaterm" })

            map("n", "<leader>tj", "<cmd>FloatermNext<cr>", { desc = "Goto next floaterm" })
            map("t", "<leader>tj", "<cmd>FloatermNext<cr>", { desc = "Goto next floaterm" })

            map("n", "<leader>tk", "<cmd>FloatermPrev<cr>", { desc = "Goto previous floaterm" })
            map("t", "<leader>tk", "<cmd>FloatermPrev<cr>", { desc = "Goto previous floaterm" })

            map("n", "<leader>tu", function()
                local input = vim.fn.input("New floaterm arguments > ")
                vim.cmd([[FloatermUpdate]] .. input)
            end, { desc = "Update current floaterm with the given arguments" })
            map("t", "<leader>tu", function()
                local input = vim.fn.input("New floaterm arguments > ")
                vim.cmd([[FloatermUpdate]] .. input)
            end, { desc = "Update current floaterm with the given arguments" })
        end
    }
}
