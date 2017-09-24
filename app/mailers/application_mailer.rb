class ApplicationMailer < ActionMailer::Base
  default from: ENV['gmail_email']
  layout 'mailer'

  def email_supervisor
    mail(to: "matthew.devoe@gmail.com", subject: 'Import Successful')
  end

end
