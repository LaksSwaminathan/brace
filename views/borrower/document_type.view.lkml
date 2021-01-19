view: document_type {
  sql_table_name: common.document_type ;;
  drill_fields: [document_type_id]

  dimension: document_type_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."document_type_id" ;;
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

  dimension: document_type_uuid {
    hidden: yes
    type: string
    sql: ${TABLE}."document_type_uuid" ;;
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

  dimension: upload_request_text {
    type: string
    sql: ${TABLE}."upload_request_text" ;;
  }

  measure: count {
    type: count
    drill_fields: [document_type_id, name]
  }

  set: document_type_fields {
    fields: [
      name,
      description
    ]
  }
}
