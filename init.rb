require 'redmine'

WORKER_SCHEDULE_FILE = File.join(Rails.root, 'config', 'worker_schedule.yml')

Resque.redis.namespace = "#{Rails.application.class.parent_name.downcase}_#{Rails.env}"
Resque.schedule        = YAML.load_file(WORKER_SCHEDULE_FILE) if File.file?(WORKER_SCHEDULE_FILE)

ActiveSupport::Dependencies.autoload_paths.push File.expand_path('../app/jobs', __FILE__)

ActionDispatch::Callbacks.to_prepare do
  require 'redmine_resque'
end

Redmine::Plugin.register :redmine_resque do
  name 'Redmine Resque Plugin'
  description 'This plugin adds the Resque gem for managing background jobs in Redmine.'
  author 'Restream'
  version '0.1.4'
  url 'https://github.com/Restream/redmine_resque'

  requires_redmine version_or_higher: '2.1'

  menu :top_menu, 'Resque', :resque_path, if: Proc.new { User.current.admin? }
end

