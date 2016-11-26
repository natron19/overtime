class ApplicationMailer < ActionMailer::Base
  default from: "mailer@natron-overtime.herokuapp.com"
  layout 'mailer'
end
