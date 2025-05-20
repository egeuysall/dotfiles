return {
  {
    "stevearc/aerial.nvim",
    opts = require("config.aerial"),
    keys = {
      { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial" },
    },
  },
}
