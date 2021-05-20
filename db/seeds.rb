user = User.first
Post.create!(genre: 1, content: "aaa", user_id: user.id)
Post.create!(genre: 2, content: "bbb", user_id: user.id)
Post.create!(genre: 3, content: "ccc", user_id: user.id)
puts "初期データの投入に成功しました！"
