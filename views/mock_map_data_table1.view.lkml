# The name of this view in Looker is "Mock Map Data Table1"
view: mock_map_data_table1 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `hcls2-ship-demo-dev.mock_map_data_dataset.mock_map_data_table1` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Active" in Explore.

  #dimension: info_zip_code {
  # type: string
  #  sql: ${TABLE}.info_zip_code ;;
  #  map_layer_name:madrid
  #}

  #dimension: info_town {
  #  type: string
  #  sql: ${TABLE}.info_town ;;
  #  map_layer_name: municipios_madrid
  #}



  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: patient {
    type: string
    sql: ${TABLE}.patient ;;
  }

  dimension: region {
    type: string
    map_layer_name: region_map
    sql: ${TABLE}.region ;;
    drill_fields: [zipcode ]
  }


  dimension: territory {
    type: string
    sql: ${TABLE}.territory ;;
    map_layer_name: territory_map
    drill_fields: [region, zipcode ]
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
    map_layer_name:us_zipcode_tabulation_areas
  }
  measure: count {
    type: count
  }
}
