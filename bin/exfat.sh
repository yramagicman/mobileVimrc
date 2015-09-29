
sudo add-apt-repository ppa:relan/exfat
sudo apt-get update
sudo apt-get install subversion scons libfuse-dev gcc
cd
svn co http://exfat.googlecode.com/svn/trunk/ exfat-read-only
cd exfat-read-only
scons
sudo scons install
cd ..
rm -rf exfat-read-only
#sudo mkdir /media/ [creating mountpoint - example: sudo mkdir /media/exfat]
#sudo mount -t exfat-fuse [device_path] [mountpoint]
# ------------------------------------------------------------------------------------------------------------  #
#
# Sources/References:
#   - Source: http://ubuntuforums.org/showthread.php?t=958476&page=3
#   - Source: http://ubuntuforums.org/showpost.php?p=10484125&postcount=28
#   - Source: https://launchpad.net/~relan/+archive/exfat
#   - Source: http://winipulator.blogspot.com/2010/10/how-to-read-and-write-exfat-flash.html
#   - Source: http://www.tannerjepsen.com/posts/exfat-fuse-module-for-ubuntu-with-readwrite-support
#
#################################################################################################################
#
# Once you have performed the steps outlined above... with the exception of the last line:
# Here's a simple Bash script (below) to help you to connect to your media source.
# You'll want to make this file executable, and it can be stored anywhere you like...
# Place it in /usr/bin if you want to call it up from any location;
# I store it in ~/scripts which makes it easy to quickly edit if needed (see below...)
#    $ chmod 755 exfat.sh
#
# MAKE SURE TO CHANGE /dev/sdd TO THE APPROPRIATE DRIVE LISTING THAT'S ASSOCIATED WITH YOUR MEDIA DEVICE.
#
# IN THE CODE BELOW, MAKE SURE TO CHANGE /dev/sdd TO THE APPROPRIATE DRIVE LISTING FOR YOUR DEVICE.
# IT MIGHT HELP YOU TO FIND YOUR DEVICE IF YOU USE THE FOLLOWING TWO COMMANDS:
#   $ ls /dev
#   $ sudo fdisk -l

# Mount the media device and cd to that device
#sudo mount -t exfat-fuse /dev/sdd /media/exfat/
#cd /media/exfat

# To unmount your media device, use the following command:
#   $ sudo umount /media/exfat

exit 0
