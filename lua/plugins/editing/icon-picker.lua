return {
    {
        "ziontee113/icon-picker.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            local icon_picker = require("icon-picker")

            icon_picker.setup({
                disable_legacy_commands = true
            })

            local map = vim.keymap.set
            local function opts(description)
                return { silent = true, noremap = true, desc = description }
            end

            map("n", "<leader>ic", "<cmd>IconPickerNormal<cr>", opts("Insert icon"))
            map("n", "<leader>iy", "<cmd>IconPickerYank<cr>", opts("Pick an icon and yank it"))
            map("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts("Insert icon"))
        end
    }
}
