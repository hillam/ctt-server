class ApplicationMailer < ActionMailer::Base
  default from: "ctt_notifier@gmail.com"
  layout 'mailer'
end
