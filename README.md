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
require 'carban'
sm  = Carban::StackMachine.new
sm.opcodes = [15, 1, 15, 1, 0]
sm.run
sm.data_stack #should return [2]


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
