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
    assert_difference('Story.count') do
      post :create, story: {
        title: 'Title of The Title',
        content: 'Summary of the story.',
        category_id: categories(:tax).id,
        paid: 'paid',
        amount: 25000,
        event_date: Date.today,
        name: 'Reza Jatnika',
        email: 'reza@rakarsa.com',
        location_attributes: {
          province_id: provinces(:westjava).id,
          city_id: cities(:bandung).id
        }
      }
    end

    story = assigns(:story)
    assert_redirected_to story
  end

  class LoggedInUser < StoriesControllerTest
    def setup
      UserSession.create(users(:theuser))
    end

    test 'should post story' do
      assert_difference('Story.count') do
        post :create, story: {
          title: 'Title of The Title',
          content: 'Summary of the story.',
          category_id: categories(:tax).id,
          paid: 'paid',
          amount: 25000,
          event_date: Date.today,
          location_attributes: {
            province_id: provinces(:westjava).id,
            city_id: cities(:bandung).id
          }
        }
      end

      story = assigns(:story)
      assert_equal users(:theuser).id, story.user_id
      assert_equal users(:theuser).email, story.email
      assert_redirected_to story
    end
  end
end
