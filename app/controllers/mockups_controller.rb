class MockupsController < ApplicationController
  layout 'masthead', only: [:index, :statistic]

  def index
    @latest_stories = Story.order(created_at: :desc).take(5)
    @total_amount = Story.where(paid: 1).map {|a| a.amount}.reduce(:+) 
  end

  def statistic
    
  end

  def posts
  end

  def login
  end

  def signup
  end
end
