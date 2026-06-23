return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<M-l>",      -- Alt/Option + l to accept
            accept_word = "<M-w>", -- Alt/Option + w to accept word
            accept_line = "<M-j>", -- Alt/Option + j to accept line
            next = "<M-]>",        -- Alt/Option + ] for next suggestion
            prev = "<M-[>",        -- Alt/Option + [ for prev suggestion
            dismiss = "<C-]>",     -- Ctrl + ] to dismiss
          },
        },
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"        -- Alt/Option + Enter to open panel
          },
        },
        filetypes = {
          markdown = true,
          help = false,
        },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
