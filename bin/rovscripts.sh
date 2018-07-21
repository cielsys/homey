####################################################
# Critical sysinfo BBBlue-debian
user: debian
ps: temppwd
host->usbeth 192.168.7.2
host->homeWifi->BBBlue wifi 192.168.1.102 # 102 reserved on wifi/router
Cloud9 http://192.168.7.2:3000/ide.html
Wifi AP:BeagleBone-XXXX pw:BeagleBone

####################################################
# Critical sysinfo OpenROV 2.8
user: rov
ps: OpenROV
host->eth 192.168.254.1
host->usbeth 192.168.7.2
Dashboard http://192.168.254.1
Cockpit http://192.168.254.1:8080/#
Cloud9 http://192.168.254.1:3131/#

####################################################
# Paths
 Z:\opt\openrov\cockpit\src\static\js\libs
 /opt/openrov/cockpit/src/static/js/libs

####################################################
# MAC, IP, WAP
ATTW2FfTdS wifi_f45eab5499b6_41545457324666546453_managed_psk #cache
integrity  wifi_f45eab5499b6_696e74656772697479_managed_p
####################################################
# Good info on BBB mount fs etc
# https://hifiduino.wordpress.com/2014/03/19/beaglebone-black-accessing-usd-and-usb-storage/


########################################################
##=========== OpenROV Shell scripts ====================


################################################
# Mount PC samba drive on ROV
mount -t cifs //192.168.83/D$ /mnt/DDrive -o username=WORKGROUP/cl
mount -t cifs //192.168.83/D -o username=cl,password=Ciel99 /mnt/DDrive

# Worked once on the train (VM NAT - TrainWifiAP)
sudo mount -t cifs //10.61.40.129/DDrive /mnt/DDrive -o user=cl

################################################
# Get the names of the the disks and partitions
fdisk -l

# When booted from uSD card I get something like
# uSD:
Disk /dev/mmcblk0: 29.7 GiB
Device         Boot Start     End Sectors  Size Id Type
/dev/mmcblk0p1 *     2048 3481599 3479552  1.7G 83 Linux
# AND  internal eMMC
Disk /dev/mmcblk1: 3.6 GiB
Device         Boot Start     End Sectors  Size Id Type
/dev/mmcblk1p1 *     2048 7471103 7469056  3.6G 83 Linux

################################################
# Mount the internal eMMC flashdrive (disk mmcblk1 partition p1)
# when booted from uSD card
# mount -t Linux (fstype) not needed, in my experience
mkdir -p /mnt/internalFD
mount /dev/mmcblk1p1 /mnt/internalFD

################################################
# Mount a USB drive
# when booted from uSD card
# mount -t vfat (fstype) may need to be figured out
mkdir -p /mnt/usbFD
mount -t vfat /dev/sda1 /mnt/usbFD

# unmounting -l is lazy and maybe not safe, for when umount fails
umount /mnt/internalFD -l

###############################################
# Automount with fstab
mount -a

####################################################
# Resizing uSD partition
# https://elinux.org/Beagleboard:BeagleBoneBlack_Debian#Expanding_File_System_Partition_On_A_microSD
cd /opt/scripts/tools/
git pull || true
sudo ./grow_partition.sh
sudo reboot

####################################################
# Establish DNS if the DHCP doesn't do it
echo nameserver 4.2.2.4 >> /etc/resolv.conf

route add default gw 192.168.7.1

####################################################
# Connect wifi(client)
connmanctl
connmanctl> tether wifi off #(not really necessary on latest images)
connmanctl> enable wifi #(not really necessary)
connmanctl> scan wifi
connmanctl> services #outputs wifi AP names
connmanctl> agent on
connmanctl> connect wifi_f45eab5499b6_696e74656772697479_managed_psk
connmanctl> quit

####################################################
# Enable wifi AP /hostapd
systemctl list-units
systemctl status bb-w118xx-wlan0
systemctl disable  bb-w118xx-wlan0
systemctl stop  bb-w118xx-wlan0

####################################################
# Timezones
timedatectl list-timezones
timedatectl status
timedatectl set-timezone America/Los_Angeles

####################################################
# Linux logging
journalctl -u orov-cockpit.service

####################################################
# bashrc
shopt -s histverify #expand history but do not execute
alias ll='ls -alF'


####################################################
# Install node latest
# https://github.com/nodesource/distributions
# Using Ubuntu
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get install -y nodejs

# Using Debian, as root
curl -sL https://deb.nodesource.com/setup_9.x | bash -
apt-get install -y nodejs

# Test node installation
curl -sL https://deb.nodesource.com/test | bash -

####################################################
# Install new Arduino build (from within BBB)
# https://forum.openrov.com/t/updating-the-arduino-firmware-code/2859
sudo /opt/openrov/cockpit/linux/arduino/firmware-installfromsource.sh

####################################################
# Stream video
# http://embeddedtweaks.com/beaglebone-usb-webcam-mpeg-streamer-installation-tutorial/
sudo apt-get install gstreamer1.0-plugins-*
./mjpg_streamer -i "./input_uvc.so" -o "./output_http.so -w ./www"
~/mjpg-streamer$ sudo ./mjpg_streamer -i "./input_uvc.so -d /dev/video0  -n" -o "./output_http.so -p 5600"


ffmpeg -hide_banner -i ./bars_100.avi -vcodec mjpeg -f mjpeg udp://127.0.0.1:5600
ffmpeg -hide_banner -re -stream_loop 100 -framerate 10  -f image2  -i ./goose.jpg  -vcodec mjpeg -f mjpeg udp://127.0.0.1:5600

This one fucking worked on windows!!!
ffmpeg -hide_banner -re -stream_loop 10 -i bars_100.avi  -vcodec mpeg4 -f mpegts udp:192.168.1.122:5600
VLC: udp://@:5600

And this
ffmpeg -hide_banner -re -stream_loop 1000 -f image2 -i goose.jpg  -vcodec mpeg4 -f mpegts udp:192.168.1.122:5600

"C:\Program Files (x86)\VideoLAN\VLC\vlc.exe"  --demux=mjpeg
"C:\Program Files (x86)\VideoLAN\VLC\vlc.exe"  --demux=avformat
####################################################
# Start BBB ArduPilot /home/debian/ardu/bin
sudo ./ardurover -C udp:192.168.1.122:14550

####################################################
####################################################
# Windows Commands
####################################################
#####################################################


####################################################
# PCRepo bare pull from ROV bare
D:
cd D:\AAAProjects\AAAopenROV\Image\PCRepo\cockpit.git
git fetch ROV_uSD0 Feat_FVLogger:Feat_FVLogger

