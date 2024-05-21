return {
  {
    "barrett-ruth/live-server.nvim",
  },
  {
    "szw/vim-maximizer",
    event = "BufReadPre",
    keys = {
      { "sm", "<cmd>MaximizerToggle!<CR>", { desc = "Maximize/minimize a split" } },
    },
  },
}
