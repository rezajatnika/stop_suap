class Comment < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }
  belongs_to :story

  validates :body, presence: true
end
