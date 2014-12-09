require 'redmine'

Resque.redis.namespace = "#{Rails.application.class.parent_name.downcase}_#{Rails.env}"

ActionDispatch::Callbacks.to_prepare do
  require 'redmine_resque'
end

Redmine::Plugin.register :redmine_resque do
  name        'Resque for Redmine'
  description 'Background jobs for Redmine'
  author      'Undev'
  version     '0.0.3'
  url         'https://github.com/Undev/redmine_resque'

  requires_redmine :version_or_higher => '2.1'

  menu :top_menu, 'Resque', 'resque', :if => Proc.new { User.current.admin? }
end
