view: workout_event {
  sql_table_name: common.workout_event ;;
  drill_fields: [workout_event_id]

  dimension: workout_event_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.workout_event_id ;;
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
    sql: ${TABLE}.created ;;
  }

  dimension: created_by {
    type: number
    sql: ${TABLE}.created_by ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: smdu_code {
    type: number
    sql: ${TABLE}.smdu_code ;;
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
    sql: ${TABLE}.updated ;;
  }

  dimension: updated_by {
    type: number
    sql: ${TABLE}.updated_by ;;
  }

  dimension: workout_event_uuid {
    type: string
    sql: ${TABLE}.workout_event_uuid ;;
  }

  measure: count {
    type: count
    drill_fields: [workout_event_id, name]
  }
}
