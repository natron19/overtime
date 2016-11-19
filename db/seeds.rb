@user1 = User.create(email: "test@example.com", password: "password", password_confirmation: "password", first_name: "Jon", last_name: "Snow")

@user2 = AdminUser.create(email: "admin@example.com", password: "password", password_confirmation: "password", first_name: "Admin", last_name: "Smith")

puts "2 users created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user1.id)
end
puts "100 posts added"

50.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user2.id)
end
puts "50 posts added"
