require 'rubygems'
require 'bundler/setup'
require 'meda'
require 'meda/collector'

use Rack::Deflater

run Meda::Collector::App