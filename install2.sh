set -o errexit
set -o xtrace

cd "$(dirname "$0")"

sudo apt-get update
sudo apt-get install gdebi-core

(
    git clone http://github.com/tingbot/tingbot-os
    cd tingbot-os/
    make build-deb
    sudo gdebi build/tingbot-os.deb
)

dirname=$(pwd)

ln -snf "$dirname/startup" /apps/home
