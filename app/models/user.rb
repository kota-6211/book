class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile

  def get_profile(width, height)
    unless profile.attached?
      file_path = Rails.root.join('app/assets/images4/essiii.jpg')
      profile.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile.variant(resize_to_limit: [width, height]).processed
  end
end
