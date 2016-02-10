class ApplicationMailer < ActionMailer::Base
  default from: "ctt.notifier@gmail.com"
  layout 'mailer'
end
