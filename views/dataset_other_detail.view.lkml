view: dataset_other_detail {
  sql_table_name: finwater.dataset_other_detail ;;

  dimension: dataset_id {
    type: number
    sql: ${TABLE}."dataset_id" ;;
  }

  dimension: other_detail_id {
    type: number
    sql: ${TABLE}."other_detail_id" ;;
  }

  dimension: position {
    type: number
    sql: ${TABLE}."position" ;;
  }

  dimension: raw_value {
    type: string
    sql: ${TABLE}."raw_value" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
