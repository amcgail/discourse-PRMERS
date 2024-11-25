# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

set :application, "PRMERS"
set :repo_url, "git@github.com:amcgail/discourse-PRMERS.git"

# set the directory for the plugins
set :deploy_to, "/home/ubuntu/PRMERS-plugins"