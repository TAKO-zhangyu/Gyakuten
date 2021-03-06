source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.6.6"
gem "active_admin_import"
gem "activeadmin" # management tools
gem "acts_as_list" # 並び替え
gem "aws-sdk-s3", require: false
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap", "~> 4.4.1"
gem "coderay" # syntax highlight
gem "config"
gem "devise"
gem "devise-bootstrap-views"
gem "devise-i18n"
gem "font-awesome-rails"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "kaminari" # pagination
gem "meta-tags" # 検索エンジン最適化（SEO）プラグイン
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.12"
gem "rails", "~> 5.2.4"
gem "rails-ujs"
gem "redcarpet" # markdown
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "slack-notifier"
gem "slack-ruby-client"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

# 各種SNSシェアボタンを作成
gem "social-share-button"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-byebug"
  gem "rspec-rails"
  gem "rubocop-rails"
  gem "rubocop-rspec"
end

group :development do
  gem "annotate"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rails-erd"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15", "< 4.0"
  gem "chromedriver-helper"
  gem "selenium-webdriver"
end

# gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
