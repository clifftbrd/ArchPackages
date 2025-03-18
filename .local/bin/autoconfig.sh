#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

printf "$GREEN password to perform pacman adds of needed programs $NC \n"
sudo pacman -S --needed base-devel zsh zsh-autosuggestions zsh-syntax-highlighting fzf rsync cifs-utils trash-cli vim gvfs gvfs-smb bat spice-vdagent
echo "export ZDOTDIR=\"\$HOME/.config/zsh\""| sudo tee /etc/zsh/zshenv
sudo mkdir -p /media/winshare
sudo mount -t cifs -o credentials=/etc/cifs-credentials,uid=1000,gid=1000 //192.168.1.218/cliff /media/winshare
mkdir -p ~/.cache/zsh
touch ~/.cache/zsh/history
rsync -av /media/winshare/ArchPC/.config/zsh ~/.config
rsync -av /media/winshare/ArchPC/.config/dwm-6.5 ~/.config
rsync -av /media/winshare/ArchPC/.config/dwmblocks-async ~/.config
rsync -av /media/winshare/ArchPC/.config/fontconfig ~/.config
rsync -av /media/winshare/ArchPC/.local/bin ~/.local/
rsync -av /media/winshare/ArchPC/.config/vim ~/.config
rsync -av /media/winshare/ArchPC/Pictures ~/
rsync -av /media/winshare/ArchPC/.xinitrc ~/
printf "$GREEN loading admin packages $NC \n"
sudo pacman -S --needed - < ~/.local/bin/adminpkg.txt && printf "$GREEN Successful admin pkgs $NC \n"||printf "$RED admin packages failed $NC \n"
printf "$GREEN loading sound  packages"
sudo pacman -S --needed - < ~/.local/bin/soundpkg.txt && printf "$GREEN Successful sound pkgs $NC \n"||printf "$RED sound packages failed $NC \n"
printf "$GREEN loading print packages"
sudo pacman -S --needed - < ~/.local/bin/printpkg.txt && printf "$GREEN Successful print pkgs $NC \n"||printf "$RED print packages failed $NC \n"
chsh -s /bin/zsh
printf "$GREEN install dwm!! $NC \n"
cd $HOME/.config/dwm-6.5
sudo make clean install&&printf "$GREEN dwm success!! $NC \n"||printf "$RED dwm failed $NC \n"
printf "$GREEN install dwmblocks!! $NC \n"
cd $HOME/.config/dwmblocks-async
sudo make clean install&&printf "$GREEN dwmblocks success!! $NC \n"||printf "$RED dwmblocks failed!! $NC \n"
printf "$GREEN autoconfig conmplete $NC \n"
