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

## System dependencies

These live **outside** Neovim — Mason/lazy will NOT install them. Set them up per
machine before the config works fully.

### Required (core editor + plugins)

| Tool | Why |
| --- | --- |
| Neovim **0.9+** | uses `vim.uv` |
| `git` | lazy.nvim clones plugins |
| C compiler + `make` (clang/gcc) | builds Treesitter parsers and `telescope-fzf-native` |
| `curl`/`wget`, `unzip` | Mason downloads servers/tools |
| **Node.js 18+** + `npm` | Copilot, markdown-preview, and node-based LSPs (`ts_ls`, `pyright`, `html`, `cssls`, `jsonls`) + `prettier`/`eslint_d`/`markdownlint` |
| A [Nerd Font](https://www.nerdfonts.com/) | icons in neo-tree / lualine / alpha |

### Search (Telescope)

| Tool | Why |
| --- | --- |
| `ripgrep` (`rg`) | `<leader>fg` live grep |
| `fd` | `<leader>ff` find files (faster than fallback) |

### LaTeX — only if you edit `.tex` (vimtex)

| Tool | Why |
| --- | --- |
| TeX distribution (MacTeX / TeX Live) → `latexmk` | compilation |
| **Skim** (macOS) | SyncTeX-aware PDF viewer (`vimtex_view_method = "skim"`) |

### Optional

| Tool | Why |
| --- | --- |
| `kitty` terminal | `vim-kitty-navigator` `<C-h/j/k/l>` window nav (auto-skipped elsewhere) |

### Quick install

**macOS (Homebrew):**

```sh
brew install neovim git node ripgrep fd
brew install --cask font-jetbrains-mono-nerd-font   # any Nerd Font
brew install --cask skim                            # LaTeX preview (optional)
brew install --cask mactex-no-gui                   # LaTeX engine (optional, large)
```

**Debian/Ubuntu:**

```sh
sudo apt install neovim git build-essential nodejs npm ripgrep fd-find unzip curl
# install a Nerd Font manually; texlive-full for LaTeX (optional)
```

### Per-machine auth (not an install)

```
:Copilot auth     # log in to GitHub Copilot, once per machine
```

LSP servers, formatters, and linters themselves are installed automatically by
Mason on first launch — they are NOT in this table.

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
