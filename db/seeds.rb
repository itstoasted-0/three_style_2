name = "reo"
email = "aaa@aaa.aaa"
password = "aaaaaa"
User.create!(name: name, email: email, password: password)

# ユーザー初期データ
user1 = User.create!(name: "love", email: "a@example.com", password: "password")
user2 = User.create!(name: "mira", email: "b@example.com", password: "password")
user3 = User.create!(name: "loa", email: "c@example.com", password: "password")

post1 = user2.posts.create!(genre: 1, content: "aaa")
post2 = user1.posts.create!(genre: 2, content: "bbb")
post3 = user3.posts.create!(genre: 3, content: "ccc")
post4 = user3.posts.create!(genre: 0, content: "ddd")
post5 = user1.posts.create!(genre: 1, content: "eee")

post1.likes.create!(user_id: user1.id)
post1.likes.create!(user_id: user3.id)
post2.likes.create!(user_id: user2.id)
post3.likes.create!(user_id: user1.id)
post4.likes.create!(user_id: user1.id)
post4.likes.create!(user_id: user2.id)
post5.likes.create!(user_id: user3.id)

puts "初期データの投入に成功しました！"
