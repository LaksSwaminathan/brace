view: disaster {
  sql_table_name: common.disaster ;;
  drill_fields: [disaster_id]

  dimension: disaster_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}."disaster_id" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [hour_of_day,
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

  dimension: is_covid {
    type: yesno
    sql: LOWER(${disaster_name}) LIKE '%ovid%' ;;
  }

  dimension: disaster_uuid {
    hidden: yes
    type: string
    sql: ${TABLE}."disaster_uuid" ;;
  }

  dimension_group: fema_declaration {
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
    sql: ${TABLE}."fema_declaration_date" ;;
  }

  dimension: fema_disaster_number {
    type: number
    sql: ${TABLE}."fema_disaster_number" ;;
  }

  dimension: fema_disaster_type {
    type: string
    sql: ${TABLE}."fema_disaster_type" ;;
  }

  dimension: fema_incident_type {
    type: string
    sql: ${TABLE}."fema_incident_type" ;;
  }

  dimension_group: incident_begin {
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
    sql: ${TABLE}."incident_begin_date" ;;
  }

  dimension_group: incident_end {
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
    sql: ${TABLE}."incident_end_date" ;;
  }

  dimension: disaster_name {
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

  measure: count {
    type: count
    drill_fields: [disaster_id, disaster_name]
  }

  set: diaster_fields {
    fields: [
      is_covid,
      disaster_name,
      fema_declaration_date,
      fema_disaster_type,
      fema_incident_type,
      incident_begin_date,
      incident_end_date
    ]
  }
}
