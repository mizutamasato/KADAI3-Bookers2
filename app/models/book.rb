class Book < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  
  validates :title, presence: true
  validates :body, {presence: true, length: { maximum: 200 }}
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
    end
  end
end
 