require 'redmine'

Resque.redis.namespace = 'redmine_resque'

ActionDispatch::Callbacks.to_prepare do
  require 'redmine_resque'
end

Redmine::Plugin.register :redmine_resque do
  name        'Resque for Redmine'
  description 'Background jobs for Redmine'
  author      'Undev'
  version     '0.0.1'
  url         'https://github.com/Undev/redmine_resque'

  requires_redmine :version_or_higher => '2.1'

  menu :top_menu, 'Resque', '/resque', :if => Proc.new { User.current.admin? }
end
