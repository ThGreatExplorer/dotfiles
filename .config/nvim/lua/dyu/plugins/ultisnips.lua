return {
  "SirVer/ultisnips",
  lazy = false,
  dependencies = {
    "honza/vim-snippets",
  },
  config = function()
    vim.g.UltiSnipsExpandTrigger = "<tab>"
    vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
    vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
    vim.g.UltiSnipsSnippetDirectories = { "UltiSnips" }
  end
}

