#!/bin/bash

yay -S --noconfirm --needed \
  cargo clang llvm mise

echo 'eval "$(/usr/bin/mise activate zsh)"' >>~/.zshrc
