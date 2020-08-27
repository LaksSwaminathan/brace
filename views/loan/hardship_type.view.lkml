view: hardship_type {
  sql_table_name: common.hardship_type ;;
  drill_fields: [hardship_type_id]

  dimension: hardship_type_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."hardship_type_id" ;;
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
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension: display_order {
    type: number
    sql: ${TABLE}."display_order" ;;
  }

  dimension: hardship_type_uuid {
    type: string
    sql: ${TABLE}."hardship_type_uuid" ;;
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

  dimension: visible {
    type: yesno
    sql: ${TABLE}."visible" ;;
  }

  measure: count {
    type: count
    drill_fields: [hardship_type_id, name]
  }

  set: hardship_type_fields {
    fields: [
      name,
      tooltip,
      smdu_code,
      description
    ]
  }
}
