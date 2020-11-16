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

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  dimension: application_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}."application_id" ;;
  }

  dimension_group: application_begin {
    view_label: "Application"
    type: time
    timeframes: [date, month, hour, year, raw]
    sql: ${TABLE}."application_begin_timestamp" ;;
  }

  dimension_group: application_completed {
    description: "Timestamp when a decision has been rendered, accepted, and an application has been marked as complete"
    view_label: "Application"
    type: time
    timeframes: [date, month, hour, year, raw]
    sql: ${TABLE}."application_completed_timestamp" ;;
  }

  set: detail {
    # fields: [application_id, application_begin_timestamp_time]
  }
}
