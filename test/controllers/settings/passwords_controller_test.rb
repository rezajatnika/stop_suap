require 'test_helper'

class Settings::PasswordsControllerTest < ActionController::TestCase
  def setup
    @user = users(:theuser)
    UserSession.create(@user)
  end

  test 'should change password' do
    post :create, user: {
      current_password: 'asdqwe123',
      new_password: 'asdqwe321',
      new_password_confirmation: 'asdqwe321'
    }
    assert_response 302
  end
end
