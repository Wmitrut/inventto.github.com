require "rvm/capistrano"
require 'bundler/capistrano'

set :rvm_bin_path, "/usr/local/rvm/bin"
set :bundle_flags,               "--deployment"
set :application,                "inventto.github.com"
set :hostname,                   "invent.to"
set :deploy_to,                  "/var/www/apps/inventto"
set :rvm_type, :system
set :rails_env,                  "production"
set :user,                       "root"
set :scm,        :git
set :normalize_asset_timestamps, false
set :repository, "git@github.com:inventto/#{application}.git"
  set :branch,     "master"

role :app, hostname
role :db,  hostname, :primary => true

namespace :deploy do
  desc "Stopping thin" do
    run "cd #{current_path} && thin stop"
  end
  desc "Starting thin"
  task :start  do
    run "cd #{current_path} && bundle exec thin start -p 3333 -e production -d"
  end
#  after 'deploy:update_code' do
#     run "cd #{release_path}; RAILS_ENV=production rake assets:precompile"
#  end
end

