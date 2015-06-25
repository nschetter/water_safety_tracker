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
  Report.add("first_name" => params["first_name"], "last_name" => params["last_name"], "nickname" => params["nickname"])
  erb :"/success/data_added"
end