class User < ApplicationRecord
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  # user.liked_posts で user が「いいね!」しているメッセージの一覧を取得できるようになる
  has_many :liked_posts, through: :likes, source: :post

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end
