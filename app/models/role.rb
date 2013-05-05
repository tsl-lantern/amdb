class Role < ActiveRecord::Base
  belongs_to :movie
  belongs_to :actor

  validates :movie, presence: true
  validates :actor, presence: true
end
