class ListingMailer < ActionMailer::Base
  default from: "freefood.princeton@gmail.com"

  def listing_email(subject, body, debug)
    @body = body
    if debug
      mail(to:"freefood.princeton@gmail.com", subject: ("[FreeFood] " + subject))
    else
      mail(to:"freefood@princeton.edu", subject: subject)
    end
  end
end
