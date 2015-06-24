require "active_support"
require "active_support/inflector"

module DatabaseInstanceMethods
  
  # Saves a specific instance to the database.
  def save
     table = self.class.to_s.pluralize.underscore

     instance_variables = self.instance_variables

     attribute_hash = {}

     instance_variables.each do |variable|
       attribute_hash["#{variable.slice(1..-1)}"] = self.send("#{variable.slice(1..-1)}")
     end

     inst_var = []

     # if the value is a string, it will return as a string
     attribute_hash.each do |key, value|
       if value.is_a?(String)
         inst_var << "#{key} = '#{value}'"
       else
         inst_var << "#{key} = #{value}"
       end
   end
    
  # Deletes an entry from the database.
  def delete
     table_name = self.class.to_s.pluralize.underscore
     DATABASE.execute("DELETE FROM #{table_name} WHERE id = #{@id};")
  end
end