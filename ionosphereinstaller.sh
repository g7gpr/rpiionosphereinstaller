#!/bin/bash
cd ..

if [ -d "aprs" ] 
then
	echo "Info : aprs directory already exists"
else
	mkdir aprs
fi

cd aprs
echo "Updates and Upgrades"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install aptitude -y
sudo aptitide install -y rng-tools libsamplerate-dev libatlas3-base libgfortran5 -y
sudo aptitude install -y python3-pip python3-flask sox git build-essential libtool cmake usbutils libusb-1.0-0-dev -y 
sudo aptitude install -y rng-tools libsamplerate-dev libatlas3-base libgfortran5 -y
echo "Install rtl-sdr"
git clone https://github.com/osmocom/rtl-sdr.git
cd rtl-sdr
rm -rf build
mkdir build
cd build
cmake -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON ../
sudo make install
sudo ldconfig
cd ..
cd ..

echo "Blacklist"
cat > rtlsdr-blacklist.conf << EOF
blacklist dvb_usb_rtl28xxu
blacklist rtl2832
blacklist rtl2830
blacklist dvb_usb_rtl2832u
blacklist dvb_usb_v2
blacklist dvb_core
EOF
sudo rm /etc/modprobe.d/rtlsdr-blacklist.conf
sudo mv rtlsdr-blacklist.conf /etc/modprobe.d/rtlsdr-blacklist.conf

echo "Install multimon-ng" 
git clone https://github.com/EliasOenal/multimon-ng
cd multimon-ng
rm -rf build
mkdir build
cd build
cmake ..
make 
sudo make install
cd ..
cd ..

echo "Install go"
mkdir go
cd go
wget https://dl.google.com/go/go1.16.6.linux-armv6l.tar.gz
sudo tar -C /usr/local -xzf go1.16.6.linux-armv6l.tar.gz
PATH=$PATH:/usr/local/go/bin
GOPATH=$HOME/go
echo $PATH
echo $HOME
cd ..

git clone https://github.com/cceremuga/ionosphere
cd ionosphere
go build
#go install
if [ -d "logs" ] 
then
	echo "Info : logs directory already exists"
else
	mkdir logs
fi
sudo cp ./ionosphere /usr/local/bin/
cd ..
