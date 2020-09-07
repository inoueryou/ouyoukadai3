class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  has_many :follower, class_name: 'Relationship', foreign_key: 'followed_id'
  has_many :follows, class_name: 'Relationship', foreign_key: 'follower_id'
  has_many :followings, through: :follows, source: :followed
  has_many :followers, through: :follower, source: :follower
  attachment :profile_image, destroy: false
# ユーザーをフォローする
  def follow(other_user)
     self.follows.create!(followed_id: other_user)
  end

  def unfollow(other_user)
     self.follows.find_by(followed_id: other_user).destroy
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, length: {maximum: 20, minimum: 2}
  validates :introduction, length: {maximum: 50}
end
