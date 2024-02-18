return {
  "lukas-reineke/indent-blankline.nvim",
  config = function ()
    -- Define custom highlight groups
    vim.api.nvim_set_hl(0, "CustomIndentHighlight", { fg = "#3d5066" }) -- Example: dark blue for indent lines
    vim.api.nvim_set_hl(0, "CustomScopeHighlight", { fg = "#3d5066", bold = false }) -- Example: light brown for scope

    require("ibl").setup({
      -- Use the custom highlight for indentation
      indent = {
        highlight = {
          "CustomIndentHighlight",
        },
        --char = "┆"
        char = "."
      },
      -- Configure scope highlighting
      scope = {
        enabled = true,
        highlight = "CustomScopeHighlight",
        char = "┃"
      },
      -- Optional: Configure whitespace if needed
      -- whitespace = {
      --   highlight = "YourWhitespaceHighlightGroupName",
      -- },
    })
  end
}

