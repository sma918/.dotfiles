vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jkk" }) -- exit insert with jkk instead of moving to escape key

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" }) -- clear the search highlights

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number"}) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w> =", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<C-w>q", { desc = "Close current split" }) -- close current split window 

keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tw", "<C-w>T", { desc = "Break window into seperate tab" }) -- breaks window into a seperate tab
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" }) -- closes current tab
keymap.set("n", "<leader>tn", "<C-PageDown>", { desc = "Go to next tab" }) -- go to the next tab
keymap.set("n", "<leader>tp", "<C-PageUp>", { desc = "Go to previous tab" }) -- go to the previous tab
keymap.set("n", "<leader>tf", ":tabnew %<CR>", { desc = "Open current buffer in new tab" }) -- move current buffer to new tab
