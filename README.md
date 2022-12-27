# nvim-config

My Neovim configuration.


## Installation

```bash
git clone https://github.com/jvs/nvim-config.git ~/.config/nvim
nvim --headless +"silent! PackerSync" +qall
```

When you first run `nvim`, the treesitter plugin will start downloading and
building a bunch of parsers in the background.

Run the commands `:checkhealth` and `:PackerCompile` and then `:PackerStatus`
to make sure everything is OK.


## Requirements

* fd-find (`fd`)
* ripgrep (`rg`)


### Installing fd-find (`fd`)

Options:
* `brew install fd`
* or `cargo install fd-find`
* or download a release from https://github.com/sharkdp/fd/releases

See https://github.com/sharkdp/fd#installation for more installation options.


### Installing Ripgrep (`rg`)

Options:
* `brew install rg`
* or `cargo install ripgrep`
* or download a release from https://github.com/BurntSushi/ripgrep/releases

See https://github.com/BurntSushi/ripgrep#installation for more installation options.


## Installing Neovim (`nvim`)

### macOS

Use `brew install nvim`, or to install the nightly release (on macOS x86):

```bash
# Download.
cd ~/Downloads
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz

# Extract.
sudo mkdir -p /usr/local/bin
sudo tar zxf nvim-macos.tar.gz -C /usr/local/bin

# Link.
sudo ln -sf /usr/local/bin/nvim-osx64/bin/nvim /usr/local/bin/nvim

# Cleanup.
rm nvim-macos.tar.gz
```
