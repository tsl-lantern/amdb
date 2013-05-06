class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :user, presence: true
  validates :movie, presence: true
  validates :user_id, uniqueness: { scope: :movie_id }
  validate :user_cannot_have_more_than_three_votes

  def user_cannot_have_more_than_three_votes
    if self.user.votes.count >= 3
      self.errors.add(:user, "cannot vote more than three times")
    end
  end
end
