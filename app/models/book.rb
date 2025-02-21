class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, presence: true
  validates :body, presence: true

  def get_book
    if title.attached?
      title
    end
  end
  
end
