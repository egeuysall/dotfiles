return {
  "pwntester/octo.nvim",
  cmd = "Octo",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("octo").setup()
  end,
  keys = {
    { "<leader>o", "<cmd>Octo<cr>", desc = "Open Octo" },
  },
}
