class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reviews,
           -> { extending WithUserAssociationExtension },
           dependent: :destroy

  validates :name, length: { minimum: 3 }, uniqueness: true

  def belongs_to_currrent_user?(current_user)
    user_id == current_user.id
  end

  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating)
  end
end
