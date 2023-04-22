return {
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup({
                patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml" },
                show_hidden = false,
                scope_chdir = "global",
                silent_chdir = true,
            })

            require("telescope").load_extension("projects")

            vim.keymap.set("n", "<leader>pj", function()
                require("telescope").extensions.projects.projects()
            end, { desc = "Browse Projects" })
        end
    }
}
