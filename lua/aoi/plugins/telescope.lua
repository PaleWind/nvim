return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    'sharkdp/fd',
    'nvim-tree/nvim-web-devicons',
    {'nvim-telescope/telescope-fzf-native.nvim', build="make"}
  },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>st', builtin.buffers, {})
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})

    local actions = require("telescope.actions")
    local telescope = require('telescope')
    telescope.setup{
      defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          }
        }
      },
      pickers = {},
      extensions = {}
    }

    telescope.load_extension("fzf");

  end
}
