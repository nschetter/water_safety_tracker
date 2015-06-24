# This listener pulls from the main page, and sends the user to the genre_main page.
get '/genre' do
  erb :'genre/genre_main'
end
# This listener pulls from the genre main page, and sends the user to the genre_add page.
# This page allows the user to add a new unique genre name
get '/genre_add' do
  erb :'genre/genre_add'
end
# This listener pulls from the genre main page, and sends the user to the genre_change page.
# This page allows the user to change the name of a genre unattached to a game.
get '/genre_change' do
  erb :'genre/genre_change'
end
# This listener pulls from the genre main page, and sends the user to the genre_read page.
# This page lists all of the genre's in the DB
get '/genre_read' do
  erb :'genre/genre_read'
end
# This listener pulls from the genre main page, and sends the user to the genre_delete page.
# This page allows the user to delete a genre unattached to a game
get '/genre_delete' do
  erb :'genre/genre_delete'
end
# This listener pulls from the genre main page, and sends the user to the genre_games page.
# This page will request a certain genre, and will direct the user to a page showing a list
# of all the games in that genre
get '/genre_games' do
  erb :'genre/genre_games'
end
# This listener pulls from the genre_add.erb page.  It grabs the genre_name from
# the input form there and then checks to see if the name is already in the DB
# 
# If it is a new genre, it adds it and sends the user to the Success page listed
# 
# If it is a genre already there, it sends the user to the Error page listed
get '/genre_add_to_database' do
  add_hash = {"name" => params["genre_name"]}
  test = Genre.all
  test_names = []
  
  test.each do |item|
    test_names << item.name
  end
  
  if test == []
    Genre.add(add_hash)
    erb :"success/data_added"
  elsif !test_names.include?(params["genre_name"])
    Genre.add(add_hash)
    erb :"success/data_added"
  elsif params["genre_name"] == "" 
    erb :"error/no_data_in_field"
  else
    erb :"error/data_exists"
  end
end
# This listener pulls from the genre_change.erb page.  It grabs the genre_to_change,
# an ID of the genre row we want to work with, and brings back an Object synched with the
# corresponding row in the DB.
# 
# It then changes the name attribute for that Object, and saves the change back to the DB.\
# 
# Once we add the games table, it will check to see if the genre has games attached.  If it
# does not, the change goes through and the user is sent to the Success page.
# 
# If games are attached, it sends the user to the Error page.
get '/genre_change_in_database' do
#  if Genre.games_in_genre(params["genre_to_change"]) == []
    change_genre = Genre.find(params["genre_to_change"])
    change_genre.name = params["new_genre_name"]
    
    change_genre.save
    erb :"success/data_changed"
#  else
#    erb :"error/data_exists"
#  end
end