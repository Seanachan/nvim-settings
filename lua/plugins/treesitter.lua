return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- ponytail: pin master; `main` is a breaking rewrite that removed nvim-treesitter.configs.
    -- Switch to main only by migrating the config below to the new API.
    branch = "master",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
