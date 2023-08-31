# frozen_string_literal: true

def next?
  File.basename(__FILE__) == 'Gemfile.next'
end
# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'bootsnap', require: false
gem 'chartkick', '~> 5.0', '>= 5.0.4'
gem 'devise'
gem 'importmap-rails'
gem 'jbuilder', '~> 2.7'
gem 'money-rails', '~> 1.14'
gem 'next_rails', '~> 1.0', '>= 1.0.4'
gem 'pg', '~> 1.1'
gem 'ruby-progressbar', '~> 1.13'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0'
gem 'redis', '~> 4.0'
gem 'rubocop', '~> 1.11'
gem 'rubocop-rails', require: false
gem 'simple_form'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'video_info', '~> 4.0'

group :development, :test do
  gem 'pry'
  gem 'dotenv-rails'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker', '~> 2.17'
  gem 'rspec-rails', '~> 6.0.0'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
