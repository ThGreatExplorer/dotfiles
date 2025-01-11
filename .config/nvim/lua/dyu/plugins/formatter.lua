return {
  {
    "nvim-lua/plenary.nvim", -- dependency for formatter.nvim
    "mhartington/formatter.nvim",
    config = function()
      require('formatter').setup({
        logging = true, -- Enable logging for debugging
        filetype = {
          lua = {
            function()
              return {
                exe = "stylua",
                args = {"-"},
                stdin = true
              }
            end
          }
        }
      })

      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = {"*.lua"},
        command = "FormatWrite",
      })
    end
  }
}

