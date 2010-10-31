require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

describe HTTPotato::Parser do
  describe ".SupportedFormats" do
    it "returns a hash" do
      HTTPotato::Parser::SupportedFormats.should be_instance_of(Hash)
    end
  end

  describe ".call" do
    it "generates an HTTPotato::Parser instance with the given body and format" do
      HTTPotato::Parser.should_receive(:new).with('body', :plain).and_return(stub(:parse => nil))
      HTTPotato::Parser.call('body', :plain)
    end

    it "calls #parse on the parser" do
      parser = mock('Parser')
      parser.should_receive(:parse)
      HTTPotato::Parser.stub(:new => parser)
      parser = HTTPotato::Parser.call('body', :plain)
    end
  end

  describe ".formats" do
    it "returns the SupportedFormats constant" do
      HTTPotato::Parser.formats.should == HTTPotato::Parser::SupportedFormats
    end

    it "returns the SupportedFormats constant for subclasses" do
      class MyParser < HTTPotato::Parser
        SupportedFormats = {"application/atom+xml" => :atom}
      end
      MyParser.formats.should == {"application/atom+xml" => :atom}
    end
  end

  describe ".format_from_mimetype" do
    it "returns a symbol representing the format mimetype" do
      HTTPotato::Parser.format_from_mimetype("text/plain").should == :plain
    end

    it "returns nil when the mimetype is not supported" do
      HTTPotato::Parser.format_from_mimetype("application/atom+xml").should be_nil
    end
  end

  describe ".supported_formats" do
    it "returns a unique set of supported formats represented by symbols" do
      HTTPotato::Parser.supported_formats.should == HTTPotato::Parser::SupportedFormats.values.uniq
    end
  end

  describe ".supports_format?" do
    it "returns true for a supported format" do
      HTTPotato::Parser.stub(:supported_formats => [:json])
      HTTPotato::Parser.supports_format?(:json).should be_true
    end

    it "returns false for an unsupported format" do
      HTTPotato::Parser.stub(:supported_formats => [])
      HTTPotato::Parser.supports_format?(:json).should be_false
    end
  end

  describe "#parse" do
    before do
      @parser = HTTPotato::Parser.new('body', :json)
    end

    it "attempts to parse supported formats" do
      @parser.stub(:supports_format? => true)
      @parser.should_receive(:parse_supported_format)
      @parser.parse
    end

    it "returns the unparsed body when the format is unsupported" do
      @parser.stub(:supports_format? => false)
      @parser.parse.should == @parser.body
    end

    it "returns nil for an empty body" do
      @parser.stub(:body => '')
      @parser.parse.should be_nil
    end

    it "returns nil for a nil body" do
      @parser.stub(:body => nil)
      @parser.parse.should be_nil
    end
  end

  describe "#supports_format?" do
    it "utilizes the class method to determine if the format is supported" do
      HTTPotato::Parser.should_receive(:supports_format?).with(:json)
      parser = HTTPotato::Parser.new('body', :json)
      parser.send(:supports_format?)
    end
  end

  describe "#parse_supported_format" do
    it "calls the parser for the given format" do
      parser = HTTPotato::Parser.new('body', :json)
      parser.should_receive(:json)
      parser.send(:parse_supported_format)
    end

    context "when a parsing method does not exist for the given format" do
      it "raises an exception" do
        parser = HTTPotato::Parser.new('body', :atom)
        expect do
          parser.send(:parse_supported_format)
        end.to raise_error(NotImplementedError, "HTTPotato::Parser has not implemented a parsing method for the :atom format.")
      end

      it "raises a useful exception message for subclasses" do
        atom_parser = Class.new(HTTPotato::Parser) do
          def self.name; 'AtomParser'; end
        end
        parser = atom_parser.new 'body', :atom
        expect do
          parser.send(:parse_supported_format)
        end.to raise_error(NotImplementedError, "AtomParser has not implemented a parsing method for the :atom format.")
      end
    end
  end

  context "parsers" do
    subject do
      HTTPotato::Parser.new('body', nil)
    end

    it "parses xml with Crack" do
      Crack::XML.should_receive(:parse).with('body')
      subject.send(:xml)
    end

    it "parses json with the json gem" do
      JSON.should_receive(:parse).with('body')
      subject.send(:json)
    end

    it "parses yaml" do
      YAML.should_receive(:load).with('body')
      subject.send(:yaml)
    end

    it "parses html by simply returning the body" do
      subject.send(:html).should == 'body'
    end

    it "parses plain text by simply returning the body" do
      subject.send(:plain).should == 'body'
    end
  end
end
