view: hardship_duration_type {
  sql_table_name: common.hardship_duration_type ;;
  drill_fields: [hardship_duration_type_id]

  dimension: hardship_duration_type_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."hardship_duration_type_id" ;;
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

  dimension: description {
    label: "Hardship Duration Description"
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension: display_order {
    type: number
    sql: ${TABLE}."display_order" ;;
  }

  dimension: hardship_duration_type_uuid {
    type: string
    sql: ${TABLE}."hardship_duration_type_uuid" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: smdu_code {
    type: string
    sql: ${TABLE}."smdu_code" ;;
  }

  dimension: tooltip {
    type: string
    sql: ${TABLE}."tooltip" ;;
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
    drill_fields: [hardship_duration_type_id, name]
  }
}
