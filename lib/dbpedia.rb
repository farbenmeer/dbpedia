require 'yaml'

module Dbpedia

  File.open('config/dbpedia.yml') do |file|
    Dbpedia::Config = YAML::load(file)['dbpedia']
  end

  require 'dbpedia/exception'
  require 'dbpedia/request'
  require 'dbpedia/client'
  require 'dbpedia/result'
  require 'dbpedia/search_result'

  ###
  # Returns a Dbpedia::Result object for _name_
  def self.find(name, *args)
    client.find(name, *args)
  end

  ###
  # Returns an array of matching strings for _query_
  def self.search(query, *args)
    client.search(query, *args)
  end

  ###
  # Access to sparql delegator
  def self.sparql
    client.sparql
  end

  private

  ###
  # Initialize a new Dbpedia::Client
  def self.client
    @client ||= Dbpedia::Client.new
  end
end