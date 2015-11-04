# ActiveRecord Lite

ActiveRecord Lite is an Object-Relational-Mapping inspired by Rails' ActiveRecord by using Ruby's meta-programming capabilities to make SQL queries. This facilitates performing database operations in a object-oriented manner.

### Setup

Download the repository and run `bundle install`. In the `db` folder, place your own `.sql` file or copy the `cats.sql` file included in the main directory.

Navigate to `/db` in your terminal and run `ruby db_connection.rb`. Your `.db` file should be in the db folder.

## Features

### `SQLObject`

`SQLObject` is a class that interacts with the database. It simulates the functionality of `ActiveRecord::Base` by implementing features including `#all`, `#find`, `#insert`, etc.

### `Searchable`

The `Searchable` module adds AR's `::where` functionality. We mix in `Searchable` with the `SQLObject` class to query via various parameters.

### `Associatable`

The `Associatable` module is the final component to the `SQLObject` class. This provides default values for three key attributes: `foreign_key`, `primary_key`, and `class_name`. This allows classes to associate with each other via the `#belongs_to` and `#has_many` methods. Finally, it's all tied together with `#has_one_through`.

### ToDo

- `#has_many_through`
- `#has_and_belongs_to_many`
