require File.join(File.dirname(__FILE__), '../../spec_helper.rb')

describe Dbpedia::Client do

  before :each do
    @client = Dbpedia::Client.new
  end

  describe '.find' do

    it 'should execute a request' do
      pending
      @client.find('Pete_Sampras')
    end

    it 'should return a result object for an existing resource' do
      pending
      @client.find('Pete_Sampras').should be_an_instance_of(Dbpedia::Result)
    end

    it 'should fetch the title' do
      pending
      result = @client.find('Pete_Sampras')
      result.title.should == 'Pete Sampras'
    end

    it 'should fetch the categories' do
      pending
      result = @client.find('Pete_Sampras')
      result.categories.should include(1,2)
    end

  end

  describe '.search' do

    it 'should execute a request' do
      @client.search('Pete Sampras')
    end

    it 'should return a result array' do
      @client.search('Pete Sampras').should be_an_instance_of(Array)
    end

    it 'should return a result array of Dbpedia::SearchResult objects' do
      @client.search('Pete Sampras').first.should be_an_instance_of(Dbpedia::SearchResult)
    end

    it 'should return the correct results' do
      @client.search('Pete Sampras').first.label.should == 'Pete Sampras'
    end

    it 'should return the correct categories' do
      cats = @client.search('Pete Sampras').first.categories
      cats.should be_an_instance_of(Array)
      cats.should have(18).items
    end

    it 'should return categories with correct attributes' do
      cat = @client.search('Pete Sampras').first.categories.first
      cat.should respond_to(:label)
      cat.should respond_to(:uri)
    end

    it 'should return classes with correct attributes' do
      cat = @client.search('Berlin').first.categories.first
      cat.should respond_to(:label)
      cat.should respond_to(:uri)
    end

    it 'should be possible to search by prefix' do
      @client.search('Ham', method: 'prefix').first.label.should == 'Hamburg'
    end

  end

  describe '.sparql' do

    it 'should delegate sparql to sparql-client' do
      @client.sparql.should be_an_instance_of(SPARQL::Client)
    end

  end

end
