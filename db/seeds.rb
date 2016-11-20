@user1 = User.create(email: "user@example.com",
                    password: "password",
                    password_confirmation: "password",
                    first_name: "Jon",
                    last_name: "Snow",
                    phone: ENV["TWILIO_TEST_PHONE"])

@user2 = AdminUser.create(email: "admin@example.com",
                        password: "password",
                        password_confirmation: "password",
                        first_name: "Admin",
                        last_name: "Smith",
                        phone: ENV["TWILIO_TEST_PHONE"])

puts "2 users created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user1.id, overtime_request: 2.5)
end
puts "100 posts added"

50.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user2.id, overtime_request: 1.5)
end
puts "50 posts added"
