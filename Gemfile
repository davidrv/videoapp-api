# frozen_string_literal: true

def next?
  File.basename(__FILE__) == 'Gemfile.next'
end
# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise', '~> 4.7', '>= 4.7.3'
gem 'jbuilder', '~> 2.7'
gem 'money-rails', '~> 1.14'
gem 'next_rails', '~> 1.0', '>= 1.0.4'
gem 'pg', '~> 1.1'
gem 'pry-byebug', '~> 3.9'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.3.1'
gem 'rubocop', '~> 1.11'
gem 'rubocop-rails', require: false
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'video_info', '~> 3.0', '>= 3.0.1'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker', '~> 2.17'
  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
