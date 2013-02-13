# Carban

TODO: A Rubygem that implements the Carban Instruction Set as a Virtual Machine.

## Installation

Add this line to your application's Gemfile:

    gem 'carban'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carban

##Usage

1. require 'carban'
2. sm  = Carban::StackMachine.new
3. sm.opcodes = [15, 1, 15, 1, 0]
4. sm.run
5. sm.data_stack #should return [2]


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
