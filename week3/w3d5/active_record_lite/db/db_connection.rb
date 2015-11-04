require 'sqlite3'
require 'byebug'

def find_file_by_type(ext)
  Dir.chdir('../db')
  sql_file = Dir.entries('.').select { |file_name| file_name.split(".").last == ext }
  sql_file.first
end

def set_up_DB(sql_file)
  if find_file_by_type("db").nil?
    sql_file_name = sql_file.split(".").first
    command = "cat '#{sql_file}' | sqlite3 '#{sql_file_name}.db' "
    system("echo `#{command}`")
  end
  find_file_by_type('db')
end

CATS_SQL_FILE = find_file_by_type("sql")
raise "OH NO..." if CATS_SQL_FILE.nil?
CATS_DB_FILE = find_file_by_type("db")

CATS_DB = set_up_DB(CATS_SQL_FILE)

# https://tomafro.net/2010/01/tip-relative-paths-with-file-expand-path
# ROOT_FOLDER = File.join(File.dirname(__FILE__), '..')
# CATS_SQL_FILE = File.join(ROOT_FOLDER, 'cats.sql')
# CATS_DB_FILE = File.join(ROOT_FOLDER, 'cats.db')

class DBConnection
  def self.open(db_file_name)
    @db = SQLite3::Database.new(db_file_name)
    @db.results_as_hash = true
    @db.type_translation = true

    @db
  end

  def self.reset
    commands = [
      "rm '#{CATS_DB_FILE}'",
      "cat '#{CATS_SQL_FILE}' | sqlite3 '#{CATS_DB_FILE}'"
    ]

    commands.each { |command| `#{command}` }
    DBConnection.open(CATS_DB_FILE)
  end

  def self.instance
    reset if @db.nil?

    @db
  end

  def self.execute(*args)
    puts args[0]

    instance.execute(*args)
  end

  def self.execute2(*args)
    puts args[0]

    instance.execute2(*args)
  end

  def self.last_insert_row_id
    instance.last_insert_row_id
  end

  private

  def initialize(db_file_name)
  end
end
