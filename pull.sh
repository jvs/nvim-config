#!/usr/bin/env bash

# Pull the latest changes from origin.
git pull


# Install the latest plugins from the lock file.
nvim --headless "+Lazy! install" "+Lazy! clean" +qa
