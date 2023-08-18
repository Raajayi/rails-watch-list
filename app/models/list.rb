class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :name, presence: true
  validates :name, uniqueness: true

  def prioritized_bookmarks
    Bookmark.where(list: self).order('priority ASC')
  end
end
