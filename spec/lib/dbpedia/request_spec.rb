require File.join(File.dirname(__FILE__), '../../spec_helper.rb')

describe Dbpedia::Request do

  describe '.initialize (make request)' do

    it 'should execute a request' do
      Dbpedia::Request.new('http://example.com')
    end

    it 'should return an URI Object' do
      Dbpedia::Request.new('http://example.com').uri.should be_an_instance_of(URI::HTTP)
    end

    it 'should should fetch a response body' do
      Dbpedia::Request.new('http://example.com').body.should be_an_instance_of(String)
    end

    describe 'paramater handling' do

      before :each do
        @request = Dbpedia::Request.new('http://example.com') do |params|
          params.query_string = 'foo'
        end
      end

      it 'should accept known parameters' do
        @request.params.active['QueryString'].should == 'foo'
      end

      it 'should transform known parameters to uri-query' do
        @request.uri.query.should == 'QueryString=foo'
      end

    end
  end
end