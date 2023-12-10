return {
  'rebelot/kanagawa.nvim',
--  'folke/tokyonight.nvim',
  config = function()
    -- Applying the color scheme

    vim.cmd('colorscheme kanagawa')
--  vim.cmd('colorscheme tokyonight')

    --transparent bg
    vim.cmd [[
      hi Normal guibg=NONE ctermbg=NONE
      hi LineNr guibg=NONE ctermbg=NONE
      hi Folded guibg=NONE ctermbg=NONE
      hi NonText guibg=NONE ctermbg=NONE
      hi SpecialKey guibg=NONE ctermbg=NONE
      hi VertSplit guibg=NONE ctermbg=NONE
      hi StatusLine guibg=NONE ctermbg=NONE
      hi StatusLineNC guibg=NONE ctermbg=NONE
      hi SignColumn guibg=NONE ctermbg=NONE
    ]]

    --highlight color
    vim.api.nvim_set_hl(0, 'Visual', { bg = '#49473e' })

    -- Change the line number color
    vim.api.nvim_set_hl(0, 'LineNr', { fg = '#ffffff' })

    -- Change the current line number color
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ffffff' })
      
  end,
  event = 'VimEnter'  -- or any other suitable event
}
