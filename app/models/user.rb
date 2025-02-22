class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_one_attached :profile_image
  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end

def login
  @login || self.name || self.email
end
  # このメソッドを追加して、ログインに名前かメールアドレスのいずれかを使えるようにする
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup

    # loginというパラメータでusername（name）かemailを使えるようにする
    if login = conditions.delete(:login)
      # usernameかemailで検索する
      where(conditions).where(["username = :value OR email = :value", { :value => login }]).first
    else
      where(conditions).first
    end
  end