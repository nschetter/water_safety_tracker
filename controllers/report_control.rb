# This pulls from the main page, and sends the user to the report_main page.
get '/report_main' do
  erb :'reports/report_main'
end

# form for user to enter information to add report
get "/report_add_form" do
  erb :"/report_add_form"
end

# This pulls from the report main page, and sends the user to the report_add page.
# This page allows the user to add a new report name
get '/report_add' do
  if Report.valid?(params["location"], params["surroundings"], params["plant_treatment"], params["comments"], params["source_id"], params["group_id"])
    @error = true
    erb :"report_add_form"
  else
    @report.add_to_database
    erb :"/success/data_added"
  end
end

get '/report_list' do
  DATABASE.execute('SELECT * FROM reports;')
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