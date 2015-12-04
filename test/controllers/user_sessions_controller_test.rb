require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response 200
  end

  test 'should create user session' do
    post_user_session
    assert user_session = UserSession.find
    assert_equal users(:theuser), user_session.user
    assert_redirected_to root_path
  end

  test 'should not create user session' do
    post :create, user_session: { email: 'theuser', password: 'invalid' }
    assert_nil UserSession.find
    assert_template 'new'
  end

  test 'should destroy user session' do
    post_user_session
    delete :destroy
    assert_nil UserSession.find
    assert_redirected_to root_path
  end

  private

  def post_user_session
    post :create, user_session: { email: 'user@mail.com', password: 'asdqwe123' }
  end
end
