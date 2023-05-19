return {
    {
        "nvim-colortils/colortils.nvim",
        cmd = "Colortils",
        config = function()
            local colortils = require("colortils")

            colortils.setup({
                default_format = "rgb",
            })

            local map = vim.keymap.set
        end
    }
}
