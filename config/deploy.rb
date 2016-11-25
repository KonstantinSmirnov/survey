# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'survey'
set :repo_url, 'git@github.com:KonstantinSmirnov/survey.git'
set :rbenv_ruby, '2.3.1'
set :rbenv_type, :user # or :system, depends on your rbenv setup

set :user,  'deployer'

# do not ask password on a local mashine when deploy
#set :ssh_options, {:forward_agent => true}

set :puma_threads,    [4, 16]
set :puma_workers,    0

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, false  # Change to false when not using ActiveRecord

set :branch, ENV['BRANCH'] || :master
## Defaults:
# set :scm,           :git
# set :branch,        :master
# set :format,        :pretty
# set :log_level,     :debug
# set :keep_releases, 5

#Set up for databases synchronizing
set :sync_directories, ["public/system"]
set :sync_backups, 3
set :db_file, "database.yml"
set :db_drop, '--drop' # drop database (rewrites everything)

## Linked Files & Directories (Default None):
set :linked_files, %w{.env config/database.yml config/secrets.yml}
set :linked_dirs, %w{public/system}
# set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  # desc "Make sure local git is in sync with remote."
  # task :check_revision do
  #   on roles(:app) do
  #     unless `git rev-parse HEAD` == `git rev-parse origin/master`
  #       puts "WARNING: HEAD is not the same as origin/master"
  #       puts "Run `git push` to sync changes."
  #       exit
  #     end
  #   end
  # end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  desc 'Runs rake db:seed'
  task :seed => [:set_rails_env] do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:seed"
        end
      end
    end
  end

  desc 'Runs rake db:reset'
  task :reset => [:set_rails_env] do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:reset"
          execute "rm -rf #{shared_path}/public/system/*"
        end
      end
    end
  end

  desc "No ActiveRecord override"
  task :migrate do
    p "do not migrate!"
  end

  desc "Generate error 500 file which should be available even if rails app is down"
  task :generate_500_html do
   on roles(:web) do |host|
     public_500_html = File.join(release_path, "public/500.html")
     execute :curl, "-k", "http://#{host.hostname}/500", "> #{public_500_html}"
   end
  end

  #before :starting,   :check_revision
  after  :finishing,   :compile_assets
  after  :finishing,   :cleanup
  after  :finishing,   :generate_500_html
  #after  :finishing,  :restart

end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma

# =============ORIGINAL=FILE==========================

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
