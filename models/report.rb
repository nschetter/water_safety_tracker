class Report
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_accessor :id, :location, :surroundings, :plant_treatment, :comments, :source_id, :group_id
  
  def initialize(arg = {})
    @id = arg["id"]
    @location = arg["location"]
    @surroundings = arg["surroundings"]
    @plant_treatment = arg["plant_treatment"]
    @comments = arg["comments"]
    @source_id = arg["source_id"]
    @group_id = arg["group_id"]  
    @allgroups = allgroups
  end #end initialize
  
  def add(options={})
    self.add_to_database(options)
  end
  
  # This class method allows us to list all of the reports associated with the group.
  # 
  # This accepts one argument--the id of the group we want to look up
  # 
  # Returns an Array of Group class Objects that belong to the group
  def self.reports_in_group(id)
    reportlist = DATABASE.execute("SELECT * FROM reports WHERE group_id = #{id};")
    group_array = []
    reportlist.each do |group|
      group_array << Group.new(group)
    end

    group_array
  end
  
  # This class method allows us to list all of the reports associated with the source
  #
  # It accepts the id of the source we want to look up
  # 
  # Returns an Array of Source class Objects that belong to the source
  def self.reports_in_source(id)
    reportlist = DATABASE.execute("SELECT * FROM reports WHERE source_id = #{id};")
    source_array = []
    reportlist.each do |source|
      source_array << Source.new(source)
    end

    source_array
  end
  
  # Checks to see if all fields are filled in
  #
  # If all fields are not filled in, then returns true
  def self.valid?(location, surroundings, plant_treatment, comments, source_id, group_id)
    if location.empty? || surroundings.empty? || plant_treatment.empty? || comments.empty? || source_id.empty? || group_id.empty?
      true
    else
      false
    end
  end
  
end #end class