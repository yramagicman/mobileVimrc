#I did try the way posted in forums of sudo apt-get install nvidia-kernel-dkms nvidia-glx #nvidia-xconfig nvidia-settings. but it did not work so I purged and went fresh.
#This is based on the Debian way and worked for me.
#This usually best done from text console not your desktop.
#Stop desktop after going to console with Ctrl-Alt-F1
  invoke-rc.d slim stop
#Check your kernel to see if you have a stock or custom kernel
$ uname -r
#This method should work with most stock or custom kernels. For a custom kernel, you need #to have its Linux headers installed.
 sudo apt-get install module-assistant nvidia-kernel-common
#Then to build module
sudo m-a auto-install nvidia-kernel-source
#Install driver
sudo apt-get install nvidia-glx
#Backup xorg.conf if you have one
 sudo cp -p /etc/X11/xorg.conf /etc/X11/xorg.conf.bak
#Install Nvidia config and settings
sudo apt-get install nvidia-xconfig nvidia-settings
#Run nvidia-xconfig to setup xorg.conf automatically
sudo nvidia-xconfig
#Reboot or restart x
sudo  invoke-rc.d slim restart
