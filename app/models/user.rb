class User < ApplicationRecord
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  # user.liked_posts で user が「いいね!」しているメッセージの一覧を取得できるようになる
  has_many :liked_posts, through: :likes, source: :post

  has_many :followed_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followed, through: :followed_relationships
  has_many :follower_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  mount_uploader :user_img, ImgUploader
  

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

  #フォローしているかを確認
  def following?(user)
    followed_relationships.find_by(followed_id: user.id)
  end

  #フォローする
  def follow(user)
    followed_relationships.create!(followed_id: user.id)
  end

  #フォローを外す
  def unfollow(user)
    followed_relationships.find_by(followed_id: user.id).destroy
  end

end
