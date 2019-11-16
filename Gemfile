source 'https://rubygems.org'

gem 'sassc-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'rails', '~> 4.2.5'
gem 'json'
gem 'mongoid'
gem 'jquery-rails'
gem 'haml'
gem 'mongoid-paperclip', :require => 'mongoid_paperclip'
gem 'paperclip', "~> 4.3"
gem 'kaminari-mongoid'
gem 'kaminari-actionview'
gem 'exception_notification'

group :test, :development do
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-pending', require: false
  gem 'rspec-rails'
  gem 'capybara'
  gem 'poltergeist'
  gem 'puma'
end

group :production do
  gem 'unicorn'
end