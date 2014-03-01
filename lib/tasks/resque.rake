require 'resque/tasks'

namespace :resque do
  puts 'Loading Rails environment for Resque'
  task :setup => :environment do
    ENV['QUEUE'] = '*' if ENV['QUEUE'].blank?
    Resque.before_fork = Proc.new { ActiveRecord::Base.establish_connection }
  end
end
