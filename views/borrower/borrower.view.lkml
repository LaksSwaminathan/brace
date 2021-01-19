view: borrower {
  sql_table_name: borrower.borrower ;;
  drill_fields: [borrower_id]

  dimension: borrower_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}."borrower_id" ;;
  }

  dimension: borrower_uuid {
    hidden: yes
    type: string
    sql: ${TABLE}."borrower_uuid" ;;
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
    hidden: yes
    type: number
    sql: ${TABLE}."created_by" ;;
  }

  dimension: encrypted_ssn {
    hidden: yes
    type: string
    sql: ${TABLE}."encrypted_ssn" ;;
  }

  dimension: file_this_account_id {
    hidden: yes
    type: number
    sql: ${TABLE}."file_this_account_id" ;;
  }

  dimension: file_this_token {
    hidden: yes
    type: string
    sql: ${TABLE}."file_this_token" ;;
  }

  dimension: last_four_ssn {
    hidden: yes
    type: string
    sql: ${TABLE}."last_four_ssn" ;;
  }

  dimension: sor_last_four_ssn {
    hidden: yes
    type: string
    sql: ${TABLE}."sor_last_four_ssn" ;;
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

  dimension: user_id {
    hidden: yes
    type: number
    sql: ${TABLE}."user_id" ;;
  }

  measure: count_filethis_accounts {
    view_label: "Vendor Information"
    label: "FileThis Account Count"
    type: count_distinct
    sql: ${file_this_account_id} ;;
    drill_fields: [borrower_id]
  }

  measure: total_filethis_cost {
    view_label: "Vendor Information"
    label: "FileThis Total Cost"
    type: number
    sql: ${count_filethis_accounts}*4 ;;
    value_format_name: usd_0
  }


}
