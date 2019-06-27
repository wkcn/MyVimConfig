# Install
```bash

git clone https://github.com/wkcn/MyVimConfig
cd MyVimConfig
sh install.sh
# Open VIM
vim
# Enter vim command
:PlugInstall
:CocInstall coc-python
:CocInstall coc-json
# Install nodejs, yarn, ccls (pacman -S xxx) and copy the configuration: https://github.com/MaskRay/ccls/wiki/coc.nvim into `:CocConfig`
:CocConfig
```
