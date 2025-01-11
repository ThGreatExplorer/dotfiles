return {
  'SirVer/ultisnips',
  dependencies = {
    'honza/vim-snippets',  -- Optional: Provides a collection of snippets
  },
  config = function()
    vim.g.UltiSnipsExpandTrigger = "<tab>"  -- Expand snippet
    vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"  -- Jump forward in snippet
    vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"  -- Jump backward in snippet
    vim.g.UltiSnipsSnippetDirectories = {"UltiSnips"}  -- Directory for custom snippets
  end
}
