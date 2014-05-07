require 'childprocess'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :ci => ['checkout', 'install', 'spec']

task :checkout do
  sh %{git submodule update --remote --init} do |ok, res|
    raise "Submodule update failed with status #{res.exitstatus}" unless ok
  end
end

task :install => ['api:install', 'web:install']

namespace :api do
  task :install do
    Bundler.with_clean_env do
      proc = ChildProcess.build('bundle', 'install')
      proc.io.inherit!
      proc.cwd = './api'
      proc.start
      proc.wait
      raise "bundle install exited with status #{proc.exit_code}" unless proc.exit_code == 0
    end
  end
end

namespace :web do
  task :install do
    proc = ChildProcess.build('npm', 'install')
    proc.io.inherit!
    proc.cwd = './web'
    proc.start
    proc.wait
    raise "npm install existed with status #{proc.exit_code}" unless proc.exit_code == 0
  end
end
