require 'test_helper'

class MockupsControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response 200
  end

  test 'should get posts' do
    get :posts
    assert_response 200
  end
end
