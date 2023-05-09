local map = vim.keymap.set

local function opts(description)
    return { silent = true, noremap = true, desc = str }
end

-- LSP
map("n", "<leader>f", vim.lsp.buf.format, opts("Format"))
map("n", "<leader>rm", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts("Search and replace"))
map("v", "<leader>rm", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts("Search and replace"))

-- Movement
map("n", "<A-j>", "<cmd>m .+1<cr>==", opts("Move down"))
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

map("n", "<A-O>", "O<esc>")
map("n", "<A-o>", "o<esc>")

-- Windows
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Buffers
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts("Move to previous buffer"))
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts("Move to next buffer"))

map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts("Move buffer back"))
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts("Move buffer forward"))

map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts("Go to buffer 1"))
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts("Go to buffer 2"))
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts("Go to buffer 3"))
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts("Go to buffer 4"))
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts("Go to buffer 5"))
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts("Go to buffer 6"))
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts("Go to buffer 7"))
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts("Go to buffer 8"))
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts("Go to buffer 9"))
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts("Go to last buffer"))

map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts("Toggle buffer pin"))
map('n', '<A-c>', '<Cmd>BufferClose!<CR>', opts("Close buffer"))

-- Other
map("t", "<leader>qq", "<C-\\><C-n>")
