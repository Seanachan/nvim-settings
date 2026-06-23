return {
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- SyncTeX-aware PDF viewer, per OS: Skim on macOS, zathura on Linux.
      if vim.fn.has("mac") == 1 then
        vim.g.vimtex_view_method = "skim"
        vim.g.vimtex_view_skim_sync = 1      -- forward search (source -> PDF) after each compile
        vim.g.vimtex_view_skim_activate = 1  -- bring Skim to the foreground on forward search
      else
        -- Linux: install with `sudo apt install zathura zathura-pdf-mupdf`
        vim.g.vimtex_view_method = "zathura"
      end
      -- compilation uses latexmk by default (install with: sudo tlmgr install latexmk)
    end
  }
}
