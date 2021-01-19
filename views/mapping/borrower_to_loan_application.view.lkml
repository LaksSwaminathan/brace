view: borrower_to_loan_application {
  sql_table_name: mapping.borrower_to_loan_application ;;

  dimension: borrower_to_loan_application_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."borrower_to_loan_application_id" ;;
  }

  dimension: borrower_id {
    hidden: yes
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
    view_label: "Application"
    label: "Hello Sign Signature"
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
    # hidden: yes
    type: string
    sql: initcap(CAST(${TABLE}."last_completed_step" AS VARCHAR)) ;;
  }

  dimension: loan_application_id {
    hidden: yes
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

  measure: borrower_count {
    type: count_distinct
    sql: ${borrower_id} ;;
  }


  measure: count_of_hello_sign {
    view_label: "Vendor Information"
    type: number
    label: "Hello Sign Signature Count"
    sql: COUNT(case when ${form710_signature_raw} IS NOT NULL then 1 end) ;;
  }

  measure: count_of_incomplete_application {
    type: number
    label: "Hello Sign Incomplete Signature Count"
    sql: COUNT(case when ${form710_signature_raw} IS NULL then 1 end) ;;
  }

  measure: submitted_application{
    hidden: yes
    type: number
    label: "(4) Submitted Application"
    view_label: "Application"
    group_label: "Funnel Steps"
    sql: COUNT(case when ${form710_signature_date} IS NOT NULL then 1 end) ;;
  }

  measure: total_cost {
    label: "Hello Sign Total Cost"
    type: number
    sql: ${count_of_hello_sign} * 0.67 ;;
    value_format_name: usd_0
  }

  set: hellosign_fields {
    fields: [
      total_cost,
      count_of_hello_sign,
    ]
  }

  set: details {
    fields: [
      borrower_count,
      form710_signature_date,
      last_completed_step,
      count_of_incomplete_application
    ]
  }

}
