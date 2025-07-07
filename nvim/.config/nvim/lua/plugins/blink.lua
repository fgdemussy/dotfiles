return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        ghost_text = {
          enabled = true, -- Ensure ghost text is enabled
        },
      },
      sources = {
        -- Ensure supermaven is in the provider list
        compat = { "supermaven" },
        providers = {
          supermaven = {
            kind = "Supermaven",
            score_offset = 100, -- High priority
            async = true,
          },
        },
      },
    },
  },
}