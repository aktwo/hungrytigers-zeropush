class ListingMailer < ActionMailer::Base
  default from: "freefood.princeton@gmail.com"

  def listing_email(subject, body)
    @body = body
    mail(to:"freefood.princeton@gmail.com", subject: subject)
  end
end
