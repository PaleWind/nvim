return {
  'akinsho/toggleterm.nvim',
  version = "*", -- This specifies you want the latest version
  config = function()
    require("toggleterm").setup{
      -- Your configuration options go here
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'horizontal',
      close_on_exit = true,
      shell = vim.o.shell, -- Use the default Vim shell
      -- Add any other options you need
    }

    -- Function to set custom key mappings for terminal buffers
    function _G.set_terminal_keymaps()
      local opts = {buffer = true} -- Apply mappings only to the current buffer
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    end

    -- Apply the custom key mappings to every terminal buffer opened by toggleterm
    vim.cmd([[autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()]])
  end
}

