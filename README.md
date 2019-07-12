# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.5.0

* Rails version: 5.2.0

* Database: Postgres

* Database creation
```
  rails db:setup
  rails db:migrate
```

* Database initialization
```
  rails db:seed
```

* How to run the test suite
```
  rspec
  rspec spec/controllers/api/purchases_controller_spec.rb
  rspec spec/controllers/api/users_controller_spec.rb
  rspec spec/tasks/users_tasks_spec.rb
```

* Services (job queues, cache servers, search engines, etc.)
```
  rake users:birthday_coffee_reward
  rake users:free_coffee_reward
```
