# README

This README document the necessary steps to get the application up and running.

## Ruby version

This app has been tested with ruby 3.2.2. You may want to use [rbenv](https://github.com/rbenv/rbenv) to install the right version or ruby:

```
$ rbenv install 3.2.2
```

## System dependencies

In theroy, the latest version of Bundler has been already installed in your system with ruby.

Just run:
```
$ bundle install
```

## Database creation

```
$ rails db:create
```

## Database initialization

```
$ rails db:migrate
```

## Configuration
No config needed. You will need to register a new user and create some Lists and Items by yourself once the app is up and running :)

## Start the app

```
$ rails s
```

Once your server is running, just open [localhost:3000](http://localhost:3000) as usual. In the main page after registering and login you'll find some basic instructions about how to use the app.

## How to run the test suite

```
$ bundle exec rspec
```