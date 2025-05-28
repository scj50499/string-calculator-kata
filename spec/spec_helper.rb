require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/vendor/'
  add_filter '/.git/'
  add_filter '/.bundle/'
end

require 'rspec'
require 'rspec/its'
require 'string_calculator'
