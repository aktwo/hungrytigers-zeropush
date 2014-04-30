ActionMailer::Base.smtp_settings = {
    :enable_starttls_auto => true,
    :address        => 'smtp.gmail.com',
    :port           => 587,
    :domain         => 'hungrytigers.herokuapp.com',
    :authentication => :plain,
    :user_name      => 'freefood.princeton@gmail.com',
    :password       => 'freefood333'
  }
