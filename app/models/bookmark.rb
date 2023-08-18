class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  PRIORITY_OPTIONS = [1, 2, 3].freeze
  validates :movie_id, uniqueness: { scope: :list_id }
  validates :comment, length: { minimum: 6 }
  validates :priority, inclusion: { in: PRIORITY_OPTIONS }
end
