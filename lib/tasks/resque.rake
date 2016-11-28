require 'resque/tasks'
require 'resque/scheduler/tasks'

namespace :resque do
  puts 'Loading Rails environment for Resque'

  task :setup => :environment do
    require 'resque'
    require 'resque-scheduler'

    ENV['QUEUE']       = '*' if ENV['QUEUE'].blank?
    Resque.before_fork = Proc.new { ActiveRecord::Base.establish_connection }
  end
end
