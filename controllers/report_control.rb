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
  # new_report_id is the Integer returned from the add method
   new_report_id = Report.add({"location" => params["location"], "surroundings" => params["surroundings"], "plant_treatment" => params["plant_treatment"], "comments" => params["comments"], "source_id" => params["source_id"], "group_id" => params["group_id"]})
  
   if new_report_id
     @new_report = report.find_as_object(new_report_id)
   else
     @error = true
     erb :"reports/add_report_form"
   end
  erb :"/success/data_added"
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