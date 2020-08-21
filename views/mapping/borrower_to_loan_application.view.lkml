view: borrower_to_loan_application {
  sql_table_name: mapping.borrower_to_loan_application ;;
  drill_fields: [borrower_to_loan_application_id]

  dimension: borrower_to_loan_application_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."borrower_to_loan_application_id" ;;
  }

  dimension: borrower_id {
    type: number
    sql: ${TABLE}."borrower_id" ;;
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

  dimension: currently_receives_scra_relief {
    type: yesno
    sql: ${TABLE}."currently_receives_scra_relief" ;;
  }

  dimension_group: form710_signature {
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
    sql: ${TABLE}."form710_signature_date" ;;
  }

  dimension: hellosign_signature_request_id {
    type: string
    sql: ${TABLE}."hellosign_signature_request_id" ;;
  }

  dimension: is_active_duty {
    type: yesno
    sql: ${TABLE}."is_active_duty" ;;
  }

  dimension: last_completed_step {
    type: string
    sql: ${TABLE}."last_completed_step" ;;
  }

  dimension: loan_application_id {
    type: number
    sql: ${TABLE}."loan_application_id" ;;
  }

  dimension: new_mortgage_obtained {
    type: yesno
    sql: ${TABLE}."new_mortgage_obtained" ;;
  }

  dimension: preferred_contact_method {
    type: string
    sql: ${TABLE}."preferred_contact_method" ;;
  }

  dimension: previously_received_scra_relief {
    type: yesno
    sql: ${TABLE}."previously_received_scra_relief" ;;
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

  measure: count {
    type: count
    drill_fields: [borrower_to_loan_application_id]
  }
}
