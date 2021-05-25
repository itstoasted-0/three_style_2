class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :likes, dependent: :destroy
  # post.liked_users で post を「いいね!」しているユーザーの一覧を取得できるようになる
  has_many :liked_users, through: :likes, source: :user

  enum genre: {
    others: 0,
    surf: 1,
    skate: 2,
    snow: 3,
  }

  # post を user が「いいね！」しているときは「true」，「いいね」していないときは「false」
  def liked_by?(user)
    likes.any? { |like| like.user_id == user.id }
  end
end
