# nvim-config

My Neovim configuration.


## Installation

```bash
git clone https://github.com/jvs/nvim-config.git ~/.config/nvim
nvim --headless +"silent! PlugInstall" +qall
```

When you first run `nvim`, the treesitter plugin will start downloading and
building a bunch of parsers in the background.

Run the commands `:checkhealth` and `:PlugStatus` to make sure everything is OK.


## Requirements

* fd-find (`fd`)
* ripgrep (`rg`)


### Installing fd-find (`fd`)

See https://github.com/sharkdp/fd#installation for installation.

Use `brew install fd`, or download a release from
https://github.com/sharkdp/fd/releases

For example, on macOS:
```bash
# Download. (Check https://github.com/sharkdp/fd/releases for releases.)
cd ~/Downloads
curl -LO https://github.com/sharkdp/fd/releases/download/v8.3.0/fd-v8.3.0-x86_64-apple-darwin.tar.gz

# Extract.
sudo mkdir -p /usr/local/bin
sudo tar zxf fd-v8.3.0-x86_64-apple-darwin.tar.gz -C /usr/local/bin

# Link.
sudo ln -sf /usr/local/bin/fd-v8.3.0-x86_64-apple-darwin/fd /usr/local/bin/fd

# Cleanup.
rm fd-v8.3.0-x86_64-apple-darwin.tar.gz
```

### Installing Ripgrep (`rg`)

See https://github.com/BurntSushi/ripgrep#installation for installation.

Use `brew install rg`, or download a release from
https://github.com/BurntSushi/ripgrep/releases

For example, on macOS:
```bash
# Download. (Check https://github.com/BurntSushi/ripgrep/releases for releases.)
cd ~/Downloads
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-apple-darwin.tar.gz

# Extract.
sudo mkdir -p /usr/local/bin
sudo tar zxf ripgrep-13.0.0-x86_64-apple-darwin.tar.gz -C /usr/local/bin

# Link.
sudo ln -sf /usr/local/bin/ripgrep-13.0.0-x86_64-apple-darwin/rg /usr/local/bin/rg

# Cleanup.
rm ripgrep-13.0.0-x86_64-apple-darwin.tar.gz
```

## Installing Neovim (`nvim`)

### macOS

Use `brew install nvim`, or to install the nightly release:

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
