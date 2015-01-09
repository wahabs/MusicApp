class Note < ActiveRecord::Base
  validates :body, presence: true
  validates :name, presence: true
  belongs_to :user
  belongs_to :track

  def author_email
    user.email
  end
end
