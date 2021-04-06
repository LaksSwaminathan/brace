view: income_type_to_document_type {
  sql_table_name: mapping.income_type_to_document_type ;;
  drill_fields: [income_type_to_document_type_id]

  dimension: income_type_to_document_type_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."income_type_to_document_type_id" ;;
  }

  dimension: document_type_id {
    type: number
    sql: ${TABLE}."document_type_id" ;;
  }

  dimension: income_type_id {
    type: number
    sql: ${TABLE}."income_type_id" ;;
  }

  measure: count {
    type: count
    drill_fields: [income_type_to_document_type_id]
  }
}
