# This pulls from the main page, and sends the user to the report_main page.
get '/report_main' do
  erb :'reports/report_main'
end

# form for user to enter information to add report
get "/report_add_form" do
  erb :"/reports/report_add_form"
end

# This pulls from the report main page, and sends the user to the report_add page.
# This page allows the user to add a new report name
get '/report_add' do
  # new_report_id is the Integer returned from the add method
  @new_report_id = Report.add_to_database(params)
  erb :"/success/data_added"
end

get '/report_list' do
  @report_list = DATABASE.execute('SELECT * FROM reports')
  binding.pry  
  erb :"/reports/report_list"
end

get "/report_by_group_form" do
  @allgroups = DATABASE.execute("SELECT * FROM groups")
  erb :"/report_by_group"
end

get "/report_by_group" do
  
end

get "/report_by_pollutants_form" do
  @allpollutants = DATABASE.execute("SELECT * FROM pollutants")
  erb :"/report_by_pollutants"
end

get "/report_by_pollutants" do
  
end

get "/report_by_source_form" do
  @allsources = DATABASE.execute("SELECT * FROM sources")
  erb :"/report_by_source"
end

get "/report_by_source" do

end