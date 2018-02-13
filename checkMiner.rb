require 'open-uri'
require 'nokogiri'

while true
  webSite = open("http://ckpool.org/users/1KbPSjXx4VigyNBpyhkucS9qH7hqVvAnW4").read
  doc = Nokogiri::HTML(webSite)
  info = doc.xpath("//body/p")
  findTimer = /"hashrate5m": "(\d+\.\d)G",/
  info.text =~ findTimer
  value = $1.to_f
  if value == 0
    puts "Miner offline"
  else
    puts "Miner online"
  end
  sleep(300)
end
