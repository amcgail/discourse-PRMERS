export $pluginD=/home/ubuntu/PRMERS-plugins
export $discourseD=/home/ubuntu/PRMERS-discourse

cd $pluginD
python deploy/after_pull.py

sudo cp $pluginD/deploy/app.yml $discourseD/containers/app.yml

cd $discourseD
./launcher rebuild app