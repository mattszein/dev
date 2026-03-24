#!/bin/bash

yay -S --noconfirm --needed \
  cargo clang llvm mise

eval "$(/usr/bin/mise activate zsh)"

echo 'eval "$(/usr/bin/mise activate zsh)"' >>~/.zshrc
