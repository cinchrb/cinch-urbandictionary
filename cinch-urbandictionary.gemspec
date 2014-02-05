Gem::Specification.new do |s|
  s.name        = "cinch-urbandictionary"
  s.version     = "0.9.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Lee Jarvis"]
  s.email       = ["lee@jarvis.co"]
  s.homepage    = "http://github.com/cinchrb/cinch-urbandictionary"
  s.summary     = %q{A Cinch plugin for fetching the top result of an Urban Dictionary query}
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency(%q<cinch>, [">= 1.1.2"])
  s.add_dependency(%q<httparty>)
end
