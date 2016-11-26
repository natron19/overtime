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


AuditLog.create!(user_id: @user1.id, status: 0, start_date: (Date.today - 6.days))
AuditLog.create!(user_id: @user1.id, status: 0, start_date: (Date.today - 13.days))
AuditLog.create!(user_id: @user1.id, status: 0, start_date: (Date.today - 20.days))

puts "30 audit logs added for user 1"

10.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} Salvia iceland biodiesel tacos mumblecore. Live-edge normcore activated charcoal squid, listicle ramps letterpress readymade try-hard marfa flannel kinfolk small batch pickled. Kitsch disrupt readymade, brunch godard butcher chia flannel ugh vinyl church-key woke.", user_id: @user1.id, overtime_request: 2.5)
end
10.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} Salvia iceland biodiesel tacos mumblecore. Live-edge normcore activated charcoal squid, listicle ramps letterpress readymade try-hard marfa flannel kinfolk small batch pickled. Kitsch disrupt readymade, brunch godard butcher chia flannel ugh vinyl church-key woke.", user_id: @user1.id, overtime_request: 2.5, status: 'approved')
end
5.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} Salvia iceland biodiesel tacos mumblecore. Live-edge normcore activated charcoal squid, listicle ramps letterpress readymade try-hard marfa flannel kinfolk small batch pickled. Kitsch disrupt readymade, brunch godard butcher chia flannel ugh vinyl church-key woke.", user_id: @user1.id, overtime_request: 2.5, status: 'rejected')
end
puts "30 posts added"

