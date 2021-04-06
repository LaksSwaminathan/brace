view: document_group {
  sql_table_name: document.document_group ;;
  drill_fields: [document_group_id]

  dimension: document_group_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."document_group_id" ;;
  }

  dimension: document_group_type {
    type: string
    sql: ${TABLE}."document_group_type" ;;
  }

  measure: count {
    type: count
    drill_fields: [document_group_id]
  }
}
