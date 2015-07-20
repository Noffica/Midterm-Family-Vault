require 'rubygems'
require 'bundler/setup'
require 'thin'
require 'mandrill'

class MyEmailer
  def send(email, user, vault_name, vault_password)

    m = Mandrill::API.new 'O0T99R7EpAmKjSqid4mGmQ'
    message = {  
     :subject=> "You are invited to join #{user}'s Vault",  
     :from_name=> "Vaulty",  
     :text=>"You are invited by #{user} to join their vault!
              Join here: 'localhost:3000/user/user_vault/new' 
              Vault Name: #{vault_name} 
              Invitation code: #{vault_password}",  
     :to=>[  
       {  
         :email=> "#{email}",  ## this uses the email argument passed into this method
         :name=> "Recipient1"  
       }  
     ],  
     :html=>"<h1>You are invited by #{user} to join their vault!</h1><br>
              <h3>Join here: http://localhost:3000/user/user_vault/new</h3> <br>
              <h3>Vault Name: #{vault_name} </h3><br>
              <h3>Invitation code: #{vault_password} </h3>",  
     :from_email=>"sender@yourdomain.com"  
    }  
    sending = m.messages.send message  
    puts sending

  end
end