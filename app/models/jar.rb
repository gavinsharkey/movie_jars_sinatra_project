class Jar < ActiveRecord::Base
  has_many :movies
  belongs_to :user
end