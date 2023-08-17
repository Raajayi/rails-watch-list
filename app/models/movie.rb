class Movie < ApplicationRecord
  validates :title, uniqueness: true
  validates :overview, uniqueness: true
end
