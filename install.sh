set -o errexit
set -o xtrace

sudo apt-get update && sudo apt-get install -y git libncurses5-dev libncursesw5-dev

cd ~

wget http://www.open.com.au/mikem/bcm2835/bcm2835-1.17.tar.gz
tar -xvf bcm2835-1.17.tar.gz
(
    cd bcm2835-1.17/
    ./configure
    make
    sudo make check
    sudo make install
)

mkdir Guzunty
(
    cd Guzunty/
    git clone https://github.com/Guzunty/Pi.git
    cd Pi/src/
    cd gz_load
    # remove problematic '-Wl' compilation flag
    sed -i -e 's: -Wl : :g' Makefile
    make
    sudo chmod a+x gz_load
    sudo cp gz_load /usr/bin
    cd ../gzlib/src
    make
    sudo make install
)

# update tingbot-python to get backlight support
sudo pip install tingbot-python==0.5.0

sudo raspi-config --expand-rootfs
sudo shutdown -r now
