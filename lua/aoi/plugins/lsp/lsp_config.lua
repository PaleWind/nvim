return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
    { "folke/neodev.nvim", opts = {} },
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim"
	},

	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }
		local capabilities = cmp_nvim_lsp.default_capabilities()
		local signs = {}

		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			opts.desc = "Show telescope references"
			keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

			opts.desc = "Go to definition"
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

      -- Find references
			--opts.desc = "Show "
      --vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

			opts.desc = "Show hover"
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

			opts.desc = "Show code actions"
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

			opts.desc = "Rename symbol"
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

			opts.desc = "Format Code"
      vim.keymap.set('n', '<leader>mf', vim.lsp.buf.formatting, opts)

			opts.desc = "Signature help"
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

      -- Navigate diagnostics
      vim.keymap.set('n', '[', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, opts)

		end


--    lspconfig["omnisharp"].setup({
--      on_attach = on_attach,

--    })
--    lspconfig["csharp_ls"].setup{
--			capabilities = capabilities,
--			on_attach = on_attach,
--    }

		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
