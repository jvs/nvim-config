#!/usr/bin/env bash

echo "Pulling changes from origin."
git pull


echo "Installing the latest plugins from the lock file."
nvim --headless "+Lazy! install" "+Lazy! clean" +qa
