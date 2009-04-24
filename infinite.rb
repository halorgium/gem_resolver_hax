require 'rubygems'
require File.dirname(__FILE__) + '/../../lib/gem_resolver'

index = Marshal.load(File.read("infinite.index"))

include GemResolver::Builders

logger = Logger.new($stdout)
logger.level = Logger::WARN
deps = [
  build_dep("merb", "1.0"),
  build_dep("dm-core", "0.9.9")
]
solution = GemResolver::Engine.resolve(deps, index, logger)
puts solution.all_specs
