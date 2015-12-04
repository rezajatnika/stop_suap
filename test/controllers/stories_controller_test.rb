require 'test_helper'

class StoriesControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response 200
  end

  test 'should get index' do
    get :index
    assert_response 200
    assert_not_nil assigns(:stories)
  end

  test 'should post story anonymously' do
    # ...
  end

  class LoggedInUser < StoriesControllerTest
    test 'should post story' do
      # ...
    end
  end
end
