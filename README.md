# BK::Gem::AppConfig

Global configuration options

## Installation

Add this line to your application's Gemfile:

    gem 'bk-gem-app_config', git: 'git@github.com:ZenGirl/bk-gem-app_config.git', require: 'bk/gem/app_config'

And then execute:

    bundle install

## Usage

A global variable is created name `AppConfig` which is a `Hashie::Mash`.

You should ensure you have `require 'bk/gem/app_config'` as the first thing in your app.
(Having require in the gemfile should handle this)

Standard variables include:

    AppConfig.project.root
    AppConfig.env
    AppConfig.lib_dir

You *must* set these at some point after `require 'bk/gem/app_config'`:

    AppConfig.project.name    = 'bk-app-your_app_name'
    AppConfig.project.version = 'BK::App::YourAppName::VERSION'

This is because many other `bk-gem-*` gems use the data...

Some gems respond to `AppConfig.verbose`, so you can set it like this:

    AppConfig.verbose = true

When included, the following actions are performed:

    AppConfig.project.root = [root of your project]
    AppConfig.env          = ENV['RACK_ENV'] || 'development'
    AppConfig.lib_dir      = File.expand_path(File.join(AppConfig.project.root, 'lib'))
    $LOAD_PATH.unshift(AppConfig.lib_dir) unless $LOAD_PATH.include?(AppConfig.lib_dir)
    Bundler.require(:default, AppConfig.env)

You can inject a yaml file at any point like these:

    AppConfig.yaml_inject(:database, 'path/to/database.yml')
    AppConfig.yaml_inject(:ldap, 'path/to/ldap/config.yml')

And now you can things like this:

    AppConfig.database.development.adapter

At all points in your code you can now refer to `AppConfig`.

## Contributing

Fork it ( https://github.com/ZenGirl/bk-gem-app_config/fork )

Play.

Minitests are included from bk-gem-minitest

So you can do this:

    VERBOSE=true bundle exec rake tests:all

This includes minitest (spec), simplecov, cane and reek.

Found a bug? Tell me!
