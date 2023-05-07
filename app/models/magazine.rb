class Magazine < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def self.search_for(content, method)
    if method == 'perfect'
      Magazine.where(title: content)
    elsif method == 'forward'
      Magazine.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Magazine.where('title LIKE ?', '%'+content)
    else
      Magazine.where('title LIKE ?', '%'+content+'%')
    end
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
