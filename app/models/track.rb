class Track < ActiveRecord::Base
  LISTINGS = %w(REGULAR BONUS)
  validates :name, presence: true
  validates :listing, presence: true, inclusion: LISTINGS
  belongs_to :album
  has_one :author, through: :album, source: :band
  has_many :notes

  def album_name
    album.name
  end

  def author_name
    author.name
  end
end
