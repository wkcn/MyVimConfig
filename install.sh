mkdir -p ~/.vim/_undodir
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/bundle
cp mirai.vim  ~/.vim/colors/
cp -r autoload/ ~/.vim
cp .vimrc ~/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
