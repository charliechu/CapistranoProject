set :application, "CapistranoDemo"
set :repository,  "git@github.com:charliechu/CapistranoProject.git"
set :branch, "master"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "46.51.240.22"                          # Your HTTP server, Apache/etc
role :app, "46.51.240.22"                          # This may be the same as your `Web` server
role :db,  "46.51.240.22", :primary => true # This is where Rails migrations will run
role :db,  "46.51.240.22"

set :user, "apps"
set :deploy_to, "home/apps/CapistranoProject"

set :use_sudo, false
set :run_method, :run



# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end