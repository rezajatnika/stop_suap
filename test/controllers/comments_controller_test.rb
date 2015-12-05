require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  def setup
    UserSession.create(users(:theuser))
    @story = stories(:first)
  end

  test 'should post comment' do
    assert_difference('Comment.count') do
      post :create, comment: { body: 'Test' }, story_id: @story.id, format: :js
    end
  end
end
