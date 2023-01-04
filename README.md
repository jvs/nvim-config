# nvim-config

My Neovim configuration.


## Installation

```bash
git clone https://github.com/jvs/nvim-config.git ~/.config/nvim
```

Then in nvim:
```
:source ~/.config/nvim/lua/user/packer.lua
:PackerSync
```

Wait for Packer to finish, and then restart nvim. Then wait for Treesitter to
finish downloading grammars.

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

## Mappings

Use `<space><space>` to open a command palette.


### To toggle the floating terminal windows:
  - Use `ctrl+\` to toggle terminal 1, or to close the current terminal.
  - Use any digit plus `ctrl+\` to open that terminal.
  - For example, press `2,ctrl+\` to open terminal 2.
  - Use `ctr+j` to open or close terminal 1.
  - Use `ctr+k` to open or close terminal 2.
  - Use `ctr+h` to open or close terminal 3.
  - The `ctrl+[hjk]` chord may be used to switch between the terminals.


### To open the tree explorer:
  - Use `<leader>t` to view the file system
  - Use `<leader>b` to view the buffers


### To navivate the tree explorer:
  - Use "?" to see the mappings for the tree explorer.
  - Use "q" or "<esc>" or "<leader>t" to close the tree explorer.
  - Use "C" to copy the full path of the selected file.
  - Use "c" to copy the relative path of the selected file.
