view: workout_state {
  sql_table_name: common.workout_state ;;
  drill_fields: [workout_state_id]

  dimension: workout_state_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}."workout_state_id" ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
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

  dimension: workout_state_uuid {
    hidden: yes
    type: string
    sql: ${TABLE}."workout_state_uuid" ;;
  }

  measure: count {
    type: count
    drill_fields: [workout_state_id, name]
  }

  set: servicer_set {
    fields: [name, description]
  }
}
