require File.expand_path('../../test_helper', __FILE__)

class ResqueTest < Redmine::IntegrationTest
  fixtures :enumerations, :users, :email_addresses,
    :roles,
    :member_roles,
    :members,
    :enabled_modules

  def test_admin_can_open_resque_ui
    log_user('admin', 'admin')
    get '/resque'
    assert_response 302
  end

  def test_user_cannot_open_resque_ui
    log_user('jsmith', 'jsmith')
    get '/resque'
    assert_response 404
  end

  def test_anonymous_cannot_open_resque_ui
    User.current = User.anonymous
    get '/resque'
    assert_response 404
  end
end
