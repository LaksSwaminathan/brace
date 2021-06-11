view: product_to_loan {
  sql_table_name: mapping.product_to_loan ;;
  drill_fields: [product_to_loan_id]

  dimension: product_to_loan_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."product_to_loan_id" ;;
  }

  dimension_group: active_as_of {
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
    sql: ${TABLE}."active_as_of" ;;
  }

  dimension: loan_id {
    type: number
    sql: ${TABLE}."loan_id" ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}."product_id" ;;
  }

  measure: count {
    type: count
    drill_fields: [product_to_loan_id]
  }
}
