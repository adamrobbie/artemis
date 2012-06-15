source 'https://rubygems.org'
ruby '1.9.3'
gem 'rails', '3.2.3'
gem "heroku"
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem "therubyracer"
end

group :production do
  gem 'thin'
end

group :development, :test do
  gem "rspec-rails", ">= 2.10.1"
  gem "factory_girl_rails", ">= 3.3.0"
end

group :development do
  gem "guard", ">= 0.6.2"
  gem 'rb-fsevent'
  gem 'growl'
  gem "guard-bundler", ">= 0.1.3"
  gem "guard-rails", ">= 0.0.3"
  gem "guard-livereload", ">= 0.3.0"
  gem "guard-rspec", ">= 0.4.3"
  gem "guard-cucumber", ">= 0.6.1"
  gem "rails-footnotes", ">= 3.7"
end

group :test do
  gem "database_cleaner", ">= 0.8.0"
  gem "mongoid-rspec", ">= 1.4.4"
  gem "email_spec", ">= 1.2.1"
  gem "cucumber-rails", ">= 1.3.0", :require => false
  gem "capybara", ">= 1.1.2"
  gem "launchy", ">= 2.1.0"
end

gem 'jquery-rails'
gem "bson_ext", ">= 1.6.4"
gem "mongoid", ">= 2.4.11"
gem "devise", ">= 2.1.0"
gem "bootstrap-sass", ">= 2.0.3"