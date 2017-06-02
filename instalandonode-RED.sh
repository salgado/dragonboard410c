# instalando node-RED
sudo apt-get update
#sudo apt-get -y upgrade
#sudo apt-get -y autoremove

sudo apt-get update
sudo apt-get dist-upgrade -u -y
sudo apt-get install -y libpython-dev libpython3-dev python-dev
sudo apt-get install -y arduino-mk arduino
sudo apt-get install -y libmraa-dev libupm-dev libsoc-dev
sudo apt-get install -y python-pip
#sudo apt-get install -y scratch python-pip
pip install spidev #deu erro com setuptools
sudo apt-get clean