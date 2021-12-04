# nvim-config

My Neovim configuration.


## Installation

```bash
git clone https://github.com/jvs/nvim-config.git ~/.config/nvim
```


## Installing nvim

### macOS

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
