$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'kuby/azure/version'

Gem::Specification.new do |s|
  s.name     = 'kuby-azure'
  s.version  = ::Kuby::Azure::VERSION
  s.authors  = ['Cameron Dutro']
  s.email    = ['camertron@gmail.com']
  s.homepage = 'http://github.com/getkuby/kuby-azure'

  s.description = s.summary = 'Azure provider for Kuby.'

  s.platform = Gem::Platform::RUBY

  s.add_dependency 'kube-dsl', '~> 0.1'
  s.add_dependency 'azure_mgmt_container_service', '~> 0.20'

  s.require_path = 'lib'
  s.files = Dir['{lib,spec}/**/*', 'Gemfile', 'LICENSE', 'CHANGELOG.md', 'README.md', 'Rakefile', 'kuby-azure.gemspec']
end
