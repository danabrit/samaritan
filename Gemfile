source 'https://rubygems.org'


gem 'rails', '4.1.1'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development
gem 'annotate'

group :development, :test do
  gem 'factory_girl'
  gem 'factory_girl_rails' # Need factory_girl_rails here to keep Rails from generating fixtures when new models are created.
  gem 'rspec-rails'
  gem 'capybara'
end

group :test do
  gem 'database_cleaner'
end