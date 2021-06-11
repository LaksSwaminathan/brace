###################################################################################################
#   PURPOSE: Models the loan.workout_history table
#
#   AUTHOR:  DATA CLYMER (www.dataclymer.com):  hello@dataclymer.com
#
#   DATE:  12/03/2020
#
#   NOTES:
#
###################################################################################################

view: workout_history {
  sql_table_name: loan.workout_history ;;
  drill_fields: [workout_history_id]

###################################################################################################
#
#   PRIMARY KEY
#
###################################################################################################

  dimension: workout_history_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."workout_history_id" ;;
  }

###################################################################################################
#
#   DIMENSIONS
#
###################################################################################################

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."created" ;;
  }

  dimension: created_by {
    type: number
    sql: ${TABLE}."created_by" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension_group: effective_as_of {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."effective_as_of" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."updated" ;;
  }

  dimension: updated_by {
    type: number
    sql: ${TABLE}."updated_by" ;;
  }

  dimension: workout_event_id {
    hidden: yes
    type: number
    sql: ${TABLE}."workout_event_id" ;;
  }

  dimension: has_opted_out_of_forbearance{
    type: yesno
    sql: ${workout_event_id} = 40 ;;
  }

  dimension: workout_history_uuid {
    hidden: yes
    type: string
    sql: ${TABLE}."workout_history_uuid" ;;
  }

  dimension: workout_id {
    hidden: yes
    type: number
    sql: ${TABLE}."workout_id" ;;
  }

  dimension: workout_state_id {
    hidden: yes
    type: number
    sql: ${TABLE}."workout_state_id" ;;
  }

###################################################################################################
#
#   MEASURES
#
###################################################################################################

  measure: count {
    type: count
    drill_fields: [workout_history_id, workout.workout_id, has_opted_out_of_forbearance]
  }

  set: workout_history {
    fields: [
      has_opted_out_of_forbearance
    ]
  }
}

# explore: workout_history {}
