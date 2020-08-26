view: equifax_report {
  sql_table_name: credit.report ;;
  drill_fields: [report_id]

  dimension: report_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."report_id" ;;
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

  dimension: equifax_score {
    type: number
    sql: ${TABLE}."equifax_score" ;;
  }

  dimension: experian_score {
    type: number
    sql: ${TABLE}."experian_score" ;;
  }

  dimension_group: first_issued {
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
    sql: ${TABLE}."first_issued_date" ;;
  }

  dimension: report_uuid {
    type: string
    sql: ${TABLE}."report_uuid" ;;
  }

  dimension: request_payload {
    type: string
    sql: ${TABLE}."request_payload" ;;
  }

  dimension: response_payload {
    type: string
    sql: ${TABLE}."response_payload" ;;
  }

  dimension: service {
    type: string
    sql: ${TABLE}."service" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."state" ;;
  }

  dimension: transunion_score {
    type: number
    sql: ${TABLE}."transunion_score" ;;
  }

  measure: number_of_completed_equifax_pulls {
    type: count
    drill_fields: [report_id]
  }
}
