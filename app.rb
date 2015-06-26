require 'pry'
require 'sinatra'
require 'sinatra/reloader'

require 'sqlite3'
require_relative 'database_setup'
require_relative 'database_class_methods'
require_relative 'database_instance_methods'

require_relative 'models/report.rb'
# require_relative 'models/source.rb'
# require_relative 'models/group.rb'
# require_relative 'models/pollutant.rb'

require_relative 'controllers/home.rb'
require_relative 'controllers/report_control.rb'
# require_relative 'controllers/source_control.rb'
# require_relative 'controllers/group_control.rb'
# require_relative 'controllers/pollutant_control.rb'