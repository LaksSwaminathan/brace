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
    hidden: yes
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

  dimension: is_incomplete_application {
    type: yesno
    sql: ${borrower_to_loan_application.form710_signature_raw} is not NULL ;;
  }

  dimension: days_since_application_creation {
    type: number
    sql: DATE_PART('day', current_date - ${created_raw});;
  }

  dimension: days_to_submit {
    type: number
    sql: DATE_PART('day', ${created_raw}- ${borrower_to_loan_application.form710_signature_raw});;
  }

  dimension: days_to_submit_tier {
    type: tier
    tiers: [0,1,3,5]
    style: integer
    sql: ${days_to_submit} ;;
  }


  dimension: delinquency_id {
    type: number
    hidden: yes
    sql: ${TABLE}."delinquency_id" ;;
  }

  dimension: expenses_id {
    type: number
    hidden: yes
    sql: ${TABLE}."expenses_id" ;;
  }

  dimension: in_recourse {
    hidden: yes
    type: yesno
    sql: ${TABLE}."in_recourse" ;;
  }

  dimension: lien_position {
    hidden: yes
    type: string
    sql: ${TABLE}."lien_position" ;;
  }

  dimension: loan_id {
    type: number
    hidden: yes
    sql: ${TABLE}."loan_id" ;;
  }

  dimension: meets_fhlmc_uw_guidelines {
    hidden: yes
    type: yesno
    sql: ${TABLE}."meets_fhlmc_uw_guidelines" ;;
  }

  dimension: mode {
    type: string
    sql: initcap(CAST(${TABLE}."mode" AS VARCHAR)) ;;
  }

  dimension: prior_partial_claims {
    hidden: yes
    type: number
    sql: ${TABLE}."prior_partial_claims" ;;
  }

  dimension: property_condition {
    hidden: yes
    type: string
    sql: initcap(CAST(${TABLE}."property_condition" AS VARCHAR)) ;;
  }

  dimension: property_disposition_type_id {
    hidden: yes
    type: number
    sql: ${TABLE}."property_disposition_type_id" ;;
  }

  dimension: property_has_problems {
    hidden: yes
    type: yesno
    sql: ${TABLE}."property_has_problems" ;;
  }

  dimension: property_occupancy_status_id {
    hidden: yes
    type: number
    sql: ${TABLE}."property_occupancy_status_id" ;;
  }

  dimension: property_repair_cost {
    hidden: yes
    type: number
    sql: ${TABLE}."property_repair_cost" ;;
  }

  dimension: property_usage_type_id {
    hidden: yes
    type: number
    sql: ${TABLE}."property_usage_type_id" ;;
  }

  dimension: servicer_confirmed_down_payment_from_borrower {
    hidden: yes
    type: yesno
    sql: ${TABLE}."servicer_confirmed_down_payment_from_borrower" ;;
  }

  dimension: state {
    label: "Servicer State"
    type: string
    sql: initcap(CAST(${TABLE}."state" AS VARCHAR)) ;;
  }

  dimension: status {
    type: string
    sql: initcap(CAST(${TABLE}."status" AS VARCHAR)) ;;
  }

  dimension: subject_to_indemnification {
    hidden: yes
    type: yesno
    sql: ${TABLE}."subject_to_indemnification" ;;
  }

  dimension: terms_id {
    hidden: yes
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
    hidden: yes
    type: number
    sql: ${TABLE}."updated_by" ;;
  }

  dimension: workout_details_communicated {
    hidden: yes
    type: yesno
    sql: ${TABLE}."workout_details_communicated" ;;
  }

  measure: borrower_intent {
    type: number
    label: "(2) Borrower's Intent with Property"
    group_label: "Funnel Steps"
    sql: COUNT(${property_usage_type_id} IS NOT NULL) ;;
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
