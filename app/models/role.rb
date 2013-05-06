class Role < ActiveRecord::Base
  belongs_to :movie
  belongs_to :actor

  validates :character_name, presence: true
  validates :movie, presence: true
  validates :actor, presence: true
end
