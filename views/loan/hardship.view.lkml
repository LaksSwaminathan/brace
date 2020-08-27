view: hardship {
  sql_table_name: loan.hardship ;;
  drill_fields: [hardship_id]

  dimension: hardship_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."hardship_id" ;;
  }

  dimension: can_repay_missed_payments {
    type: yesno
    sql: ${TABLE}."can_repay_missed_payments" ;;
  }

  dimension: can_resume_full_payment {
    type: yesno
    sql: ${TABLE}."can_resume_full_payment" ;;
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

  dimension: disaster_id {
    type: number
    sql: ${TABLE}."disaster_id" ;;
  }

  dimension: document_group_id {
    type: number
    sql: ${TABLE}."document_group_id" ;;
  }

  dimension: duration_type_id {
    type: number
    sql: ${TABLE}."duration_type_id" ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."end_date" ;;
  }

  dimension: hardship_uuid {
    type: string
    sql: ${TABLE}."hardship_uuid" ;;
  }

  dimension: impacts_place_of_employment {
    type: yesno
    sql: ${TABLE}."impacts_place_of_employment" ;;
  }

  dimension: loan_application_id {
    type: number
    sql: ${TABLE}."loan_application_id" ;;
  }

  dimension: other_type_description {
    type: string
    sql: ${TABLE}."other_type_description" ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."start_date" ;;
  }

  dimension: type_id {
    type: number
    sql: ${TABLE}."type_id" ;;
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
    drill_fields: [hardship_id]
  }

  measure: hardship_count {
    type: number
    label: "(1) Hardship Type"
    view_label: "Application"
    group_label: "Funnel Steps"
    sql: COUNT(${type_id} IS NOT NULL) ;;
  }

  set: hardship_fields {
    fields: [
      start_date,
      end_date,
      can_repay_missed_payments,
      can_resume_full_payment,
      impacts_place_of_employment,
      other_type_description
      ]
  }
}
