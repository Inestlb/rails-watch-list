class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true, uniqueness: true
  validates :poster_url, presence: true, uniqueness: true
  validates :rating, presence: true

end
