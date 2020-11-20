view: application_details_recommended {
  derived_table: {
    sql:  SELECT row_data -> 'application_id' AS application_id, action_tstamp_tx AS recommended_date
          FROM audit.logged_actions
          WHERE table_name = 'application'
            AND action = 'U'
            AND changed_fields -> 'state' = 'OPTION_RECOMMENDED'
          GROUP BY 1,2 ;;
  }

###################################################################################################
#
#   PRIMARY KEY
#
###################################################################################################
  dimension: primary_key {
    hidden: yes
    primary_key: yes
    sql: ${application_id} || ${recommended_raw};;
  }

###################################################################################################
#
#   DIMENSIONS
#
###################################################################################################

  dimension: application_id {
    hidden: yes
    type: number
    sql: ${TABLE}.application_id ;;
  }

  dimension_group: recommended {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.recommended_date ;;
  }

}
