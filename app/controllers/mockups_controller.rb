class MockupsController < ApplicationController
  layout 'masthead', only: :index

  def index
    @latest_stories = Story.order(created_at: :desc).take(5)
    @total_amount = Story.where(paid: 1).map {|a| a.amount}.reduce(:+) 
  end

  def posts
  end

  def login
  end

  def signup
  end
end
