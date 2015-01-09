class Album < ActiveRecord::Base
  RECORDINGS = %w(LIVE STUDIO)

  validates :name, presence: true
  validates :recording, presence: true, inclusion: RECORDINGS
  belongs_to :band
  has_many :tracks, dependent: :destroy

  def band_name
    band.name
  end

end
