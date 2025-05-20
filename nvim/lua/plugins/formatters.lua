-- ~/.config/nvim/lua/plugins/formatters.lua
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      go = { "goimports", "gofmt" },
    },
  },
}
