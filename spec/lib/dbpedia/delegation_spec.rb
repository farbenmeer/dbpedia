describe Dbpedia do

  before :each do
    @client = Dbpedia.class_eval { client }
  end

  it 'should delegate find' do
    @client.should_receive(:find).with('foo')
    Dbpedia.find('foo')
  end

  it 'should delegate search' do
    @client.should_receive(:search).with('foo')
    Dbpedia.search('foo')
  end

  it 'should delegate sparql' do
    SPARQL::Client.should_receive(:new)
    Dbpedia.sparql
  end

end