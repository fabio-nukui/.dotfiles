vim.g.mapleader = " "

-- go to file explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- quick move line up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in middle of screen on some moves
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste/delete using void buffer
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- tab management
vim.keymap.set("n", "<C-n>", "<cmd>tabmove +<CR>")
vim.keymap.set("n", "<C-p>", "<cmd>tabmove -<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<leader>Q", "<cmd>tabclose !<CR>")

-- tab navigation
vim.keymap.set("n", "<leader>n", "<cmd>tabn<CR>")
vim.keymap.set("n", "<leader>p", "<cmd>tabp<CR>")
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
vim.keymap.set("n", "<leader>7", "7gt")
vim.keymap.set("n", "<leader>8", "8gt")
vim.keymap.set("n", "<leader>9", "9gt")

-- close buffer
vim.keymap.set("n", "<leader>x", "<cmd>bd<CR>")

-- disable Q in normal mode
vim.keymap.set("n", "Q", "<nop>")

-- navigate diagnostics
vim.keymap.set("n", "<leader>g", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "<leader>G", "<cmd>lua vim.diagnostic.goto_prev()<CR>")

-- quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
