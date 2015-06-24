# Create database for this program.
DATABASE = SQLite3::Database.new("water_safety.db")

# Make the tables
DATABASE.execute("CREATE TABLE IF NOT EXISTS reports (id INTEGER PRIMARY KEY, location TEXT, surroundings TEXT, plant_treatment TEXT, comments TEXT, source_id INTEGER, group_id INTEGER);")
DATABASE.execute("CREATE TABLE IF NOT EXISTS sources (id INTEGER PRIMARY KEY, name TEXT UNIQUE);")
DATABASE.execute("CREATE TABLE IF NOT EXISTS groups (id INTEGER PRIMARY KEY, name TEXT);")
DATABASE.execute("CREATE TABLE IF NOT EXISTS pollutants (id INTEGER PRIMARY KEY, name TEXT UNIQUE);")
DATABASE.execute("CREATE TABLE IF NOT EXISTS pollutants_reports (report_id INTEGER, pollutant_id INTEGER);")

# Return results as an Array of Hashes.
DATABASE.results_as_hash = true