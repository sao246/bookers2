class Book < ApplicationRecord
  belongs_to :user

  def get_book
    if title.attached?
      title
    end
  end
  
end
