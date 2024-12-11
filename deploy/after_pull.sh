export pluginD=/home/ubuntu/PRMERS-plugins
export discourseD=/home/ubuntu/PRMERS-discourse

# Python Script

if [ ! -d /home/ubuntu/venv ]; then
    python3 -m virtualenv /home/ubuntu/venv
fi
source /home/ubuntu/venv/bin/activate

cd $pluginD
python deploy/after_pull.py

# After Python

sudo cp $pluginD/deploy/app.yml $discourseD/containers/app.yml

cd $discourseD
sudo ./launcher rebuild app
