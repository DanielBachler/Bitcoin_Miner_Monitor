:smtp_server: smtp.gmail.com
:port: 587
:helo: gmail.com
:username: 'dansminer861@gmail.com'
:password: '1A#MB$wRsOw0'
:authentication: :plain

def send_email from, to, mailtext
  begin
    Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
    Net::SMTP.start(@smtp_info[:smtp_server], @smtp_info[:port], @smtp_info[:helo], @smtp_info[:username], @smtp_info[:password], @smtp_info[:authentication]) do |smtp|
      smtp.send_message mailtext, from, to
    end
  rescue => e
    raise "Exception occured: #{e} "
    exit -1
  end
end
