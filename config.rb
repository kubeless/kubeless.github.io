require 'net/http'
require 'json'

# Configure the assets folders
set :build_dir, 'build'
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'

# Disable warnings from HAML
Haml::TempleEngine.disable_option_validator!

# Use haml in this project
set :haml, { format: :html5 }

# Get the latest release tag from Github
response = Net::HTTP.get(URI('https://api.github.com/repos/kubeless/kubeless/releases/latest'))
tag = JSON.parse(response)['tag_name']
set :latest_release_tag, tag

# Remove .html in the URL
activate :directory_indexes

# Configure build environment
configure :build do
  # If you set the MIDDLEMAN_HTTP_PREFIX environment variable on build,
  # all the assets will include this prefix in the URL. This is very useful
  # to deploy the site to GitHub Pages.
  set :http_prefix, ENV['MIDDLEMAN_HTTP_PREFIX'] if ENV['MIDDLEMAN_HTTP_PREFIX'].present?
end
