This project is a Journal Planner for Avion School  
Rails version Rails 7.1.2  
Ruby version 3.2.2  
This project is made with large screen size and no media queuries have been used for smaller screen sizes

## Gems used

### Simple calendar or [GitHub](https://github.com/excid3/simple_calendar)

`gem "simple_calendar", "~> 2.4"`

#### This is used for the customized calendar.

### Rails tailwind or [GitHub](https://github.com/rails/tailwindcss-rails)

`./bin/bundle add tailwindcss-rails`  
`./bin/rails tailwindcss:install`

#### This is used as my primary CSS styling

then run on bin/dev instead of rails s/ rails server

### Bcrypt or [Bcrypt Gems](https://rubygems.org/gems/bcrypt/versions/3.1.12?locale=en) or [Github](https://github.com/bcrypt-ruby/bcrypt-ruby)

Gemfile:  
`gem 'bcrypt', '~> 3.1', '>= 3.1.12'`  
`gem install bcrypt -v 3.1.12`

### Act as List [Github](https://github.com/brendon/acts_as_list)

Gemfile:  
`gem 'acts_as_list'`

#### My go to ruby authentication

## Basic Functions

Basic Authentication with login and registration  
Admin access  
Task planner CRUD  
User/Profile CRUD  
Dynamic Reminder function for today and tomorrow  
Dynamic Calendar  
Priority of Tasks
