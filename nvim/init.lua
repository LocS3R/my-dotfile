-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.loader then
  vim.loader.enable()
end
require("config.lazy")
require("tabnine").setup({
  disable_auto_comment = true,
  accept_keymap = "<S-Tab>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = { gui = "#808080", cterm = 244 },
  exclude_filetypes = { "TelescopePrompt", "NvimTree" },
  log_file_path = nil, -- absolute path to Tabnine log file
})
require("lualine").setup({
  options = {
    theme = "catppuccin-mocha",
  },
  sections = {
    lualine_x = {
      {
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
        color = { fg = "#ff9e64" },
      },
      { "encoding" },
      { "fileformat" },
      { "filetype" },
    },
  },
})
