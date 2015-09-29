sudo -v
invoke-rc.d slim stop
uname -r
sudo apt-get install -y module-assistant nvidia-kernel-common
sudo m-a auto-install nvidia-kernel-source
sudo apt-get install -y nvidia-glx
sudo cp -p /etc/X11/xorg.conf /etc/X11/xorg.conf.bak
sudo nvidia-xconfig
udo apt-add-repository ppa:relan/exfat
sudo apt-get install fuse-exfat
sudo shutdown -r now
