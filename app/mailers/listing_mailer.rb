class ListingMailer < ActionMailer::Base
  def listing_email(subject, body, debug, name)
    @body = body
    if debug
      mail(from: name + " <freefood.princeton@gmail.com>", to:"freefood.princeton@gmail.com", subject: ("[FreeFood] " + subject))
    else
      mail(from: name + " <freefood.princeton@gmail.com>", to:"freefood@princeton.edu", subject: subject)
    end
  end
end
