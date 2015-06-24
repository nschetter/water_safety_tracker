#Water Safety Tracker

The objective of this application is to track the safety of local drinking water. 

A group or class may use this application to report their findings in a local water source. They will report their particular location, then describe the surroundings of the water source. This description will state if there is a foundry, plant, or some type of pollution nearby. It can also state if the area appears to be pollutant-free. Then, the group will include a suggestion of a water treatment plant to treat the water. Additional comments may be included by the group or class in a particular report. The goal is to assess the water supplies globally as more data enters the database.

For example: Mr. Smith's class decides to take his 3rd grade class to the Maumee River 

##Description

The tables included with the application are:

* A table of reports with columns of id, surroundings, plant_treatment, comments, source_id, and group_id. The surroundings column is a description of what the surroundings look like around the water source. The plant_treatment is the suggestion of a water treatment plant to treat the water source(defaults at unknown). The comments column includes anything the group may want to add(defaults at none).
* A table of sources with columns of id and name
* A table of groups with columns of id and name
* A table of pollutants with columns of id and name
* A table of pollutants_reports with columns of report_id and pollutant_id

The pollutant_reports has a many to many relationship; it forms a bridge between the pollutants and reports tables.

##Should Cases
* Add, remove, edit, or delete reports
* Add, remove, edit, or delete pollutants
* Add, remove, edit, or delete groups
* Add, remove, edit, or delete sources
* View all data in the reports table, pollutants table, sources, or groups table
* Search all reports by their source
* Search all reports by a group

##Shouldn't Cases
* Add a report without filling all of the fields in
* Remove a report while a report_id exists in the pollutant_reports table

##Requirements
* At least three models
* At least one one-to-many relationship
* At least one many-to-many relationship
* Unit tests for all business logic
* Ability to fully interact with the application from the browser