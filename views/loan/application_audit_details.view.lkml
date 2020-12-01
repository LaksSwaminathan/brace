view: application_audit_details {
  derived_table: {
    sql:
      WITH completed AS (
        SELECT (row_data -> 'application_id')::INTEGER as application_id,
        action_tstamp_tx as application_completed_timestamp
        FROM audit.logged_actions
        WHERE table_name = 'application'
        AND action = 'U'
        AND changed_fields -> 'status' =  'COMPLETED'
      ),
      begin AS (
        SELECT (row_data -> 'application_id')::INTEGER as application_id,
        action_tstamp_tx as application_begin_timestamp
        FROM audit.logged_actions
        WHERE table_name = 'application'
        AND action = 'U'
        AND changed_fields -> 'status' =  'ACTIVE'
      )
      SELECT
        begin.application_id,
        application_begin_timestamp,
        application_completed_timestamp
      FROM begin
      left join completed on begin.application_id = completed.application_id;;
  }

###################################################################################################
#
#   PRIMARY KEY
#
###################################################################################################

  dimension: application_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}."application_id" ;;
  }

###################################################################################################
#
#   DIMENSIONS
#
###################################################################################################

  dimension_group: application_begin {
    view_label: "Application"
    type: time
    timeframes: [date, month, hour, year, raw]
    sql: ${TABLE}."application_begin_timestamp" ;;
  }

  dimension_group: application_status_completed {
    hidden: yes
    description: "Timestamp when the application status is moved to complete"
    view_label: "Application"
    type: time
    timeframes: [date, month, hour, year, raw]
    sql: ${TABLE}."application_completed_timestamp" ;;
  }

  dimension_group: application_completed {
    description: "Timestamp when the application is e-signed OR marked as complete"
    view_label: "Application"
    type: time
    timeframes: [date, month, hour, year, raw]
    sql: COALESCE(${borrower_to_loan_application.form710_signature_raw}, ${application_status_completed_raw});;
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
