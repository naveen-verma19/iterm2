#!/bin/bash
[ ! -d "$HOME/.oh-my-zsh" ] && echo "Please install oh-my.zsh first" && exit 1
[ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ] && echo "Please install powerlevel10k first" && exit 1
[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ] && echo "Please install zsh-autosuggestions first" && exit 1
[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ] && echo "Please install zsh-syntax-highlighting first" && exit 1

#.hushlogin prevents the welcome message "Last login at ddmmyy"
[ ! -f "$HOME/.hushlogin" ] && touch "$HOME/.hushlogin" && echo "file .hushlogin created"

for font in Fonts/*
do
fontname="$(basename "$font")"
[ ! -f "$HOME/Library/Fonts/$fontname" ] && cp "Fonts/$font" "$HOME/Library/Fonts" && echo "$font copied"
done

[ -f "$HOME/.zshrc" ] && mv "$HOME/.zshrc" "$HOME/.zshrc.backup" && echo "taking backup of .zshrc "

[ -f "$HOME/.p10k.zsh" ] && mv "$HOME/.p10k.zsh" "$HOME/.p10k.zsh.backup" && echo "taking backup of .p10k.zsh"

cp .zshrc "$HOME/.zshrc" 
cp .p10k.zsh "$HOME/.p10k.zsh" 
echo ".zshrc and .p10k.zsh replaced"

exit 0
