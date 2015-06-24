#Water Safety Tracker

The objective of this application is to track the safety of local drinking water. 

A group or class may use this application to report their findings in a local water source. They will report their exact location as well as where that particular location draws it's drinking water from. This group or class will describe the surroundings of the water source. This description will state if there is a foundry, plant, or some type of pollution nearby. It can also state if the area appears to be pollutant-free. Then, the group will include a suggestion of a water treatment plant to treat the water. Additional comments may be included by the group or class in a particular report. The goal is to assess the water supplies globally as more data enters the database.

For example: Mr. Smith's class decides to take his 3rd grade class to the Maumee River in Toledo, Ohio to analyze the water's safety. Considering his class is fairly young, the results of their analysis will be relatively simple. His class reports the surroundings as having traces of litter and this is entered into the surroundings column of the reports table. They will also report what the local water treatment plant recommends to treat the water, and add any additional comments or observations they might have. The treatment plant's suggestion will be based on the pollutant that is found in the water source. The pollutant id will be linked with a report id in the pollutant_reports table, so that we can draw a parallel between the pollutant and what the water treatment plant suggested to treat the pollutant with. Groups may have multiple reports, but a single report can't have multiple groups.

##Description

The tables included with the application are:

* A table of reports with columns of id, source, surroundings, plant_treatment, and comments. The source is the location from which the water comes. The surroundings column is a description of what the surroundings look like around the water source. The plant_treatment is the suggestion of a water treatment plant to treat the water source(defaults at unknown). The comments column includes anything the group may want to add.
* A table of locations with columns of id and name
* A table of groups with columns of id and name
* A table of pollutants with columns of id and name
* A table of pollutant_reports with columns of report_id and pollutant_id
* A table of group_reports with columns of group_id and report_id

The pollutant_reports and group_reports tables have many to many relationships; they form a bridge between the pollutants and reports tables form a bridge between the groups and reports tables respectively.

##Should Cases
* Add, remove, edit, or delete reports
* Add, remove, edit, or delete pollutants
* Add, remove, edit, or delete locations
* Add, remove, edit, or delete groups
* View all data in the reports table, locations table, or groups table
* Search all reports by a single group or by a single location
* Search all reports by their source

##Shouldn't Cases
* Remove a group while a group_id exists in the group_reports table
* Add a report without filling all of the fields in
* Remove a report while a report_id exists in the pollutant_reports table
* A single group shouldn't share a report_id of another group in the group_reports table

##Requirements
* At least three models
* At least one one-to-many relationship
* At least one many-to-many relationship
* Unit tests for all business logic
* Ability to fully interact with the application from the browser