# nvim-settings

My personal Neovim configuration, managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

## Install on a new machine

Clone this repo straight into your Neovim config directory:

```sh
# Back up an existing config first, if any
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null

git clone https://github.com/Seanachan/nvim-settings.git ~/.config/nvim
nvim
```

On first launch `init.lua` bootstraps lazy.nvim automatically, then lazy installs
every plugin pinned in `lazy-lock.json`. Wait for it to finish, then restart Neovim.

## Requirements

- Neovim **0.9+** (uses `vim.uv`)
- `git` (lazy.nvim clones plugins over it)
- A [Nerd Font](https://www.nerdfonts.com/) for icons (neo-tree, lualine, alpha)
- `ripgrep` + `fd` — Telescope live grep / file find
- `node` — Copilot and several LSP servers
- LSP servers / formatters / linters are installed via Mason on demand

## Layout

```
init.lua              -- entry: loads vim-options, bootstraps lazy, loads plugins/
lua/vim-options.lua   -- editor settings + core keymaps (leader = space)
lua/plugins/*.lua     -- one file per plugin spec, auto-loaded by lazy
lazy-lock.json        -- pinned plugin versions (commit this; it's your lockfile)
```

## Updating

```sh
nvim                  # then :Lazy sync   (update + install + clean)
```

After updating, commit the refreshed lock file so other machines stay in sync:

```sh
git add lazy-lock.json && git commit -m "Update plugins" && git push
```
