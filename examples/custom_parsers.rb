class ParseAtom
  include HTTPotato

  # Support Atom along with the default parsers: xml, json, yaml, etc.
  class Parser::Atom < HTTPotato::Parser
    SupportedFormats.merge!({"application/atom+xml" => :atom})

    protected

    # perform atom parsing on body
    def atom
      body.to_atom
    end
  end

  parser Parser::Atom
end


class OnlyParseAtom
  include HTTPotato

  # Only support Atom
  class Parser::OnlyAtom < HTTPotato::Parser
    SupportedFormats = {"application/atom+xml" => :atom}

    protected

    # perform atom parsing on body
    def atom
      body.to_atom
    end
  end

  parser Parser::OnlyAtom
end


class SkipParsing
  include HTTPotato

  # Parse the response body however you like
  class Parser::Simple < HTTPotato::Parser
    def parse
      body
    end
  end

  parser Parser::Simple
end


class AdHocParsing
  include HTTPotato
  parser(
    Proc.new do |body, format|
      case format
      when :json
        body.to_json
      when :xml
        body.to_xml
      else
        body
      end
    end
  )
end
