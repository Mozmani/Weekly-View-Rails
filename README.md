# Weekly View Server

... in progress Rails API server for Weekly View.

## How to get started (If you don't have Ruby)

* [Install Ruby](https://rubyinstaller.org/)

* [install SQLite](https://www.sqlite.org/index.html) -- for default rails if you want

* Install Postgres (If you somehow don't have)

* Install Node (If you somehow don't have)
* Install yarn ( npm install --global yarn )
* Install Rails ( gem install rails )

* ### If you do not have install bundler, gem install bundler

* install bundler (essesntially npm install for rails)

* create a db 
```
createdb -U (your username) calendar_server_development
```

* migrate the db
```
rails db:migrate
```

## Progress so far
```
-- creates a new rails api app with no sprockets(js make up, don't need as a server) ans postgres SQL
rails new calendar_server --api --no-sprockets -d postgresql


-- generate a rails model -- makes a migration file for user table
rails g model user

-- create db for for the new migration model
createdb -U dunder_mifflin calendar_server_development

-- migrate the rails db
rails db:migrate

-- creates the controler for users
rails g controller v1/users


-- after setting up users controller and routes to see route paths. (ie: localhost3000/v1/users)
-- can run rails server and check the location in url
rails routes



```