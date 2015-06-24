require 'active_support'
require 'active_support/inflector'

module DatabaseClassMethods
  # Retrieves all rows of the table of the Class that calls the method
  # 
  # Returns an Array of Objects of that Class.
  def all
    t_name = self.to_s.tableize
    instance = DATABASE.execute("SELECT * FROM #{table_name};")
    array_list = []

    instance.each do |hash|
      array_list << self.new(hash)
    end

    array_list
  end
  # Creates a new row in the Class table and returns an Object
  # 
  # Returns an Object of the Class calling the method, and also adds the new row
  def add(arg={})
    t_name = self.to_s.tableize
    columns_array = arg.keys
    values_array = arg.values  
    columns_for_sql = columns_array.join(", ")
   sql_vals = []
    
    values_array.each do |item|
      if item.is_a?(String)
       sql_vals << "'#{item}'"
      else
       sql_vals << item
      end
    end
    
    new_sql_val =sql_vals.join(", ")
    DATABASE.execute("INSERT INTO #{table_name} (#{columns_for_sql}) VALUES (#{new_sql_val});")
    arguments["id"] = DATABASE.last_insert_row_id
    self.new(arg)
  end
  # Deletes a row from the table by the class that called it.
  # 
  # Accepts the id number of the row to delete in the table that called it
  # 
  # Deletes the row from the table
  def delete(deletion_id)
    table_name = self.to_s.tableize
    
    DATABASE.execute("DELETE FROM #{table_name} WHERE id = #{deletion_id};")
  end
end