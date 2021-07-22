source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.3', '>= 6.0.3.6'

gem 'uglifier', '>= 1.3.0'

gem 'devise'

gem 'devise-i18n'

gem 'rails-i18n'

gem 'russian'

gem 'jquery-rails'

gem 'carrierwave'
gem 'rmagick'

gem "fog-aws"
gem 'lightbox2-rails'

gem 'mailjet'
gem 'dotenv-rails'

gem 'twitter-bootstrap-rails'

gem 'pry', '~> 0.13.1'

gem 'puma', '~> 4.1'
# gem 'sass-rails', '>= 6'
# gem 'webpacker', '~> 4.0'
# gem 'turbolinks', '~> 5'
# gem 'jbuilder', '~> 2.7'

gem 'bootsnap', '>= 1.4.2', require: false

group :production do
  gem 'pg'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'sqlite3', '~> 1.4'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "letter_opener"
  # gem 'listen', '~> 3.2'
end

group :development do
#   gem 'web-console', '>= 3.3.0'
 gem 'listen', '~> 3.2'
  
#   gem 'spring'
#   gem 'spring-watcher-listen', '~> 2.0.0'
end

