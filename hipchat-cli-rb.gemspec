require "#{File.dirname(__FILE__)}/lib/hip_chat_cli/version"

Gem::Specification.new do |s|
  s.name = "hipchat-cli"
  s.version = HipChatCli::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Jeremy Baker"]
  s.email = ["jhubert@gmail.com"]
  s.homepage = "http://github.com/jhubert/hipchat-cli-rb"
  s.summary = "A Ruby Command Line interface for the HipChat API"
  s.description = "A Ruby Command Line interface for the HipChat API"
  s.files = Dir.glob("{bin,lib,doc}/**/*") + %w(README.md)
  s.require_path = 'lib'
  s.executables = ["hipchat_notify"]
  s.add_dependency('hipchat')
  s.required_ruby_version = ">= 1.9.2"
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project = "hipchat_cli"
end

