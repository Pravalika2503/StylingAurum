class Jewel < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :reservations

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
  validates :product_code, presence: true
  validates :jewel_type, presence: true
  validates :metal_type, presence: true
  validates :stone_type, presence: true
  validates :weight, presence: true
  validates :stone_weight, presence: true
  validates :purity, presence: true
  validates :pieces_number, presence: true
  validates :listing_name, presence: true, length: {maximum: 50}
  validates :summary, presence: true, length: {maximum: 500}
  validates :address, presence: true
end
  