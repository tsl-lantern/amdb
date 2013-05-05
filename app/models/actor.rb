class Actor < ActiveRecord::Base
  has_many :roles
  has_many :movies, through: :roles

  validates :name, presence: true
end
