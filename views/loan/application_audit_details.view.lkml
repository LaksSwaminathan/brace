view: application_audit_details {
  derived_table: {
    sql:

    SELECT
        (row_data -> 'application_id')::INTEGER as application_id,
        action_tstamp_tx as application_begin_timestamp

      FROM audit.logged_actions
      WHERE table_name = 'application'
        AND action = 'U'
        AND changed_fields -> 'status' = 'ACTIVE'
        -- AND row_data -> 'application_id' = '5'
       ;;
  }

###################################################################################################
#
#   PRIMARY KEY
#
###################################################################################################

  dimension: application_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}."application_id" ;;
  }

###################################################################################################
#
#   DIMENSIONS
#
###################################################################################################

  dimension_group: application_begin {
    # view_label: "Application"
    type: time
    timeframes: [date, month, hour, year, raw]
    sql: ${TABLE}."application_begin_timestamp" ;;
  }

###################################################################################################
#
#   MEASURES
#
###################################################################################################

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

###################################################################################################
#
#   SETS
#
###################################################################################################

  set: detail {
    # fields: [application_id, application_begin_timestamp_time]
  }
}
