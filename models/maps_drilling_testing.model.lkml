# Define the database connection to be used for this model.
connection: "looker-private-demo"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: maps_drilling_testing_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: maps_drilling_testing_default_datagroup
explore: mock_map_data_table4 {}

map_layer: territory_map {
  file: "/maps_json/territory.json"
}

map_layer: region_map {
  file: "/maps_json/region.json"
}
