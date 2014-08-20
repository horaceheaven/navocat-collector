require 'mail'

module Meda
  module Services
    #Mailer Service
    class MailerService
       
      def initialize
        Mail.defaults do
            delivery_method :smtp,  {
              :address => Meda.configuration.mail_options['host'],
              :port => Meda.configuration.mail_options['port'],
              :user_name => Meda.configuration.mail_options['sender'],
              :password => Meda.configuration.mail_options['password'],
              :authentication => Meda.configuration.mail_options['authentication'],
              :enable_starttls_auto => Meda.configuration.mail_options['enable_tls']}
        end
      end
      
      def sendMail(mail_to, mail_subject, mail_body, mail_content_type)
        mail = Mail.new do
          from Meda.configuration.mail_options['sender']
          to mail_to
          subject mail_subject
          content_type mail_content_type
          body mail_body
        end
        
        mail.deliver
      end
    end
  end
end
