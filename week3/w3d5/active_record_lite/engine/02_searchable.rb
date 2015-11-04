require_relative 'db_connection'
require_relative '01_sql_object'
require 'byebug'

module Searchable
  def where(params)
    fill_ins = params.keys.map { |key| "#{key} = ?" }.join(' AND ')
    value = params.values
    query = DBConnection.execute(<<-SQL, *value)
      SELECT * FROM #{table_name} WHERE #{fill_ins}
    SQL
    parse_all(query)
  end
end

class SQLObject
  extend Searchable
end
