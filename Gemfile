source 'https://rubygems.org'

gem 'rails', '~> 4.2.0'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

gem 'annotate'

gem 'jquery-rails'

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
