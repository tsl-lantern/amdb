class Movie < ActiveRecord::Base
  belongs_to :director
  has_many :roles
  has_many :actors, through: :roles
  has_many :votes

  validates :title, presence: true
  validates :director, presence: true
end
