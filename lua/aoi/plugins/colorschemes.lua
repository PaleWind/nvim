return {
  'rebelot/kanagawa.nvim',
  config = function()
    -- Applying the color scheme
    vim.cmd('colorscheme kanagawa')
  end,
  event = 'VimEnter'  -- or any other suitable event
}
