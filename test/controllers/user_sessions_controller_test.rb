require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response 200
  end

  test 'should create user session' do
    post :create, user_session: {
      email: 'theuser@email.com',
      password: 'asdqwe123'
    }
    assert user_session = UserSession.find
    assert_equal users(:theuser), user_session.user
    assert_redirected_to root_path
  end

  test 'should not create user session' do
    post :create, user_session: { email: 'theuser', password: 'invalid' }
    assert_nil UserSession.find
    assert_template 'new'
  end
end
