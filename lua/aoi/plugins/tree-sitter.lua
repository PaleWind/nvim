return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "c",
                "c_sharp",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "elixir",
                "heex",
                "javascript",
                "html"
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true
            },
        })

        -- It's better to manage conditional disabling outside the 'configs.setup' if the specific module
        -- doesn't support it directly. For example, you can hook into the 'BufRead' and 'BufNewFile'
        -- autocommands to disable highlighting for large files as shown below.
        vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
            callback = function()
                local max_filesize = 100 * 1024 -- 100 KB
                local filesize = vim.fn.getfsize(vim.fn.expand("<afile>"))
                if filesize > max_filesize then
                    -- Disable Treesitter highlighting for this buffer
                    vim.cmd([[TSBufDisable highlight]])
                end
            end
        })
    end
}

