sudo -v
sudo find . -type f -name 'npm-debug.log' -ls -delete &
#sudo find . -type f -name '*.log' -ls -delete &
find . -type f -name '*.DS_Store' -ls -delete &
rm -rfv ./**/.sass-cache && rm -rfv ./.sass-cache &
sudo rm -rfv ./tmp &
rm -rf ~/Library/Caches/com.spotify.client/Storage/ &
npm cache clear &
bower cache clean &
cd ~/Gits
find . -type 'directory' -maxdepth 1  -ls -exec git pull \;
# sascript -e 'set volume 1'
cd ~/
cd ~/.oh-my-zsh
git pull
cd ~/

say 'script complete'
