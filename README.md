# DBpedia Client for Ruby

## Features

* Search for Dbpedia entries by *keyword* or *prefix* (e.g. autocompleter)
* Use SPARQL via [Ruby RDFs great *sparql-client*](https://github.com/ruby-rdf/sparql-client) to query Dbpedia

## Installation

Simply add it to your Gemfile:

    gem "dbpedia"
    gem "sparql-client" # if you want to use sparql

## Examples

### Search by *keyword* and *prefix* (notice their different results)

    # Default search is by keyword:
    Dbpedia.search('Ham').collect(&:label)
    Dbpedia.search('Ham', method: 'keyword').collect(&:label)
    #=> ["West Ham United F.C.", "Ham", "West Ham", "East Ham", "Hamarkameratene"]

    # To perform a prefix-search (which is usefull for autocompleter) pass `method`:
    Dbpedia.search('Ham', method: 'prefix').collect(&:label)
    #=> ["Hamburg", "Hampshire", "Hamlet (place)", "Hamlet", "Hamilton, Ontario"]

### Fetch search details

    results = Dbpedia.search('Hamburg')
    puts results.first.label #=> "Hamburg"
    puts results.first.categories.count #=> 15
    puts results.first.categories.first.label #=> Populated places established in the 9th century"

#### Possible methods

    [results] (SearchResult)
    |-- label
    |-- uri
    |-- description
    +-- [categories] (SearchResult::Category)
    |   |-- label
    |   |-- uri
    +-- [classes] (SearchResult::Klass)
        |-- label
        |-- uri

### SPARQL Queries

Marke sure you've installed [*sparql-client*](https://github.com/ruby-rdf/sparql-client)!

    Dbpedia.sparql.select.whatever

## Milestones

* Implement `find` for known resources
* Gemify

## Specs

Run `$ bundle exec rspec -c`

## Gloss

Copyright © 2013 [Roman Ernst](http://wanderwort.de), released under [CC BY-SA 3.0](http://creativecommons.org/licenses/by-sa/3.0/) license

.. without warranty of any kind!