view: expense {
  sql_table_name: borrower.expense ;;
  drill_fields: [expense_id]

  dimension: expense_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."expense_id" ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}."amount" ;;
  }

  dimension: borrower_to_loan_application_id {
    type: number
    sql: ${TABLE}."borrower_to_loan_application_id" ;;
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

  dimension: document_group_id {
    type: number
    sql: ${TABLE}."document_group_id" ;;
  }

  dimension: expense_type_id {
    type: number
    sql: ${TABLE}."expense_type_id" ;;
  }

  dimension: expense_uuid {
    type: string
    sql: ${TABLE}."expense_uuid" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: plaid_account_id {
    type: number
    sql: ${TABLE}."plaid_account_id" ;;
  }

  dimension: silenced {
    type: yesno
    sql: ${TABLE}."silenced" ;;
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
    drill_fields: [expense_id, name]
  }
}
