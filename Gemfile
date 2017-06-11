source 'https://rubygems.org'

gem 'annotate'
gem 'devise'
gem 'pg'
gem 'rails', '~> 5.0.1'
gem 'sass-rails', '~> 5.0'
gem "twitter-bootstrap-rails"

source 'https://rails-assets.org' do
  gem 'rails-assets-datetimepicker'
end

group :development, :test do
  gem 'factory_girl'
  gem 'factory_girl_rails' # Need factory_girl_rails here to keep Rails from generating fixtures when new models are created.
  gem 'rspec-rails'
  gem 'capybara'
end

group :test do
  gem 'database_cleaner'
end
