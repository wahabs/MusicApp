class Track < ActiveRecord::Base
  validates :listing, presence: true
  belongs_to :album
end
