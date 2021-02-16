# Weekly View Server

... in progress Rails API server for Weekly View.




## Quick Start for users

After you have everything set up
```
$ gem install bundler

bundle

rails db:migrate

rails s
```
that will give you the bundler, db and launch the server on 3000

## routes for user

```
http://localhost:3000/v1/users  --- POST Create only

    "user":{
        "email":"tactic@gmail.com",
        "password":"123456",
        "password_confirmation":"123456",
        "first_name": "Mister",
        "last_name": "Test-a-roo-ski"
    }

 http://localhost:3000/v1/sessions --- POST Login route

{
        "email":"tactic@gmail.com",
        "password":"123456"
}

```







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

