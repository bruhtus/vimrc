# Minimalist Version of Bruhtus' Neovim Config

This repo is for one-file vim configuration or vimrc. The benefits of using one-file vim config:
- Only need to download one file.
- Not have dependency problem (because only one file).
- Only download the colorscheme by default if no `vim-plug` file found.
- Can be used without plugin (only default mappings and options, use `PlugOn` command to install the plugin).

## The Difference

- Using [vim-plug](https://github.com/junegunn/vim-plug) instead of [minpac](https://github.com/k-takata/minpac) as plugin manager for simplicity (one file rather than one git repo).
- Only have 10 plugins rather than 20+ plugins.
- Only have around 500 lines rather than 1000+ lines.
- Not gonna change much (static version).
