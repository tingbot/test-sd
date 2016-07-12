set -o errexit
set -o xtrace

# update tingbot-python to get backlight support
sudo pip install tingbot-python==0.5.0

sudo ln -snf "$dirname/test_routine.tingapp" /apps/startup

sudo shutdown -r now
