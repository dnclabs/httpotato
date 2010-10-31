When /^I set my HTTPotato timeout option to (\d+)$/ do |timeout|
  @request_options[:timeout] = timeout.to_i
end

When /I call HTTPotato#get with '(.*)'$/ do |url|
  begin
    @response_from_httpotato = HTTPotato.get("http://#{@host_and_port}#{url}", @request_options)
  rescue HTTPotato::RedirectionTooDeep, Timeout::Error => e
    @exception_from_httpotato = e
  end
end

When /I call HTTPotato#get with '(.*)' and a basic_auth hash:/ do |url, auth_table|
  h = auth_table.hashes.first
  @response_from_httpotato = HTTPotato.get(
    "http://#{@host_and_port}#{url}",
    :basic_auth => { :username => h["username"], :password => h["password"] }
  )
end

When /I call HTTPotato#get with '(.*)' and a digest_auth hash:/ do |url, auth_table|
  h = auth_table.hashes.first
  @response_from_httpotato = HTTPotato.get(
    "http://#{@host_and_port}#{url}",
    :digest_auth => { :username => h["username"], :password => h["password"] }
  )
end