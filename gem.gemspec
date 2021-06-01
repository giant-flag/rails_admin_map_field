# coding: UTF-8

Gem::Specification.new do |s|
  s.add_runtime_dependency("rails", ">= 3.0.0")
  s.add_runtime_dependency("rails_admin")
  s.add_runtime_dependency("rgeo-geojson")

  s.add_development_dependency("devise", ">= 1.1")
  s.add_development_dependency("rspec-rails", ">= 2.4")
  s.add_development_dependency("sqlite3")
  s.add_development_dependency("yard", ">= 0.6")

  s.name              = "rails_admin_map_field"
  s.version           = "0.1.0"
  s.platform          = Gem::Platform::RUBY
  s.authors           = ["Jason Langenauer","Jules Laplace", "Ephraim Moss"]
  s.email             = ["jason@jasonlangenauer.com","jules@okfoc.us","ephraim@goseamless.co.za"]
  s.homepage          = "http://github.com/jasonl/"
  s.summary           = "Adds a map field using the Google Maps API to rails_admin"
  s.description       = "A map field for RailsAdmin that can be used to manipulate a latitude/longitude field pair & a polygon with the ability to add and edit"
  s.rubyforge_project = s.name

  s.required_rubygems_version = ">= 1.3.6"

  s.files             = `git ls-files`.split("\n")
  s.require_path      = "lib"
end
