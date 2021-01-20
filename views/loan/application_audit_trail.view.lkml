###################################################################################################
#   PURPOSE: To define a derived table allowing for the calculation of time spent in each state
#
#   AUTHOR:  DATA CLYMER (www.dataclymer.com):  hello@dataclymer.com
#
#   DATE:  12/16/2020
#
#   NOTES:
#
###################################################################################################

view: application_audit_trail {
  derived_table: {
    # datagroup_trigger: application_audit_dg
    sql:
    SELECT *
    FROM (
        SELECT bat.*
            , (bat2.changed_date - bat.changed_date) AS time_spent_in_state
        FROM ${application_audit_trail_base.SQL_TABLE_NAME} bat
        LEFT JOIN (
            SELECT application_id
                , changed_date
                , record
            FROM ${application_audit_trail_base.SQL_TABLE_NAME}
            ) bat2
            ON bat.application_id::BIGINT = bat2.application_id::BIGINT
                AND bat.record + 1 = bat2.record
        INNER JOIN (
            SELECT application_id
                , created
            FROM loan.application
            ) app
            ON app.application_id::BIGINT = bat2.application_id::BIGINT

        UNION

        SELECT bat.application_id
            , app.created AS changed_date
            , 'CREATED' AS prior_state
            , 'COLLECTING' AS new_state
            , 0 AS record
            , bat.changed_date - app.created AS time_spent_in_state
        FROM ${application_audit_trail_base.SQL_TABLE_NAME} bat
        INNER JOIN (
            SELECT application_id
                , created
            FROM loan.application
            ) app
            ON app.application_id::BIGINT = bat.application_id::BIGINT
        WHERE bat.record = 1
        ) t
    ORDER BY t.application_id
        , t.record;;
  }


###################################################################################################
#
#   PRIMARY KEY
#
###################################################################################################

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: ${application_id} || ${record} ;;
  }

  dimension: application_id {
    type: number
    sql: ${TABLE}.application_id ;;
  }

  dimension: record {
    type: number
    sql: ${TABLE}.record ;;
  }

###################################################################################################
#
#   DIMENSIONS
#
###################################################################################################

  dimension: prior_state {
    type: string
    sql: ${TABLE}.prior_state ;;
  }

  dimension: new_state {
    type: string
    sql: ${TABLE}.new_state ;;
  }

  dimension_group: state_changed {
    type: time
    timeframes: [raw, hour, date, week, month, year]
    sql: ${TABLE}.changed_date ;;
  }

  dimension_group: spent_in_state {
    type: duration
    intervals: [second, minute, hour, day, week, month, quarter, year]
    sql_start: localtimestamp ;;
    sql_end: localtimestamp + ${TABLE}.time_spent_in_state ;;
  }

###################################################################################################
#
#   MEASURES
#
###################################################################################################

  measure: avg_seconds_in_state {
    group_label: "Average Time In State"
    type: average
    sql: ${seconds_spent_in_state};;
    value_format_name: decimal_2
  }
  measure: avg_mins_in_state {
    group_label: "Average Time In State"
    type: average
    sql: ${minutes_spent_in_state};;
    value_format_name: decimal_2
  }

  measure: avg_hours_in_state {
    group_label: "Average Time In State"
    type: average
    sql: ${hours_spent_in_state};;
    value_format_name: decimal_2
  }
  measure: avg_days_in_state {
    group_label: "Average Time In State"
    type: average
    sql: ${days_spent_in_state};;
    value_format_name: decimal_2
  }
  measure: avg_weeks_in_state {
    group_label: "Average Time In State"
    type: average
    sql: ${weeks_spent_in_state};;
    value_format_name: decimal_2
  }

}
