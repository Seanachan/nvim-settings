return {
  "knubie/vim-kitty-navigator",
  -- Only meaningful when nvim runs inside kitty; skip in other terminals / GUIs.
  cond = function()
    return vim.env.KITTY_WINDOW_ID ~= nil or vim.env.TERM == "xterm-kitty"
  end,
  -- Load eagerly so the plugin can set the kitty `IS_VIM` user var on enter
  -- and register the <C-h/j/k/l> mappings. It's a tiny vimscript plugin.
  lazy = false,
  -- Keep navigation confined to visible windows while in kitty's stacked layout.
  -- Set to 1 if you'd rather cycle through stacked (hidden) windows too.
  init = function()
    vim.g.kitty_navigator_enable_stack_layout = 0
  end,
}
