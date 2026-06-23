return {
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- macOS: use Skim as the SyncTeX-aware PDF viewer
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_view_skim_sync = 1      -- forward search (source -> PDF) after each compile
      vim.g.vimtex_view_skim_activate = 1  -- bring Skim to the foreground on forward search
      -- compilation uses latexmk by default (install with: sudo tlmgr install latexmk)
    end
  }
}
