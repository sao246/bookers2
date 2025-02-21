class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, presence: true, if: :creating?
  validates :title, presence: true, if: :editing?
  
  validates :body, presence: true, if: :creating?
  validates :body, presence: true, if: :editing?
  
  def get_book
    if title.attached?
      title
    end
  end

  def creating?
    new_record?
  end
  
  def editing?
    !new_record?
  end

end

