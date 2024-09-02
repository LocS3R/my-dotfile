local discipline = require("locdevz.discipline")

discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')
keymap.set("n", "dw", "vb_d") -- Delete a word backwards

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
keymap.set("n", "sx", "<cmd>close<CR>")

-- Move window
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-l>", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- noice dismiss
keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Diss miss Noice Message" })

keymap.set("n", "<leader>y", '"+', { noremap = true })

-- Diagnostics
keymap.set("n", "<C-S-j>", function()
  vim.diagnostic.goto_next()
end, opts)
--- Example integration with Tabnine and LuaSnip; falling back to inserting tab if neither has a completion
vim.keymap.set("i", "<tab>", function()
  if require("tabnine.keymaps").has_suggestion() then
    return require("tabnine.keymaps").accept_suggestion()
  elseif require("luasnip").jumpable(1) then
    return require("luasnip").jump(1)
  else
    return "<tab>"
  end
end, { expr = true })

keymap.set("n", "<leader>i", function()
  require("locdevz.lsp").toggleInlayHints()
end)
