# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{httpotato}
  s.version = "1.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Wes Morgan", "Adrian Cushman", "Chris Gill"]
  s.date = %q{2011-01-19}
  s.default_executable = %q{httpotato}
  s.description = %q{Makes http fun & JSON parsing fast! Also, makes consuming restful web services dead easy. Forked from HTTParty.}
  s.email = %q{innovationlab@dnc.org}
  s.executables = ["httpotato"]
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "History",
     "MIT-LICENSE",
     "Manifest",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/httpotato",
     "cucumber.yml",
     "examples/aaws.rb",
     "examples/basic.rb",
     "examples/custom_parsers.rb",
     "examples/delicious.rb",
     "examples/google.rb",
     "examples/rubyurl.rb",
     "examples/twitter.rb",
     "examples/whoismyrep.rb",
     "features/basic_authentication.feature",
     "features/command_line.feature",
     "features/deals_with_http_error_codes.feature",
     "features/digest_authentication.feature",
     "features/handles_compressed_responses.feature",
     "features/handles_multiple_formats.feature",
     "features/steps/env.rb",
     "features/steps/httpotato_response_steps.rb",
     "features/steps/httpotato_steps.rb",
     "features/steps/mongrel_helper.rb",
     "features/steps/remote_service_steps.rb",
     "features/supports_redirection.feature",
     "features/supports_timeout_option.feature",
     "httpotato.gemspec",
     "lib/httpotato.rb",
     "lib/httpotato/cookie_hash.rb",
     "lib/httpotato/core_extensions.rb",
     "lib/httpotato/exceptions.rb",
     "lib/httpotato/module_inheritable_attributes.rb",
     "lib/httpotato/net_digest_auth.rb",
     "lib/httpotato/parser.rb",
     "lib/httpotato/request.rb",
     "lib/httpotato/response.rb",
     "spec/fixtures/delicious.xml",
     "spec/fixtures/empty.xml",
     "spec/fixtures/google.html",
     "spec/fixtures/ssl/generate.sh",
     "spec/fixtures/ssl/generated/1fe462c2.0",
     "spec/fixtures/ssl/generated/bogushost.crt",
     "spec/fixtures/ssl/generated/ca.crt",
     "spec/fixtures/ssl/generated/ca.key",
     "spec/fixtures/ssl/generated/selfsigned.crt",
     "spec/fixtures/ssl/generated/server.crt",
     "spec/fixtures/ssl/generated/server.key",
     "spec/fixtures/ssl/openssl-exts.cnf",
     "spec/fixtures/twitter.json",
     "spec/fixtures/twitter.xml",
     "spec/fixtures/undefined_method_add_node_for_nil.xml",
     "spec/httpotato/cookie_hash_spec.rb",
     "spec/httpotato/parser_spec.rb",
     "spec/httpotato/request_spec.rb",
     "spec/httpotato/response_spec.rb",
     "spec/httpotato/ssl_spec.rb",
     "spec/httpotato_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/support/ssl_test_helper.rb",
     "spec/support/ssl_test_server.rb",
     "spec/support/stub_response.rb",
     "test.rb",
     "website/css/common.css",
     "website/index.html"
  ]
  s.homepage = %q{http://github.com/dnclabs/httpotato/}
  s.post_install_message = %q{Winners don't use crack.}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{httpotato}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Makes http fun & JSON parsing fast! Also, makes consuming restful web services dead easy.}
  s.test_files = [
    "spec/httpotato/cookie_hash_spec.rb",
     "spec/httpotato/parser_spec.rb",
     "spec/httpotato/request_spec.rb",
     "spec/httpotato/response_spec.rb",
     "spec/httpotato/ssl_spec.rb",
     "spec/httpotato_spec.rb",
     "spec/spec_helper.rb",
     "spec/support/ssl_test_helper.rb",
     "spec/support/ssl_test_server.rb",
     "spec/support/stub_response.rb",
     "examples/aaws.rb",
     "examples/basic.rb",
     "examples/custom_parsers.rb",
     "examples/delicious.rb",
     "examples/google.rb",
     "examples/rubyurl.rb",
     "examples/twitter.rb",
     "examples/whoismyrep.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<crack>, ["= 0.1.8"])
      s.add_runtime_dependency(%q<json>, ["= 1.4.6"])
      s.add_development_dependency(%q<activesupport>, ["~> 2.3"])
      s.add_development_dependency(%q<cucumber>, ["~> 0.7"])
      s.add_development_dependency(%q<fakeweb>, ["~> 1.2"])
      s.add_development_dependency(%q<mongrel>, ["~> 1.1"])
      s.add_development_dependency(%q<rspec>, ["~> 1.3"])
    else
      s.add_dependency(%q<crack>, ["= 0.1.8"])
      s.add_dependency(%q<json>, ["= 1.4.6"])
      s.add_dependency(%q<activesupport>, ["~> 2.3"])
      s.add_dependency(%q<cucumber>, ["~> 0.7"])
      s.add_dependency(%q<fakeweb>, ["~> 1.2"])
      s.add_dependency(%q<mongrel>, ["~> 1.1"])
      s.add_dependency(%q<rspec>, ["~> 1.3"])
    end
  else
    s.add_dependency(%q<crack>, ["= 0.1.8"])
    s.add_dependency(%q<json>, ["= 1.4.6"])
    s.add_dependency(%q<activesupport>, ["~> 2.3"])
    s.add_dependency(%q<cucumber>, ["~> 0.7"])
    s.add_dependency(%q<fakeweb>, ["~> 1.2"])
    s.add_dependency(%q<mongrel>, ["~> 1.1"])
    s.add_dependency(%q<rspec>, ["~> 1.3"])
  end
end

