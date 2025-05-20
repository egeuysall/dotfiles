return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = require("config.terminal"),
    keys = {
      { "<leader>tt", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Toggle Terminal (horizontal)" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", desc = "Toggle Terminal (vertical)" },
      { "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", desc = "Toggle Terminal (float)" },
    },
  },
}
