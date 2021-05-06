view: workout {
  sql_table_name: loan.workout ;;
  drill_fields: [workout_id]

###################################################################################################
#
#   PRIMARY KEY
#
###################################################################################################

  dimension: workout_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."workout_id" ;;
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

  dimension: disaster_id {
    type: number
    sql: ${TABLE}."disaster_id" ;;
  }

  dimension: forbearance_period {
    type: number
    sql: ${TABLE}."forbearance_period" ;;
  }

  dimension: loan_application_id {
    hidden: yes
    type: number
    sql: ${TABLE}."loan_application_id" ;;
  }

  dimension: repayment_plan_period {
    type: number
    sql: ${TABLE}."repayment_plan_period" ;;
  }

  dimension: rules_execution_id {
    type: number
    sql: ${TABLE}."rules_execution_id" ;;
  }

  dimension: sor_identifier {
    label: "Plan Name"
    type: string
    sql: COALESCE(SUBSTRING(${TABLE}."sor_identifier" from '\|.*\|T:(.*)'),${TABLE}."sor_identifier") ;;
  }

  dimension: terms {
    type: string
    sql: ${TABLE}."terms" ;;
  }

  dimension: trial_payment_plan_period {
    type: number
    sql: ${TABLE}."trial_payment_plan_period" ;;
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

  dimension: workout_type_id {
    hidden: yes
    type: number
    sql: ${TABLE}."workout_type_id" ;;
  }

  dimension: workout_uuid { # should this be our unique identifier instead?
    hidden: yes
    type: string
    sql: ${TABLE}."workout_uuid" ;;
  }

  dimension: forbearance_start_date {
    type: date
    sql: ${TABLE}."forbearance_start_date" ;;
  }

  dimension: forbearance_end_date {
    type: date
    sql: ${TABLE}."forbearance_end_date" ;;
  }


###################################################################################################
#
#   MEASURES
#
###################################################################################################

  measure: count {
    type: count
    drill_fields: [workout_id, workout_history.count]
  }
}
