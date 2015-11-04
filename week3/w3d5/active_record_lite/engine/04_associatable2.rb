require_relative '03_associatable'

module Associatable
  def has_one_through(name, through_name, source_name)
    define_method(name) do
      through_options = self.class.assoc_options[through_name]
      source_options = through_options.model_class.assoc_options[source_name]

      through_table_name = through_options.table_name
      through_pk = through_options.primary_key
      through_fk = through_options.foreign_key

      source_table_name = source_options.table_name
      source_pk = source_options.primary_key
      source_fk = source_options.foreign_key

      key_value = send(through_fk)

      query = DBConnection.execute(<<-SQL, key_value)
      SELECT
        #{source_table_name}.*
      FROM
        #{through_table_name}
      JOIN
        #{source_table_name}
      ON
        #{through_table_name}.#{source_fk} = #{source_table}.#{source_pk}
      WHERE
        #{through_table_name}.#{through_pk} = ?
      SQL

      source_options.model_class.parse_all(query).first
    end
  end
end
