require_relative "lib/mub/version"

Gem::Specification.new do |spec|
  spec.name        = "mub"
  spec.version     = Mub::VERSION
  spec.authors     = ["Zino"]
  spec.email       = ["zino@chowbus.com"]
  spec.homepage    = "https://github.com/zinosama/mub"
  spec.summary     = "Resource Templating Engine"
  spec.description = "Resource Templating Engine"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/zinosama/mub"
  spec.metadata["changelog_uri"] = "https://github.com/zinosama/mub/blob/master/CHANGELOG.md"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.4", ">= 6.1.4.1"
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'annotate'
  spec.add_development_dependency 'factory_bot_rails'
end
