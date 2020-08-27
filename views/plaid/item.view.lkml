view: plaid_details {
  sql_table_name: plaid.item ;;
  drill_fields: [plaid_item_id]

  dimension: plaid_item_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."plaid_item_id" ;;
  }

  dimension: access_token {
    type: string
    sql: ${TABLE}."access_token" ;;
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

  dimension: institution_id {
    type: number
    sql: ${TABLE}."institution_id" ;;
  }

  dimension: item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."item_id" ;;
  }

  dimension: item_uuid {
    type: string
    sql: ${TABLE}."item_uuid" ;;
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

  dimension: webhook {
    type: string
    sql: ${TABLE}."webhook" ;;
  }
# put count + cost side by side
  measure: count {
    label: "Total Connections"
    type: count_distinct
    sql: ${plaid_item_id} ;;
    drill_fields: [plaid_item_id, item.plaid_item_id, item.count]
  }

  measure: total_cost {
    type: number
    sql: ${count} * 2.99 ;;
    value_format_name: usd_0
  }


}
