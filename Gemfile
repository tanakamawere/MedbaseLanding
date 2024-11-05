source "https://rubygems.org"
gem "jekyll", "~> 4.0"
gem "webrick" # for local server compatibility with Jekyll

gem "kramdown-parser-gfm" if ENV["JEKYLL_VERSION"] == "~> 3.9"

gem 'wdm', '>= 0.1.0' if Gem.win_platform?
group :jekyll_plugins do
    gem "jekyll-paginate-v2"
    gem "jekyll-feed"
  end