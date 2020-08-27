view: application {
  sql_table_name: loan.application ;;
  drill_fields: [application_id]

  dimension: application_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."application_id" ;;
  }

  dimension: application_uuid {
    hidden: yes
    type: string
    sql: ${TABLE}."application_uuid" ;;
  }

  dimension: cash_contribution_prohibited {
    type: yesno
    sql: ${TABLE}."cash_contribution_prohibited" ;;
  }

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

  dimension: delinquency_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."delinquency_id" ;;
  }

  dimension: expenses_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."expenses_id" ;;
  }

  dimension: in_recourse {
    type: yesno
    sql: ${TABLE}."in_recourse" ;;
  }

  dimension: lien_position {
    type: string
    sql: ${TABLE}."lien_position" ;;
  }

  dimension: loan_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."loan_id" ;;
  }

  dimension: meets_fhlmc_uw_guidelines {
    type: yesno
    sql: ${TABLE}."meets_fhlmc_uw_guidelines" ;;
  }

  dimension: mode {
    type: string
    sql: ${TABLE}."mode" ;;
  }

  dimension: prior_partial_claims {
    type: number
    sql: ${TABLE}."prior_partial_claims" ;;
  }

  dimension: property_condition {
    type: string
    sql: ${TABLE}."property_condition" ;;
  }

  dimension: property_disposition_type_id {
    type: number
    sql: ${TABLE}."property_disposition_type_id" ;;
  }

  dimension: property_has_problems {
    type: yesno
    sql: ${TABLE}."property_has_problems" ;;
  }

  dimension: property_occupancy_status_id {
    type: number
    sql: ${TABLE}."property_occupancy_status_id" ;;
  }

  dimension: property_repair_cost {
    type: number
    sql: ${TABLE}."property_repair_cost" ;;
  }

  dimension: property_usage_type_id {
    type: number
    sql: ${TABLE}."property_usage_type_id" ;;
  }

  dimension: servicer_confirmed_down_payment_from_borrower {
    hidden: yes
    type: yesno
    sql: ${TABLE}."servicer_confirmed_down_payment_from_borrower" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: subject_to_indemnification {
    hidden: yes
    type: yesno
    sql: ${TABLE}."subject_to_indemnification" ;;
  }

  dimension: terms_id {
    type: number
    sql: ${TABLE}."terms_id" ;;
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

  dimension: workout_details_communicated {
    hidden: yes
    type: yesno
    sql: ${TABLE}."workout_details_communicated" ;;
  }

  measure: count {
    type: count
    drill_fields: [application_id, loan.loan_id, delinquency.delinquency_id, expenses.expenses_id]
  }

  set: application {
    fields: [

    ]
  }
}
