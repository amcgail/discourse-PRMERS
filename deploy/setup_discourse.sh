# the first argument should be the path of the private key
export PRIVATE_KEY=

sudo apt install docker.io git python3 python3-pip
python3 -m pip install virtualenv

sudo -s
git clone https://github.com/discourse/discourse_docker.git /home/ubuntu/PRMERS-discourse
cd /var/discourse
chmod 700 containers

./discourse-setup

# essentially just running the build-and-deploy command
cd /home/ubuntu
git clone git@github.com:amcgail/discourse-PRMERS.git PRMERS-plugins
cd PRMERS-plugins
bash deploy/after_pull.sh