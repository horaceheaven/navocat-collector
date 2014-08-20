require 'multi_json'

module Meda
  module Services
    #Global Exception Handler for logging errors
    class ExceptionHandlerService
      
      def initialize(app)
        @app = app
        @mailer=MailerService.new
      end
     
      def call(env)
        begin
          @app.call env
        rescue => ex
          env['rack.errors'].puts ex
          env['rack.errors'].puts ex.backtrace.join("\n")
          env['rack.errors'].flush
     
          hash = { :message => ex.to_s, :backtrace => ex.backtrace}
          #jsonData=hash.to_json
          #sends an email with the error
          @mailer.sendMail(Meda.configuration.mail_options['error_recipient'], "Internal Meda Error", 
                           "<p><b>The Meda Collector reported the following error:</b></p>
                            <label><b>Message: </b></label>"+hash[:message]+"<br />
                            <label><b>Back Trace: </b></label>#{hash[:backtrace].join(",\n")}", "text/html; charset=UTF-8")
          #[500, {'Content-Type' => 'application/json'}, [MultiJson.dump(hash)]]
        end
      end
    end
  end
end
