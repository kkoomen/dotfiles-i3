#!/usr/bin/env bash

cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer --tern-completer
