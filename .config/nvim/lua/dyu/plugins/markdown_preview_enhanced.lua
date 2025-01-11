return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_refresh_slow = 1
    vim.g.mkdp_browser = "firefox"

    -- Map MarkdownPreview commands to leader keys
    vim.api.nvim_set_keymap('n', '<leader>mp', ':MarkdownPreview<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>ms', ':MarkdownPreviewStop<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>mt', ':MarkdownPreviewToggle<CR>', { noremap = true, silent = true })
  end,
  ft = { "markdown" },
}

