class Post < ApplicationRecord
  belongs_to :user

  enum genre: {
    others: 0,
    surf: 1,
    skate: 2,
    snow: 3,
  }
end
