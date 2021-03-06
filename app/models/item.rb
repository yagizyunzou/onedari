class Item < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :url, presence: true
  validates :price, presence: true, numericality: true
  mount_uploader :image, ImageUploader
end
