# nvim-config

My Neovim configuration.


## Installation

```bash
git clone https://github.com/jvs/nvim-config.git ~/.config/nvim
```


## Requirements

* fd-find (fd)
* ripgrep (rg)


### fd-find (fd)

See https://github.com/sharkdp/fd#installation for installation.

Use `brew install fd`, or download a release from
https://github.com/sharkdp/fd/releases

For example, on macOS:
```bash
cd ~/Downloads
curl -LO https://github.com/sharkdp/fd/releases/download/v8.3.0/fd-v8.3.0-x86_64-apple-darwin.tar.gz
sudo tar zxf fd-v8.3.0-x86_64-apple-darwin.tar.gz -C /usr/local/bin
sudo ln -s /usr/local/bin/fd-v8.3.0-x86_64-apple-darwin/fd /usr/local/bin/fd
```

### Ripgrep (rg)

See https://github.com/BurntSushi/ripgrep#installation for installation.

Use `brew install rg`, or download a release from
https://github.com/BurntSushi/ripgrep/releases

For example, on macOS:
```bash
cd ~/Downloads
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-apple-darwin.tar.gz
sudo tar zxf ripgrep-13.0.0-x86_64-apple-darwin.tar.gz -C /usr/local/bin
sudo ln -s /usr/local/bin/ripgrep-13.0.0-x86_64-apple-darwin/rg /usr/local/bin/rg
```

## Installing nvim

### macOS

Use `brew install nvim`, or to install the nightly release:

```bash
# Download the latest release.
cd ~/Downloads
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz

# Make sure we have /usr/local/bin and then extract.
sudo mkdir -p /usr/local/bin
sudo tar zxf nvim-macos.tar.gz -C /usr/local/bin

# Remove the previous version, if it exists.
sudo rm -rf /usr/local/bin/nvim

# Link to the binary.
sudo ln -s /usr/local/bin/nvim-osx64/bin/nvim /usr/local/bin/nvim

# Remove the archive.
rm nvim-macos.tar.gz
```
