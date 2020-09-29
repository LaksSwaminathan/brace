explore: application_details {}
view: application_details {

  derived_table: {
    explore_source: application {
      column: count { field: document.count }
      column: application_id {}
    }
#     persist_for: "24 hours"
  }

  dimension: application_id {
    type: number
  }

  dimension: document_count {
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension: document_count_tier {
    type: tier
    style: integer
    tiers: [1,2,3,5]
    sql: ${TABLE}.count ;;
  }

  measure: average_document_upload {
    type: average
    sql: ${document_count} ;;
  }

  set: detail {
    fields: [application_id, document_count]
  }
}
