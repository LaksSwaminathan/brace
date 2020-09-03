view: income {
  sql_table_name: borrower.income ;;
  drill_fields: [income_id]

  dimension: income_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."income_id" ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}."amount" ;;
  }

  dimension: borrower_to_loan_application_id {
    hidden: yes
    type: number
    sql: ${TABLE}."borrower_to_loan_application_id" ;;
  }

  dimension_group: created {
    hidden: yes
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
    hidden: yes
    type: number
    sql: ${TABLE}."created_by" ;;
  }

  dimension: document_group_id {
    hidden: yes
    type: number
    sql: ${TABLE}."document_group_id" ;;
  }

  dimension: income_type_id {
    hidden: yes
    type: number
    sql: ${TABLE}."income_type_id" ;;
  }

  dimension: income_uuid {
    hidden: yes
    type: string
    sql: ${TABLE}."income_uuid" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: silenced {
    hidden: yes
    type: yesno
    sql: ${TABLE}."silenced" ;;
  }

  dimension_group: updated {
    hidden: yes
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

  measure: total_income {
    type: sum
    sql: ${amount} ;;
  }

  measure: count {
    type: count
  }

#   measure: count {
#     type: count_distinct
#     sql: ${borrower_to_loan_application_id} ;;
#     drill_fields: [income_id, name]
#   }

  measure: income_specified{
    type: number
    label: "(3) Income Specified"
    view_label: "Application"
    group_label: "Funnel Steps"
    sql: COUNT(${amount} IS NOT NULL) ;;
  }

}
