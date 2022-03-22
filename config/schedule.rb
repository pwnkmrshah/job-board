every :1.minute, :at => '12pm' do
  rake "email_sender"
end