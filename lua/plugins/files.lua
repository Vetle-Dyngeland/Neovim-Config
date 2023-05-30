return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup()

            local map = vim.keymap.set

            map("n", "<leader>pv", "<cmd>NvimTreeFocus<cr>", { desc = "Focus Nvim Tree" })
            map("n", "<leader>pt", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle Nvim Tree" })
        end
    },
    {
        "ahmedkhalf/project.nvim",
        config = function()
            local project = require("project_nvim")

            project.setup({
                patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml" },
                show_hidden = false,
                scope_chdir = "global",
                silent_chdir = true,
            })

            local telescope = require("telescope")

            telescope.load_extension("projects")

            vim.keymap.set("n", "<leader>pj", function()
                telescope.extensions.projects.projects()
            end, { desc = "Browse Projects" })
        end
    }

}
