# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

set :application, "Discourse"
set :repo_url, "git@github.com:discourse/discourse-docker.git"

# set the directory for the plugins
set :deploy_to, "/home/ubuntu/PRMERS-discourse"