# This pulls from the main page, and sends the user to the report_main page.
get '/' do
  erb :'reports/report_main'
end

# form for user to enter information to add report
get "/report_add_form" do
  erb :"/reports/report_add_form"
end

# This pulls from the report main page, and sends the user to the report_add page.
# This page allows the user to add a new report name
get '/report_add' do
  Report.add("location" => params["location"], "surroundings" => params["surroundings"], "plant_treatment" => params["plant_treatment"], "comments" => params["comments"], "source_id" => params["source_id"], "group_id" => params["group_id"])
  erb :"/success/data_added"
end

