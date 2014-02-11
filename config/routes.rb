require 'resque/server'

RedmineApp::Application.routes.draw do
  mount Resque::Server.new, :at => '/resque', constraints: RedmineResque::AdminConstraint.new
end
