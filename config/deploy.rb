# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, "softfocus"
set :repo_url, 'git@bitbucket.org:adrienjarthon/softfocus'

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
    on roles(:app) do
      execute "sudo restart softfocus || sudo start softfocus"
    end
  end

  after :publishing, :restart

end
