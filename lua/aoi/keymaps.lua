vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", vim.cmd.Ex)

--tabs to 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

--line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave", "WinEnter"}, {
    callback = function()
        vim.opt.number = true
    end
})

vim.api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertEnter", "WinLeave"}, {
    callback = function()
        vim.opt.number = false
    end
})

--buffer jumping
vim.api.nvim_set_keymap('n', '<leader>n', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>b', ':bprevious<CR>', {noremap = true, silent = true})
--window jumping
vim.api.nvim_set_keymap('n', '<leader>mh', '<C-W>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>mj', '<C-W>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>mk', '<C-W>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ml', '<C-W>l', { noremap = true, silent = true })
--new vertical/horizontal windows
vim.api.nvim_set_keymap('n', '<leader>wv', '<C-W>v', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wh', '<C-W>s', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wc', '<C-W>c', { noremap = true, silent = true })

--copy to clipboard
vim.api.nvim_set_keymap('x', '<leader>c', ':w !pbcopy<CR>', { noremap = true, silent = true })

--exit nvim terminal mode
vim.keymap.set('t', '<leader>w', "<C-\\><C-n><C-w>h",{silent = true})

--open new terminal in horizontal split
vim.api.nvim_set_keymap('n', '<leader>ht', ':botright split | term<CR>', { noremap = true, silent = true })

--open new terminal in vertical split
vim.api.nvim_set_keymap('n', '<leader>vt', ':vsp | term<CR>', { noremap = true, silent = true })


function DeleteBufferKeepWindow()
  -- Get the current buffer number
  local current_buf = vim.api.nvim_get_current_buf()
  -- Try to switch to the next buffer
  vim.cmd('bnext')
  -- Delete the original buffer
  vim.cmd('bdelete ' .. current_buf)
end

-- Map this function to a keybinding, for example <leader>d
vim.api.nvim_set_keymap('n', '<leader>q', ':lua DeleteBufferKeepWindow()<CR>', { noremap = true, silent = true })

--Show full diagnostic message in floating buffer. q to exit.
vim.api.nvim_set_keymap('n', '<leader>m', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>', {noremap = true, silent = true})

