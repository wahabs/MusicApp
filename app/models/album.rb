class Album < ActiveRecord::Base
  validates :recording, presence: true
  belongs_to :band
  has_many :tracks
end
