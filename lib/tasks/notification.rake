namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they had overtime or not"
  task sms: :environment do
    #if Time.now.sunday?
      employees = Employee.all
      notification_message = "Please log into the overtime managment dashboard to request overtime or confirm hours: https://natron-overtime.herokuapp.com/ "
      employee.each do |employee|
        SmsTool.send_sems(number: employee.phone, message: notification_message)
      end
    #end

    # send a message that has instructions and a link to log time
    # User.all.each do |user|
    #   SmsTool.send_sms()
    # end
  end

  desc "Sends mail notification to admin users ato inform of overtime requests"
  task manager_email: :environment do
    #iterate over list of pending overtime requests
    #check to see if there are any requests
    #itereate over list of admin users/managers
    # send email to each admin
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end

end
