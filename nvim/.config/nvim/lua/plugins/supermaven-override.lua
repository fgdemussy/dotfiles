return {
  {
    "supermaven-inc/supermaven-nvim",
    opts = {
      -- Force enable inline completion even with ai_cmp
      disable_inline_completion = false,
      keymaps = {
        accept_suggestion = "<Tab>",
        accept_word = "<C-j>",
      },
    },
  },
}