require 'rubygems'
require 'httpotato'
require 'auth-hmac'
require 'ruby-prof'
require 'ruby-debug'

class Getter

  include HTTPotato


  format :json
  base_uri "http://athenavcs.democrats.org/"

  def self.get_campaigns(state)
    get('/campaign', {:query => {:state => state}, :hmac => {:id => 'dnc-platypus', :secret => '64968b89756446d5a6653fbd08354b3b433e9b72'}})
  end
  
  
end

states = ["AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV", "WY"]


RubyProf.start
2.times do |i|  

  states.each do |state|
    campaigns = Getter.get_campaigns(state)
  end

end

result = RubyProf.stop
printer = RubyProf::CallTreePrinter.new(result)
file = File.open("/tmp/results", "w+")
printer.print(file, 0)
file.close

