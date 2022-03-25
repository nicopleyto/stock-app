# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

How to install Rspec:
    1. Add gem 'rspec-rails' in Gemfile under development and/or test group and run 'bundle install'
    2. Run 'rails g rspec:install'. This will create the following files: .rspec, spec, spec/spec_helper.rb, spec/rails_helper
        note: if command hangs, check if spring is running by running 'ps aux | grep -i spring'. To make it stop, run 'bin/spring stop'

    Model tests:
        1. Run 'rails g rspec:model [NameOfModel]'. This will create a spec/models/name_of_model_spec.rb file
        2. Run 'rspec spec/models/name_of_model_spec.rb' to run the test. Test will yield number of examples, failures, and pending

