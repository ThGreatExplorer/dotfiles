return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_method = 'latexmk'

    -- Key mappings
    local keymap = vim.keymap
    
    keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>", { desc = "Compile LaTeX" }) -- compile the project
    keymap.set("n", "<leader>lq", "<cmd>VimtexClean<CR>", { desc = "Clean LaTeX" }) -- stop the compilation
    keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>", { desc = "View PDF" }) -- view the PDF
    keymap.set("n", "<leader>ls", "<cmd>VimtexCompile<CR>", { desc = "Forward search" }) -- forward search

  end
}
