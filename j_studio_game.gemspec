Gem::Specification.new do |s|
    s.name         = "jamies_studio_game_speedrun"
    s.version      = "1.0.0"
    s.author       = "Jamie Clark"
    s.email        = "clarkcjamie@gmail.com"
    s.homepage     = "http://pragmaticstudio.com" 

    s.summary      = "Text based game with rounds and treasures"
    s.description  = File.read(File.join(File.dirname(__FILE__), 'README.txt'))
    s.licenses     = ['MIT']
  
    s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE.txt README.txt) #altered line
    s.test_files    = Dir["spec/**/*"]
    s.executables   = [ 'studio_game' ] # NO DIR in front
  
    s.required_ruby_version = '>=1.9'
    s.add_development_dependency 'rspec', '~> 2.8', '>= 2.8.0'
  end