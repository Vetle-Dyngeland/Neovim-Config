return {
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            { "jose-elias-alvarez/null-ls.nvim" },

            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
        config = function()
            local lsp = require("lsp-zero")

            lsp.preset("recommended")

            lsp.ensure_installed({
                "rust_analyzer",
            })

            lsp.configure("lua_ls", {
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            local luasnip = require("luasnip")
            local cmp = require("cmp")
            local cmp_mappings = lsp.defaults.cmp_mappings({
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-space>"] = cmp.mapping.complete({}),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            })

            lsp.setup_nvim_cmp({
                mapping = cmp_mappings,
            })

            cmp.setup({completion = { completeopt = "menu,menuone,noinsert" }})

            lsp.set_preferences({
                suggest_lsp_servers = true,
                sign_icons = {
                    error_sign = " ",
                    warn_sign = " ",
                    hint_sign = " ",
                    infor_sign = " "
                }
            })

            lsp.on_attach(function(_, bufnr)
                local function opts(description)
                    return { buffer = bufnr, remap = false, desc = description }
                end

                local map = vim.keymap.set

                map("n", "gd", function() vim.lsp.buf.definition() end, opts("Go to definition"))
                map("n", "gr", function() vim.lsp.buf.references() end, opts("Go to references"))
                map("n", "K", function() vim.lsp.buf.hover() end, opts("Lsp hover"))
                map("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts("Open floating diagnostics"))
                map("n", "]d", function() vim.diagnostic.goto_next() end, opts("Go to next diagnostic"))
                map("n", "[d", function() vim.diagnostic.goto_prev() end, opts("Go to previous diagnostic"))
                map("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts("Code action"))
                map("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts("Rename (vim)"))
                map("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts("Signature help"))
            end)

            lsp.setup()

            vim.diagnostic.config({
                virtual_text = false,
                underline = true,
                update_in_insert = true,
                severity_sort = true,
                virtual_lines = { only_current_line = true }
            })
        end,
    },
}
