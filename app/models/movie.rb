class Movie < ActiveRecord::Base
  belongs_to :jar

  validates :title, presence: true
end