view: hardship_type_to_document_type {
  sql_table_name: mapping.hardship_type_to_document_type ;;
  drill_fields: [hardship_type_to_document_type_id]

  dimension: hardship_type_to_document_type_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."hardship_type_to_document_type_id" ;;
  }

  dimension: document_type_id {
    type: number
    sql: ${TABLE}."document_type_id" ;;
  }

  dimension: hardship_type_id {
    type: number
    sql: ${TABLE}."hardship_type_id" ;;
  }

  measure: count {
    type: count
    drill_fields: [hardship_type_to_document_type_id]
  }
}
