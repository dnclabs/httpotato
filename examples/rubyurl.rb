dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'httpotato')
require 'pp'

class Rubyurl
  include HTTPotato
  base_uri 'rubyurl.com'

  def self.shorten( website_url )
    post( '/api/links.json', :query => { :link => { :website_url => website_url } } )
  end
end

pp Rubyurl.shorten( 'http://istwitterdown.com/')