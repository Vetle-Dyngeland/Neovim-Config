return {
    {
        "Mofiqul/vscode.nvim",
        config = function()
            require("vscode").setup({
                italic_comments = false,
                transparent = false,
                disable_nvimtree_bg = false,
            })

            require("vscode").load()
            vim.cmd [[ colorscheme vscode ]]
        end
    }
}
