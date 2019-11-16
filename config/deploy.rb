set :application, "softfocus"
set :repo_url, 'git@github.com:jarthod/softfocus.git'

set :deploy_to, '/home/deploy/softfocus'

# Default value for :log_level is :debug
set :log_level, :info

# Default value for :linked_files is []
# set :linked_files, %w{db/production.sqlite3}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on(roles :app) { execute :touch, release_path.join('tmp/restart.txt') }
  end

  after :publishing, :restart

end
