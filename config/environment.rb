# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Jetpack::Application.initialize!

#Pony.options = {
  #  :via => :smtp,
  #  :via_options => {
#    :address => 'smtp.sendgrid.net',
 #   :port => '587',
 #   :domain => 'heroku.com',
 #   :user_name => ENV['app24067842@heroku.com'],
 #   :password => ENV['g6enfd5m'],
  #  :authentication => :plain,
 #   :enable_starttls_auto => true
#  }
#}

ActionMailer::Base.smtp_settings = {
  :user_name => 'app24067842@heroku.com',
  :password => 'g6enfd5m',
  :domain => 'boiling-garden-2168.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 465,
  :authentication => :plain,
  :enable_starttls_auto => true
}

  #ActionMailer::Base.delivery_method = :smtp
  #ActionMailer::Base.perform_deliveries = true
  #ActionMailer::Base.raise_delivery_errors = true
  #ActionMailer::Base.smtp_settings = 
  #{

   #:address            => 'smtp.sendgrid.net',
   #:port               => '587',
   #:domain             => 'heroku.com', #you can also use google.com
   #:authentication     => :plain,
   #:user_name          => ENV['app24067842@heroku.com'],
   #:password           => ENV['g6enfd5m'],
   #:enable_starttls_auto => true
  #}