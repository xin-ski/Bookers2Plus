class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20}
  validates :introduction, length: { maximum: 50 }

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :profile_image


  def get_profile_image(width, height)
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end