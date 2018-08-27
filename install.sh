mkdir -p ~/.vim/_undodir
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/bundle
cp mirai.vim  ~/.vim/colors/
cp -r autoload/ ~/.vim
cp .vimrc ~/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
