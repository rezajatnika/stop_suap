require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response 200
  end

  test 'should create user' do
    assert_difference('User.count') do
      post :create, user: {
        email: 'example@mail.com',
        password: 'asdqwe123',
        password_confirmation: 'asdqwe123'
      }
    end
    assert_redirected_to root_path
  end

  test 'should not create user' do
    assert_no_difference('User.count') do
      post :create, user: {
        email: '',
        password: 'invalid',
        password_confirmation: 'inv4lid'
      }
    end
    assert_template 'new'
  end
end
