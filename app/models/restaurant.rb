class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reviews,
           -> { extending WithUserAssociationExtension },
           dependent: :destroy

  validates :name, length: { minimum: 3 }, uniqueness: true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def belongs_to_currrent_user?(current_user)
    user_id == current_user.id
  end

  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating)
  end
end
