$:.unshift File.expand_path("../lib", __FILE__)
require "virtbox/version"

Gem::Specification.new do |s|
  s.name          = "virtbox"
  s.version       = VirtBox::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["Tsiduia"]
  s.email         = ["tsiduia@gmail.com"]
  s.homepage      = "http://github.com/tsiduia/ruby-virtbox"
  s.summary       = "Library to control virtualbox with VirtManage"
  s.description   = "Library to control virtualbox with VirtManage"

  s.required_rubygems_version = ">= 1.3.6"

  s.files         = `git ls-files`.split("\n")
  s.require_path  = 'lib'
end
