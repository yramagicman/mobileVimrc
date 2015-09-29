cp -rv ./.* ~/
cp -rv ./* ~/
wget --no-check-certificate http://install.ohmyz.sh -O - | sh
cd ~/.oh-my-zsh/custom/plugins/
git clone https://github.com/yramagicman/zsh-aliases
mkdir -p ~/.oh-my-zsh/custom/themes
ln -s ~/.oh-my-zsh/custom/plugins/zsh-aliases/theme.zsh-theme ~/.oh-my-zsh/custom/themes/theme.zsh-theme
