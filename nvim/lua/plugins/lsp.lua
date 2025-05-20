-- ~/.config/nvim/lua/plugins/lsp.lua (or create a custom LSP config)
return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "gopls",
    },
  },
}
