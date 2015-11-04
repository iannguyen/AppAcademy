require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'

class SQLObject
  def self.columns
    table = table_name
    query = DBConnection.execute2(<<-SQL)
      SELECT * FROM "#{table}"
    SQL
    query.first.map(&:to_sym)
  end

  def self.finalize!
    columns.each do |title|
      define_method("#{title}") { attributes[title] }
      define_method("#{title}=") { |value| attributes[title] = value }
    end
  end

  class << self
    attr_writer :table_name
  end

  def self.table_name
    @table_name ||= to_s.tableize
  end

  def self.all
    query = DBConnection.execute(<<-SQL)
      SELECT * FROM "#{table_name}"
    SQL
    parse_all(query)
  end

  def self.parse_all(results)
    parsed = []
    results.each do |hash|
      parsed << new(hash)
    end
    parsed
  end

  def self.find(id)
    query = DBConnection.execute(<<-SQL)
      SELECT * FROM "#{table_name}" WHERE id = "#{id}"
    SQL
    parse_all(query).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      fail "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name.to_sym)
      send("#{attr_name}=", value)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    attributes.values
  end

  def insert
    col_names = self.class.columns.drop(1).join(', ')
    n = self.class.columns.drop(1).count
    question_marks = (['?'] * n).join(', ')
    query = DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL
    send(:id=, DBConnection.last_insert_row_id)
  end

  def update
    col_names = self.class.columns
    col_names.map! { |col_name| "#{col_name} = ?" if attributes.include?(col_name) }
    col_names = col_names.join(', ')

    query = DBConnection.execute(<<-SQL, *attribute_values)
      UPDATE
        #{self.class.table_name}
      SET
        #{col_names}
      WHERE
        id = #{id}
    SQL
    query
  end

  def save
    id.nil? ? insert : update
  end
end
