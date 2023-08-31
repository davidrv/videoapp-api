# README

This README document the necessary steps to get the application up and running.

# SUMMARY

This project is a basic video playlist manager. The aim is allow us (parents) to create playlists with handpicked content from platforms like YouTube. So, the mobile apps for Android and iOS (sepparate projects) will access to these playlists via API and allow the kids to view and navigate through the videos we have pre-approved.

## Ruby version

This app has been tested with ruby 3.2.2. You may want to use [rbenv](https://github.com/rbenv/rbenv) to install the right version or ruby:

```
rbenv install 3.2.2
```

## System dependencies

In theroy, the latest version of Bundler has been already installed in your system with ruby.

Just run:
```
bundle install
```

## Database creation

```
rails db:create
```

## Database initialization

```
rails db:migrate
```

## Configuration
You will need to register a new user and create some Lists and Items by yourself once the app is up and running :)

The only thing you need to run to be able to properly test is the `generate_views` rake task

```
rake generate_views
```

But please, make sure you have manually generated first at least 1 list and added some videos because it will generate fake data only for existing videos (`Items`).

Apart from this, no config needed.

## Start the app

```
rails s
```

Once your server is running, just open [localhost:3000](http://localhost:3000) as usual. In the main page after registering and login you'll find some basic instructions about how to use the app.

## How to run the test suite

```
bundle exec rspec
```

## Extra

I've deployed a test version of the app [here](https://davidrv-videoapp-2ab25611653d.herokuapp.com/). At least, in case you cannot setup your local env to play with it, you'll be able to use it live.