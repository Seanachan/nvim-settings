return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<C-\\>", desc = "Toggle terminal" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal (float)" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Terminal (horizontal)" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", desc = "Terminal (vertical)" },
  },
  opts = {
    open_mapping = [[<C-\>]],
    direction = "float",
    float_opts = {
      border = "curved",
    },
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Terminal-mode keymaps: easier escape + window navigation
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*toggleterm#*",
      callback = function()
        local o = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], o)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], o)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], o)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], o)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], o)
      end,
    })
  end,
}
