@user1 = User.create!(email: "user@example.com",
                    password: "password",
                    password_confirmation: "password",
                    first_name: "Jon",
                    last_name: "Snow",
                    phone: 5555555555)

@user2 = AdminUser.create!(email: "admin@example.com",
                        password: "password",
                        password_confirmation: "password",
                        first_name: "Admin",
                        last_name: "Smith",
                        phone: 5555555555)

puts "2 users created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user1.id, overtime_request: 2.5)
end
puts "100 posts added"

30.times do |audit_log|
  AuditLog.create!(user_id: @user1.id, status: 0, start_date: (Date.today - 6.days))
end

puts "30 audit logs added for user 1"
