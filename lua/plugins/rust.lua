return {
    {
        "simrat39/rust-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "neovim/nvim-lspconfig"
        },
        config = function()
            local rt = require("rust-tools")

            rt.setup()
        end
    },
    "Saecki/crates.nvim"
}
