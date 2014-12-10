[![Gem Version](https://badge.fury.io/rb/simple_processor.svg)](http://badge.fury.io/rb/simple_processor)
[![Build Status](https://travis-ci.org/dsaenztagarro/simple_processor.png)](https://travis-ci.org/dsaenztagarro/simple_processor)
[![Code Climate](https://codeclimate.com/github/dsaenztagarro/simple_processor/badges/gpa.svg)](https://codeclimate.com/github/dsaenztagarro/simple_processor)
[![Coverage Status](https://coveralls.io/repos/dsaenztagarro/simple_processor/badge.png?branch=master)](https://coveralls.io/r/dsaenztagarro/simple_processor?branch=master)
[![Dependency Status](https://gemnasium.com/dsaenztagarro/simple_processor.svg)](https://gemnasium.com/dsaenztagarro/simple_processor)

# SimpleProcessor

Rails data batch migrations made easy.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_processor'
```

And then execute:

```shell
bundle
```

Or install it yourself as:

```shell
gem install simple_processor
```

## Usage

Example of use:

```ruby
# lib/my_package/processors/concept_processor.rb
module MyPackage
  module Processors
    class ConceptProcessor < SimpleProcessor::BatchProcessor
      processor_handlers :process1_handler, :process2_handler
      processor_model Concept
    end
  end
end

# lib/my_package/handlers/concept_handler.rb
module MyPackage
  module Handlers
    class Process1Handler
      def apply(model)
        # Your business logic!
      end
    end

    class Process2Handler
      def apply(model)
        # Your business logic!
      end
    end
  end
end
```


```ruby
# lib/tasks/update_concepts.rake (Option 1: rake task)
task :update_concepts => :environment do
  MyPackage::Processors::ConceptProcessor.new.run
end

# db/data/XXXXXXX_update_concepts.rb (Option 2: data_migration)
class DestroyDuplicateCrops < ActiveRecord::Migration
  def self.up
    ::MyPackage::Processors::ConceptProcessor.new(ar_migration: self).run
  end
  def self.down
    raise IrreversibleMigration
  end
end
```

## Contributing

1. Fork it ( https://github.com/dsaenztagarro/simple_processor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Thanks

Thanks to [Hola Internet](https://github.com/holadev) for let me right this kind
of tools.
