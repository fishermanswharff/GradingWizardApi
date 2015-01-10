source 'https://rubygems.org'
ruby "2.2.0"
gem 'rails', '4.2.0'
gem 'rails-api'
gem 'pg'
gem 'newrelic_rpm'
gem 'rack-cors'
gem 'redis-rails'
gem "octokit", "~> 3.0"
gem 'active_model_serializers', github: 'rails-api/active_model_serializers'

group :development do
  gem 'spring'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :test do
  gem 'rspec-rails', '~> 3.1.0'
  gem "factory_girl_rails", "~> 4.0"
  gem "faker"
  gem "codeclimate-test-reporter", require: nil
end

group :production do
  gem 'unicorn'
  gem 'rails_12factor'
end