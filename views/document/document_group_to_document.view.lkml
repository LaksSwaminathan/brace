view: document_group_to_document {
  sql_table_name: mapping.document_group_to_document ;;

  dimension: document_group_id {
    type: number
    sql: ${TABLE}."document_group_id" ;;
  }

  dimension: document_id {
    type: number
    sql: ${TABLE}."document_id" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
