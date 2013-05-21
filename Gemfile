source 'https://rubygems.org'

gem 'rails', '3.2.12'
# gem 'json', '~> 1.7.7'
#The bundle currently has json locked at 1.8.0.
gem 'pg'
gem 'strong_parameters', '0.2.1'
gem 'jquery-rails'
gem 'twitter-bootstrap-rails'
gem 'devise', '~> 2.2.4'
gem 'mechanize'
gem 'paperclip', '~> 3.0'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.0'
  gem 'rb-fsevent'
  gem 'guard-rspec'
  gem 'guard-livereload'
end

group :development do
  gem 'guard-cucumber'
end

group :test do
  gem 'cucumber', '1.2.5'
  gem 'cucumber-rails', '1.3.0', :require => false
  gem 'database_cleaner'
  gem 'spork', '~> 1.0rc'
  gem "guard-spork"
  gem "shoulda-matchers"
end