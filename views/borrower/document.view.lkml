view: document {
  sql_table_name: borrower.document ;;
  drill_fields: [document_id]

  dimension: document_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."document_id" ;;
  }

  dimension: application_id {
    hidden: yes
    type: number
    sql: ${TABLE}."application_id" ;;
  }

  dimension: content {
    hidden: yes
    type: string
    sql: ${TABLE}."content" ;;
  }

  dimension: content_type {
    type: string
    sql: ${TABLE}."content_type" ;;
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

  dimension: document_type_id {
    hidden: yes
    type: number
    sql: ${TABLE}."document_type_id" ;;
  }

  dimension: document_uuid {
    hidden: yes
    type: string
    sql: ${TABLE}."document_uuid" ;;
  }

  dimension: file_name {
    type: string
    sql: ${TABLE}."file_name" ;;
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
    drill_fields: [document_id, file_name]
  }

  set: document_fields {
    fields: [
      file_name,
      content,
      content_type,
      created_date,
      updated_date
    ]
  }
}
