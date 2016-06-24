set -o errexit
set -o xtrace

cd "$(dirname "$0")"

dirname=$(pwd)

sudo systemctl disable tbbuttonsd

sudo ln -snf "$dirname/restart" /apps/home
sudo ln -snf "$dirname/startup" /apps/startup

sudo shutdown -r now
