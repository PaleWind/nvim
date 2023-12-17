return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      PATH = "prepend", -- "skip" seems to cause the spawning error
    })
    mason_lspconfig.setup({
      ensure_installed = {
        "html",
        "lua_ls",
        "tsserver",
        "csharp_ls",
      },
      automatic_installation = true
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "eslint_d"
      }
    })
  end,
}
