class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  def get_book
    if title.attached?
      title
    end
  end
  
end
