view: application_details {

  derived_table: {
    explore_source: application {
      column: application_id {}
      column: count { field: document.count }
      column: login_count { field: login.count }
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

  dimension: has_logged_in {
    type: yesno
    sql: ${TABLE}.login_count > 0  ;;
  }

  measure: average_document_upload {
    type: average
    sql: ${document_count} ;;
  }

  set: detail {
    fields: [application_id, document_count]
  }
}
