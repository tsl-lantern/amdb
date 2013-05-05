class Director < ActiveRecord::Base
  has_many :movies

  validates :name, presence: true
end
