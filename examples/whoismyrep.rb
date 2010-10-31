dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'httpotato')
require 'pp'

class Rep
  include HTTPotato
end

pp Rep.get('http://whoismyrepresentative.com/whoismyrep.php?zip=46544')
pp Rep.get('http://whoismyrepresentative.com/whoismyrep.php', :query => {:zip => 46544})